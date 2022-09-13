
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/lecture_model.dart';
import '../../../data/network/dio_helper.dart';
import '../../../data/network/end_points.dart';
import '../../../utils/constants.dart';


part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  //single instance
  static LecturesCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  LectureModel? data = LectureModel();

  Future getData() async {
    emit(GetData());
    DioHelper.getData(url: lectureEndPoint, token: token).then(
      (value) {
        if (value.statusCode == 200) {
          data = LectureModel.fromJson(value.data);
          print(value.data);
          isLoading = false;
          emit(GetData());

        }
      },
    );
    emit(GetData());
  }
}
