import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final int? statusCode; // opsional, default tidak ada
  final User? user;
  final String? token;

  const AuthResponseModel({
    this.message,
    this.statusCode,
    this.user,
    this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json['message'],
        statusCode: json['status_code'], 
        user: json['user'] == null ? null : User.fromMap(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toMap() => {
    'message': message,
    'status_code': statusCode,
    'user': user?.toMap(),
    'token': token,
  };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? role;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  const User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    role: json['role'], // backend belum kirim ini, nanti bisa ditambahkan
    emailVerifiedAt: json['email_verified_at'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'email': email,
    'role': role,
    'email_verified_at': emailVerifiedAt,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
