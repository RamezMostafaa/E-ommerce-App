import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/AuthResultEntity.dart';
import 'package:flutter_e_commerce_c10_sun3/domain/entities/failurs.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
