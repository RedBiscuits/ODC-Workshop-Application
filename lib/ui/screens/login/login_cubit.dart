import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/login_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/data/network/end_points.dart';
import 'package:login/utils/cache_helper.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  Future loginUser(String email, String password) async {
    emit(LoginLoading());
    await DioHelper.postData(
        url: loginEndPoint,
        data: {'email': email, 'password': password}).then((value) {
      if (value.statusCode == 200) {
        loginModel = LoginModel.fromJson(value.data);
        print(value.data);
        print(loginModel!.data!.accessToken.toString());
        SharedPreferencesEditor.putString(
            key: "token", value: loginModel!.data!.accessToken!.toString());
        token = loginModel!.data!.accessToken.toString();
        emit(LoginSuccessful());
      } else {
        print(value.statusCode);
        emit(BadCredentialsLogin());
      }
    }).catchError((onError) {
      emit(LoginError());
    });
    emit(LoginSuccessful());
  }
}
