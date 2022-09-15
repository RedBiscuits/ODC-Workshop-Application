import 'package:flutter/material.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class GetData extends NewsState {}

class getNewsDataLoading extends NewsState{}
class getNewsDataSuccess extends NewsState{}
class getNewsDataError extends NewsState{
  final String? error;
  getNewsDataError(this.error);
}