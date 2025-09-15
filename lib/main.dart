import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rifa_plus_app/core/config/service_locator.dart';
import 'package:rifa_plus_app/shared/theme/app_theme.dart';

void main() async {
  // Asegurarse de que los bindings de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase, Hive y otras dependencias
  await setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: sl<GoRouter>(),
      debugShowCheckedModeBanner: false,
      title: 'Rifa Plus',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
