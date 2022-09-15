part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class GettingUniversityData extends RegisterState {}
class GotUniversityData extends RegisterState {}
class GotGradeData extends RegisterState {}
class GettingGradeData extends RegisterState {}
class UniversityDataChanged extends RegisterState {}
class GradeDataChanged extends RegisterState {}
class GenderDataChanged extends RegisterState {}
class RegisterGotData extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterSuccessful extends RegisterState {}
class RegisterValidationError extends RegisterState {}
class RegisterError extends RegisterState {}
class VisibilityChanged extends RegisterState {}
class VisibilityConfirmationChanged extends RegisterState {}
