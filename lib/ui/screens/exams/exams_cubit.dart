import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/exams_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/network/end_points.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsModel examsModel = ExamsModel();
  var isLoading = true;

  static ExamsCubit get(context) => BlocProvider.of(context);

  ExamsCubit() : super(ExamsInitial());

  void getExams() async {
    emit(ExamsGetData());
    DioHelper.getData(url: examsEndPoint, token: token).then((value) {
      if (value.statusCode == 200) {
        examsModel = ExamsModel.fromJson(value.data);
        isLoading = false;
        print(value.data);
        emit(ExamsGetData());
      } else {
        print(value.statusCode);
      }
    });
    emit(ExamsGetData());

  }
}
