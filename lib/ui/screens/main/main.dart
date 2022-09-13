import 'package:flutter/material.dart';
import 'package:login/data/network/dio_helper.dart';
import 'package:login/ui/screens/exams/exams.dart';
import 'package:login/ui/screens/home/home.dart';

import '../news/news.dart';

Future<void> main() async{
  await DioHelper.init();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}
