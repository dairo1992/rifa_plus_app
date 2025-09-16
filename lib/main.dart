import 'package:flutter/material.dart';
import 'package:rifa_plus_app/core/config/service_locator.dart';
import 'package:rifa_plus_app/core/constants/app_constant.dart';
import 'package:rifa_plus_app/core/router/app_router.dart'; // Import appRouter
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
    return MaterialApp.router( // Use MaterialApp.router
      routerConfig: appRouter, // Use the appRouter instance
      debugShowCheckedModeBanner: false,
      title: AppConstants.nameApp,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
