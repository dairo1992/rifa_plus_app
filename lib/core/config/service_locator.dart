
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rifa_plus_app/core/router/app_router.dart';
import 'package:rifa_plus_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:rifa_plus_app/features/authentication/data/datasources/implements/auth_datasource_impl.dart';
import 'package:rifa_plus_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:rifa_plus_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:rifa_plus_app/features/authentication/domain/usecases/register_user.dart';
import 'package:rifa_plus_app/firebase_options.dart';

// Instancia global de GetIt
final sl = GetIt.instance;

/// Inicializa y configura todos los servicios, dependencias y
/// la base de datos local (Hive).
Future<void> setupLocator() async {
  //############################################################################
  // FEATURES - Authentication
  //############################################################################

  // Use cases
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(firebaseAuth: sl(), firestore: sl()),
  );

  //############################################################################
  // CORE
  //############################################################################
  sl.registerSingleton<GoRouter>(appRouter);

  //############################################################################
  // EXTERNAL
  //############################################################################
  
  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Local Storage (Hive)
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  final settingsBox = await Hive.openBox('settings');
  sl.registerLazySingleton<Box>(() => settingsBox, instanceName: 'settings');
}
