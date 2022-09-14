part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class GettingUniversitiesData extends RegisterState {}
class GettingGradeData extends RegisterState {}
class GotData extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccessful extends RegisterState {}
class RegisterValidationError extends RegisterState {}
class RegisterError extends RegisterState {}
