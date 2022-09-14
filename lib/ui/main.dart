
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/ui/screens/login/login.dart';
import 'package:login/ui/screens/login/login_cubit.dart';
import 'package:login/ui/screens/register/register_cubit.dart';
import 'package:login/ui/view_model/observers/general_observer.dart';

Future<void> main() async{
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),

      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Login())));
}
