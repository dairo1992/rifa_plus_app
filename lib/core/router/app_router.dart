
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rifa_plus_app/features/authentication/presentation/pages/register_page.dart';
import 'package:rifa_plus_app/features/home/presentation/pages/home_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
  ],
);
