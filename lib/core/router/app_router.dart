import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rifa_plus_app/features/authentication/presentation/pages/login_page.dart';
import 'package:rifa_plus_app/features/authentication/presentation/pages/register_page.dart';
import 'package:rifa_plus_app/features/home/presentation/pages/screens/home_screen.dart';
import 'package:rifa_plus_app/features/splash/presentation/pages/splash_screen.dart'; // New SplashScreen

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen(); // Using the new HomeScreen
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
  ],
);
