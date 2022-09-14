import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/general_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/network/end_points.dart';
import 'exams_state.dart';


class GeneralCubit extends Cubit<DataState> {
  late ExamsModel dataModel;
  static GeneralCubit get(context) => BlocProvider.of(context);
  GeneralCubit() : super(InitialState());

  void getExams() async {
    emit(GettingData());
    dataModel =  ExamsModel();
    DioHelper.getData(url: examsEndPoint, token: token).then((value ) {
      if (value.statusCode == 200) {
        dataModel = ExamsModel.fromJson(value.data);
        print(dataModel.data![0].objectSubject);
        emit(RetrievalSuccessful());
      } else {
        print(value.statusCode);
        emit(DataRetrievalFail());

      }
    });

  }
}
