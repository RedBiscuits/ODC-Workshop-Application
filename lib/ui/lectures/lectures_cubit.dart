import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/exams_model.dart';
import 'package:login/data/models/lectures_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/network/end_points.dart';
import 'lectures_state.dart';


class LecturesCubit extends Cubit<LecturesState> {
  late LecturesModel dataModel;
  static LecturesCubit get(context) => BlocProvider.of(context);
  LecturesCubit() : super(InitialState());

  void getLectures() async {
    emit(GettingLectures());
    dataModel =  LecturesModel();
    DioHelper.getData(url: lectureEndPoint, token: token).then((value ) {
      if (value.statusCode == 200) {
        dataModel = LecturesModel.fromJson(value.data);
        emit(GotLecturesSuccessfully());
      } else {
        print(value.statusCode);
        emit(LecturesRetrievalFail());
      }
    });

  }
}
