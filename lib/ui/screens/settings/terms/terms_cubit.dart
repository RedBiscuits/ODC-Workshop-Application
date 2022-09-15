import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/data/models/terms_model.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/data/network/end_points.dart';
import 'package:login/utils/cache_helper.dart';
import 'package:meta/meta.dart';


part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  static TermsCubit get(context) => BlocProvider.of(context);

  TermsModel? termsModel;
  Data? data;


  Future getTerms() async {

    emit(TermsLoading());

    EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.custom
    );


    DioHelper.getData(
        url: termsEndPoint,
        token: SharedPreferencesEditor.getString(key: "token")
    ).then(
          (value) {
        if (value.statusCode == 200) {
          termsModel = TermsModel.fromJson(value.data);
          print(value.data);
          print("gaaaaaamed");
          emit(TermsSuccess());
          EasyLoading.dismiss();
        }
      },
    ).catchError((error){
      print(error.toString());
      emit(TermsFail());
      EasyLoading.dismiss();
    });
  }
}