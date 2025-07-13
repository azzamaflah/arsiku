import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final int? statusCode;
  final User? user;

  const AuthResponseModel({this.message, this.statusCode, this.user});

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json['message'],
        statusCode: json['status_code'],
        user: json['data'] == null ? null : User.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => {
    'message': message,
    'status_code': statusCode,
    'user': user?.toMap(),
  };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? role; // Check if the role field is correct
  final String? token;

  const User({this.id, this.name, this.email, this.role, this.token});

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    role: json['role'], // Ensure role is extracted properly from the response
    token: json['token'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'email': email,
    'role': role,
    'token': token,
  };
}
