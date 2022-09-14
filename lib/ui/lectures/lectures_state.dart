
import 'package:flutter/material.dart';

@immutable
abstract class LecturesState {}

class InitialState extends LecturesState {}
class GettingLectures extends LecturesState {}
class GotLecturesSuccessfully extends LecturesState {}
class LecturesRetrievalFail extends LecturesState {}

