import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rifa_plus_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:rifa_plus_app/features/authentication/data/models/user_request_model.dart';
import 'package:rifa_plus_app/features/authentication/domain/entities/user_entity.dart';
import 'package:rifa_plus_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:rifa_plus_app/features/authentication/utils/user_status_enum.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthDataSourceImpl({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<AuthFailure, UserEntity>> register({
    required UserRequestModel request,
  }) async {
    try {
      // 1. Crear el usuario en Firebase Authentication
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('No se pudo crear el usuario en Firebase Auth.');
      }
      final saveUser = request.toMap();
      saveUser['status'] = UserStatus.active.name;
      saveUser['createdAt'] = Timestamp.now();
      // 3. Guardar los datos adicionales en Cloud Firestore
      await _firestore.collection('users').doc(user.uid).set(saveUser);
      final userResponse = UserEntity(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        birthDate: request.birthDate,
        phone: request.phone,
        role: request.role,
        photo: user.photoURL,
        status: UserStatus.active,
        createdAt: saveUser['createdAt'],
      );
      return Right(userResponse);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(msg: "Error de Firebase Auth: ${e.message}"));
    } catch (e) {
      return Left(AuthFailure(msg: "Error de Firebase Auth: ${e.toString()}"));
    }
  }
}
