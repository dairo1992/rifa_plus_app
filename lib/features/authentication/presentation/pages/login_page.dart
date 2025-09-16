import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_elevated_button.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_password_form_field.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Crear una Cuenta')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Icon(
                  Icons.person_add_alt_1,
                  size: 120,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Usuario',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Por favor ingrese un correo válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomPasswordFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  text: 'Ingresar',
                  isLoading: false,
                  onPressed: () {},
                ),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text('Registrarme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
