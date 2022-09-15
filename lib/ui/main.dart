

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/ui/screens/add_note/add_note_cubit.dart';
import 'package:login/ui/screens/bottom_navigation/bottom_cubit.dart';
import 'package:login/ui/screens/exams/exams_cubit.dart';
import 'package:login/ui/screens/lectures/lectures_cubit.dart';
import 'package:login/ui/screens/login/login_cubit.dart';
import 'package:login/ui/screens/news/news_cubit.dart';
import 'package:login/ui/screens/notes/notes_cubit.dart';
import 'package:login/ui/screens/register/register_cubit.dart';
import 'package:login/ui/screens/sections/sections_cubit.dart';
import 'package:login/ui/screens/settings/faq/faq.dart';
import 'package:login/ui/screens/settings/faq/faq_cubit.dart';
import 'package:login/ui/screens/settings/terms/terms.dart';
import 'package:login/ui/screens/settings/terms/terms_cubit.dart';
import 'package:login/ui/screens/splash/splash.dart';
import 'package:login/ui/view_model/observers/general_observer.dart';

Future<void> main() async {
  await DioHelper.init();

  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => NotesCubit()..getNotes()),
        BlocProvider(create: (context) => AddNoteCubit()..getTime()),
        BlocProvider(create: (context) => RegisterCubit()..getData()..getDataGrade()),
        BlocProvider(create: (context) => ExamsCubit()..getExams()),
        BlocProvider(create: (context) => LecturesCubit()..getLectures()),
        BlocProvider(create: (context) => SectionsCubit()..getSections()),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => NewsCubit()..getNewsData()),
        BlocProvider(create: (context) => FaqCubit()..getFaQs()),
        BlocProvider(create: (context) => TermsCubit()..getTerms()),
      ],
      child:  const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen())));
}
