
import 'package:flutter/material.dart';
import 'package:login/utils/constants.dart';

InputDecoration customDecoration({
  required String label,
  required BuildContext context,
  required Color color,
  required int borders,
  IconData? prefixIcon
}){
  return InputDecoration(
    labelText: label,
    prefixIcon: Padding(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      child: Icon(prefixIcon), // myIcon is a 48px-wide widget.
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: appColor, width: 1.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
            bottomRight:
            Radius.circular(MediaQuery.of(context).size.width / 20))),
    focusColor: appColor,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: color),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width / 20),
          topRight:(borders == 1)? Radius.circular(MediaQuery.of(context).size.width / 20) : Radius.circular(5),
          bottomLeft:(borders == 1)? Radius.circular(MediaQuery.of(context).size.width / 20) : Radius.circular(5),
        )),
  );
}
