import 'package:dartz/dartz.dart';
import 'package:rifa_plus_app/features/authentication/data/models/user_request_model.dart';
import 'package:rifa_plus_app/features/authentication/domain/entities/user_entity.dart';
import 'package:rifa_plus_app/features/authentication/domain/repositories/auth_repository.dart';

abstract class AuthDataSource {
  Future<Either<AuthFailure, UserEntity>> register({
    required UserRequestModel request,
  });
}
