import 'package:dartz/dartz.dart';
import 'package:rifa_plus_app/features/authentication/data/models/user_request_model.dart';
import 'package:rifa_plus_app/features/authentication/domain/entities/user_entity.dart';

// Asumimos que tienes una clase para manejar fallos (failures)
// y una entidad de usuario definidas en algún lugar de la capa de dominio.

// Placeholder para una clase de fallo genérica
class AuthFailure {
  final String msg;

  AuthFailure({required this.msg});
}

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> register({
    required UserRequestModel user,
  });

  // Aquí podrías añadir otros métodos como:
  // Future<Either<Failure, UserEntity>> login(String email, String password);
  // Future<Either<Failure, void>> logout();
}
