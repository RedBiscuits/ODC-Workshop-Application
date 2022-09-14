import 'package:flutter/cupertino.dart';

Widget getSizedBox(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 50,
  );
}