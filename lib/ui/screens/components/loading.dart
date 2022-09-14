import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/constants.dart';

Widget loading(BuildContext context){
  return Center(
    child: LoadingAnimationWidget.prograssiveDots(
      color: appColor,
      size : MediaQuery.of(context).size.width / 10,
    ),
  );
}