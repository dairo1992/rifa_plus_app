
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rifa_plus_app/core/router/app_router.dart';
import 'package:rifa_plus_app/firebase_options.dart';

// Instancia global de GetIt
final sl = GetIt.instance;

/// Inicializa y configura todos los servicios, dependencias y
/// la base de datos local (Hive).
Future<void> setupLocator() async {
  // --- Core ---
  sl.registerSingleton<GoRouter>(appRouter);

  // --- Inicialización de servicios externos ---
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // --- Base de Datos Local (Hive) ---

  // 1. Inicializar Hive y definir su ruta de almacenamiento
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  // 2. Abrir las 'cajas' (boxes) que necesites.
  //    Puedes añadir más cajas aquí en el futuro.
  final settingsBox = await Hive.openBox('settings');

  // 3. Registrar la caja como un singleton en GetIt.
  //    Ahora puedes acceder a esta caja desde cualquier parte de la app.
  sl.registerLazySingleton<Box>(() => settingsBox, instanceName: 'settings');

  // --- Otros Servicios ---
  // Aquí puedes registrar otros servicios como Repositorios, Clientes HTTP, etc.
  // Ejemplo:
  // sl.registerLazySingleton(() => AuthRepository(sl()));
}
