import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home.dart';
import '../news/news.dart';
import '../settings/settings.dart';
import 'bottom_state.dart';


class NavigationCubit extends Cubit<NavigationStates> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);

  int chosenPageIndex = 0;

  List<Widget> screens = [
    Home(),
    News(),
    Settings(),
  ];

  void navigate(int index) {
    chosenPageIndex = index;
    emit(HomeChangeBottomNavState());
  }

}