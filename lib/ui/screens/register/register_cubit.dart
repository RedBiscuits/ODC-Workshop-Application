import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/grade_model.dart';
import 'package:login/data/models/register_model.dart';
import 'package:login/data/models/university_model.dart';
import 'package:login/data/network/end_points.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/network/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  int counter = 0;

  UniversityModel? universityModel;

  Future getUniversities() async {
    emit(GettingUniversitiesData());
    DioHelper.getData(url: universityEndPoint, token: token).then((value) {
      if (value.statusCode == 200) {
        universityModel = UniversityModel.fromJson(value.data);
        print(universityModel?.data!.toString());
        getFormUniversities();
        emit(GotData());
      } else {
        print(value.statusCode);
      }
    });
  }

  GradeModel? gradeModel;

  Future getGrades() async {
    emit(GettingGradeData());
    DioHelper.getData(url: universityEndPoint, token: token).then((value) {
      if (value.statusCode == 200) {
        gradeModel = GradeModel.fromJson(value.data);
        print(gradeModel?.data!.toString());
        getFormGrades();
        emit(GotData());
      } else {
        print(value.statusCode);
      }
    });
  }

  RegisterModel? registerModel;

  Future signUp({required email,
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


  List<String> universityList = [];
  List<String> gradeList = [];

  void getFormGrades() async {
    try {
      for (int i = 0; i <
          gradeModel!.data!.length; i++) {
        gradeList.add(gradeModel!.data![i].grade!);
      }
    } catch (error) {
      print(error.toString());
    }
    counter++;
  }

  void getFormUniversities() async {
    try {
      for (int i = 0; i <
          universityModel!.data!.length; i++) {
        universityList.add(universityModel!.data![i].name!);
      }
    } catch (error) {
      print(error.toString());
    }
    counter++;
  }

}
