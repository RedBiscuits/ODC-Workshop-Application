part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class GettingData extends RegisterState {}
class DataChanged extends RegisterState {}
class RegisterGotData extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterGetDataFail extends RegisterState {}
class RegisterDataLoading extends RegisterState {}

class RegisterSuccessful extends RegisterState {}
class RegisterValidationError extends RegisterState {}
class RegisterError extends RegisterState {}
