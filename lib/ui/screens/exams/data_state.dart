
import 'package:flutter/material.dart';

@immutable
abstract class DataState {}

class InitialState extends DataState {}
class GettingData extends DataState {}
class RetrievalSuccessful extends DataState {}
class DataRetrievalFail extends DataState {}

