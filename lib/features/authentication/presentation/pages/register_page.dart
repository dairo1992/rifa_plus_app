import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_date_picker_field.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_elevated_button.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_password_form_field.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('¡Registro exitoso!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: _nameController,
                  labelText: 'Nombre completo',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomDatePickerField(
                  controller: _birthDateController,
                  labelText: 'Fecha de nacimiento',
                  onDateSelected: (date) {},
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _phoneController,
                  labelText: 'Numero telefono',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.length < 10 ||
                        !value.startsWith('3')) {
                      return 'Por favor ingrese un numero válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Correo electrónico',
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
                  text: 'Registrarse',
                  isLoading: _isLoading,
                  onPressed: _submitForm,
                ),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text('Ya tengo cuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
