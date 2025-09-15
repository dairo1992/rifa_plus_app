
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rifa Plus - Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido a la App'),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => context.push('/register'),
              child: const Text('Ir a Registro'),
            ),
          ],
        ),
      ),
    );
  }
}
