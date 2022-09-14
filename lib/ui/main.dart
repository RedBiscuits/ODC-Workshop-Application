
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/ui/screens/add_note/add_note_cubit.dart';
import 'package:login/ui/screens/exams/exams_cubit.dart';
import 'package:login/ui/screens/home/home.dart';
import 'package:login/ui/screens/lectures/lectures_cubit.dart';
import 'package:login/ui/screens/login/login_cubit.dart';
import 'package:login/ui/screens/notes/notes_cubit.dart';
import 'package:login/ui/screens/register/register_cubit.dart';
import 'package:login/ui/screens/sections/sections_cubit.dart';
import 'package:login/ui/view_model/observers/general_observer.dart';

Future<void> main() async{
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => NotesCubit()..getNotes()),
        BlocProvider(create: (context) => AddNoteCubit()..getTime()),
        BlocProvider(create: (context) => RegisterCubit()..getData()),
        BlocProvider(create: (context) => ExamsCubit()..getExams()),
        BlocProvider(create: (context) => LecturesCubit()..getLectures()),
        BlocProvider(create: (context) => SectionsCubit()..getSections()),

      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Home())));
}
