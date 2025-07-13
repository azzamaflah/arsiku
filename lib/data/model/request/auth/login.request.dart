import 'dart:convert';

class LoginRequest {
  final String email;
  final String password;

  // Constructor
  LoginRequest({required this.email, required this.password});

  // Factory constructor to create a LoginRequest object from a map
  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(email: map['email'], password: map['password']);
  }

  // Method to convert LoginRequest object to a map for sending to API
  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  // Method to convert LoginRequest object to JSON string
  String toJson() => json.encode(toMap());

  // Factory constructor to create a LoginRequest object from JSON string
  factory LoginRequest.fromJson(String str) =>
      LoginRequest.fromMap(json.decode(str));
}
