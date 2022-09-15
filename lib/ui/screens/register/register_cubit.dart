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

  bool obsecurePasswordText = true;
  bool obsecureConfirmationText = true;

  Future getData() async {
    print("erroe");

    DioHelper.getData(url: universityEndPoint).then((value) {
      emit(GettingUniversityData());
      print(value.statusCode.toString());
      if (value.statusCode == 200) {
        universityModel = UniversityModel.fromJson(value.data);
        for (int i = 0; i < universityModel!.data!.length; i++) {
          universityList.add(universityModel!.data![i].name!);
        }
        emit(GotUniversityData());
      } else {
        print(value.statusCode);
      }
      print(value.statusCode);
    });
  }

  Future getDataGrade() async {
    print("erroe");
    DioHelper.getData(url: gradeEndPoint).then((value) {
      print(value.statusCode.toString());
      emit(GettingGradeData());
      if (value.data['code'] == 'Success') {
        gradeModel = GradeModel.fromJson(value.data);

        for (int i = 0; i < gradeModel!.data!.length; i++) {
          gradeList.add(gradeModel!.data![i].grade!);
        }
        emit(GotGradeData());
      } else {
        print(value.statusCode);
      }
    });
    emit(RegisterGotData());
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
      'gender': (gender=='male')? 'm':'f',
      'phoneNumber': phoneNumber,
      'universityId': 1,
      'gradeId': 4,
      'roleId': 2
    };
    DioHelper.postData(url: registerEndPoint, data: data).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      if (value.statusCode == 200) {
        emit(RegisterSuccessful());
      } else if (value.statusCode == 401 || value.statusCode == 400) {
        emit(RegisterValidationError());
      } else {
        emit(RegisterError());
      }
    });
  }

  void setUniversityDropdown(String? value) {
    universityDropDownItem = value;
    emit(UniversityDataChanged());
  }

  void setGradeDropdown(String? value) {
    gradeDropDownItem = value;
    emit(GradeDataChanged());
  }

  void setgenderDropdown(String? value) {
    genderDropDownItem = value;
    emit(GenderDataChanged());
  }

  void reversePasswordObsecurity() {
    obsecurePasswordText = !obsecurePasswordText;
    emit(VisibilityChanged());
  }

  void reverseConfirmationObsecurity() {
    obsecureConfirmationText = !obsecureConfirmationText;
    emit(VisibilityConfirmationChanged());
  }
}
