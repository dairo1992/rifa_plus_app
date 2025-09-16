import 'package:rifa_plus_app/features/authentication/utils/user_rol_enum.dart';

class UserRequestModel {
  final String name;
  final DateTime birthDate;
  final int phone;
  final String email;
  final String password;
  final UserRole role;
  final String? photo;

  UserRequestModel({
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.email,
    required this.password,
    this.role = UserRole.administrator,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthDate': birthDate.toIso8601String(),
      'phone': phone,
      'email': email,
      'password': password,
      'role': role.toString().split('.').last, // Convert enum to string
      'photo': photo,
    };
  }
}
