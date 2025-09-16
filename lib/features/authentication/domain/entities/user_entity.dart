import 'package:rifa_plus_app/core/extensions/map_extension.dart';
import 'package:rifa_plus_app/features/authentication/utils/user_rol_enum.dart';
import 'package:rifa_plus_app/features/authentication/utils/user_status_enum.dart';

class UserEntity {
  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map.getOrNull(_idKey),
      email: map.getOrNull(_emailKey),
      name: map.getOrNull(_nameKey),
      birthDate: map.getOrNull(_birthDateKey),
      phone: map.getOrNull(_phoneKey),
      role: map.getOrNull(_roleKey),
      photo: map.getOrNull(_photoKey),
      status: map.getOrNull(_statusKey),
      createdAt: map.getOrNull(_createdAtKey),
      updatedAt: map.getOrNull(_updatedAtKey),
    );
  }

  final String id;
  final String email;
  final String name;
  final DateTime birthDate;
  final int phone;
  final UserRole role;
  final String? photo;
  final UserStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.phone,
    required this.role,
    required this.photo,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  static const _idKey = 'id';
  static const _emailKey = 'email';
  static const _nameKey = 'name';
  static const _birthDateKey = 'birthDate';
  static const _phoneKey = 'phone';
  static const _roleKey = 'role';
  static const _photoKey = 'photo';
  static const _statusKey = 'status';
  static const _createdAtKey = 'createdAt';
  static const _updatedAtKey = 'updatedAt';
}
