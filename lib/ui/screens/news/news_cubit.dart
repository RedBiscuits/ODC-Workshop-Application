import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/data/models/news_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/data/network/end_points.dart';
import 'package:login/ui/screens/news/news_state.dart';
import 'package:login/utils/constants.dart';
import 'package:meta/meta.dart';



class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);


  NewsModel? newsModel;

  Future getNewsData() async{
    emit(getNewsDataLoading());
    EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.custom
    );

    DioHelper.getData(
        url: newsEndPoint,
        token: token
    ).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(getNewsDataSuccess());
      EasyLoading.dismiss();
    }).catchError((error) {
      print(error.toString());
      emit(getNewsDataError(error));
      EasyLoading.dismiss();
    });
  }
}