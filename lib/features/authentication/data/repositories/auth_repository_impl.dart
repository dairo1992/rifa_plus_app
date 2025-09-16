import 'package:dartz/dartz.dart';
import 'package:rifa_plus_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:rifa_plus_app/features/authentication/data/models/user_request_model.dart';
import 'package:rifa_plus_app/features/authentication/domain/entities/user_entity.dart';
import 'package:rifa_plus_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<AuthFailure, UserEntity>> register({
    required UserRequestModel user,
  }) async {
    try {
      final resp = await dataSource.register(request: user);
      // El dataSource devuelve un UserModel, que ya es un UserEntity.
      // Si hubiera diferencias, aquí se haría el mapeo.
      return resp;
    } catch (e) {
      // Aquí se manejaría el error y se convertiría a un tipo de Failure específico.
      return Left(AuthFailure(msg: 'Error ${e.toString()}'));
    }
  }
}
