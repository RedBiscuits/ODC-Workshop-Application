import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/exams_model.dart';
import 'package:login/data/models/lectures_model.dart';
import 'package:login/data/models/sections_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/network/end_points.dart';
import 'sections_state.dart';


class SectionsCubit extends Cubit<SectionsState> {
  late SectionsModel dataModel;
  static SectionsCubit get(context) => BlocProvider.of(context);
  SectionsCubit() : super(InitialState());

  void getSections() async {
    emit(GettingSections());
    dataModel =  SectionsModel();
    DioHelper.getData(url: sectionEndPoint, token: token).then((value ) {
      if (value.statusCode == 200) {
        dataModel = SectionsModel.fromJson(value.data);
        emit(GotSectionsSuccessfully());
      } else {
        print(value.statusCode);
        emit(SectionsRetrievalFail());
      }
    });

  }
}
