import 'package:flutter_e_commerce_c10_sun3/domain/entities/AuthResultEntity.dart';

abstract class RegisterStates {}

/// parent class

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  AuthResultEntity authResultEntity;

  RegisterSuccessState({required this.authResultEntity});
}
