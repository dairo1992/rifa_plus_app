import 'package:flutter/material.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_elevated_button.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextFormField(
              labelText: 'Nombre de usuario',
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              labelText: 'Correo electrónico',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              labelText: 'Contraseña',
              obscureText: true,
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () {
                // Lógica de registro
              },
              text: 'Crear Cuenta',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}