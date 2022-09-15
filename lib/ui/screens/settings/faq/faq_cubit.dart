import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/models/faq_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/data/network/end_points.dart';
import 'package:login/ui/screens/settings/faq/faq_state.dart';
import 'package:login/utils/cache_helper.dart';



class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  static FaqCubit get(context) => BlocProvider.of(context);

  FaQsModel? faqModel;



  Future getFaQs() async {

    emit(FaqGettingData());



    DioHelper.getData(
        url: termsEndPoint,
        token: SharedPreferencesEditor.getString(key: "token")
    ).then(
          (value) {
        if (value.statusCode == 200) {
          faqModel = FaQsModel.fromJson(value.data);
          print(value.data);
          print("gaaaaaamed");
          emit(FaqGotData());
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(FaqGotDataFail());
    });
  }
}