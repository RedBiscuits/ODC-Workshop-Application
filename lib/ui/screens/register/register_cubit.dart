import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/grade_model.dart';
import 'package:login/data/models/register_model.dart';
import 'package:login/data/models/university_model.dart';
import 'package:login/data/network/end_points.dart';
import 'package:meta/meta.dart';

import '../../../data/network/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  UniversityModel? universityModel;
  GradeModel? gradeModel;
  List<String> universityList = [];
  List<String> gradeList = [];
  String? genderDropDownItem = null;
  String? gradeDropDownItem = null;
  String? universityDropDownItem = null;

  Future getData() async {
    emit(GettingData());
    DioHelper.getData(url: universityEndPoint).then((value) {
      if (value.statusCode == 200) {
        universityModel = UniversityModel.fromJson(value.data);
        for (int i = 0; i < universityModel!.data!.length; i++) {
          universityList.add(universityModel!.data![i].name!);
        }
        emit(RegisterDataLoading());
      } else {
        print(value.statusCode);
        emit(RegisterGetDataFail());
      }
    });
    DioHelper.getData(url: gradeEndPoint).then((value) {
      if (value.statusCode == 200) {
        gradeModel = GradeModel.fromJson(value.data);
        for (int i = 0; i < gradeModel!.data!.length; i++) {
          gradeList.add(gradeModel!.data![i].grade!);
        }
        emit(RegisterGotData());
      } else {
        print(value.statusCode);
        emit(RegisterGetDataFail());
      }
    });
  }

  RegisterModel? registerModel;

  Future signUp(
      {required email,
      required password,
      required name,
      required gender,
      required phoneNumber,
      required universityId,
      required gradeId}) async {
    emit(RegisterLoading());
    var data = {
      "email": email,
      "name": name,
      "password": password,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'universityId': universityId,
      'gradeId': gradeId,
      'roleId': 2
    };
    DioHelper.postData(url: registerEndPoint, data: data).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      if (registerModel!.code == 'Success') {
        emit(RegisterSuccessful());
      } else if (registerModel!.code == 'ValidationError') {
        emit(RegisterValidationError());
      } else {
        emit(RegisterError());
      }
    });
  }

  void setUniversityDropdown(String? value) {
    universityDropDownItem = value;
    emit(DataChanged());
  }

  void setGradeDropdown(String? value) {
    gradeDropDownItem = value;
    emit(DataChanged());
  }
  void setgenderDropdown(String? value) {
    genderDropDownItem = value;
    emit(DataChanged());
  }

  void submitFail(){
    emit(RegisterValidationError());
  }
}
