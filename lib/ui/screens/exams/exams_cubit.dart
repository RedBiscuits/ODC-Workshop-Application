import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/general_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/network/end_points.dart';

part 'exams_state.dart';

class GeneralCubit extends Cubit<ExamsState> {
  String? type;
  late GeneralModel dataModel;
  static GeneralCubit get(context) => BlocProvider.of(context);
  GeneralCubit(this.type) : super(ObjectInitial());

  void getExams() async {
    emit(ObjectGetData());
    dataModel =  GeneralModel(type!);
    DioHelper.getData(url: examsEndPoint, token: token , type: type!).then((value ) {
      if (value.statusCode == 200) {
        dataModel = GeneralModel.fromJson(value.data , type!);
        print(dataModel.data![0].objectSubject);
      } else {
        print(value.statusCode);
      }
    });
    emit(ObjectSuccessful());

  }
}
