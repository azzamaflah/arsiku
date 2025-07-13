import 'dart:convert';
import 'package:arsiku/data/model/request/auth/login.request.dart';
import 'package:arsiku/data/model/request/auth/register.request.dart';
import 'package:arsiku/data/model/respone/auth.respone.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:arsiku/service/service_http_client.dart';

class AuthRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  AuthRepository(this._serviceHttpClient);

  // Login method using Either for error handling
  Future<Either<String, AuthResponseModel>> login(
    LoginRequest requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'login', // Endpoint for login
        requestModel.toMap(), // Pass Map from the request model
      );

      final jsonResponse = json.decode(response.body); // Decode response body

      if (response.statusCode == 200) {
        // Parse response data
        final loginResponse = AuthResponseModel.fromMap(jsonResponse);

        // Store token and role in secure storage
        await secureStorage.write(
          key: 'authToken',
          value: loginResponse.user?.token ?? '',
        );
        await secureStorage.write(
          key: 'userRole',
          value: loginResponse.user?.role ?? '',
        );

        return right(loginResponse); // Return successful response
      } else {
        return left(jsonResponse['message'] ?? 'Login failed.');
      }
    } catch (e) {
      return left('An error occurred during login: $e'); // Exception handling
    }
  }

  // Register method using Either for error handling
// Register method using Either for error handling
  Future<Either<String, String>> register(
    RegisterRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'register', // Endpoint for registration
        requestModel.toMap(), // Pass Map from the request model
      );

      final jsonResponse = json.decode(response.body); // Decode response body

      final registerResponse =
          jsonResponse['message']; // Extract message from response

      if (response.statusCode == 201) {
        return right(registerResponse ?? 'Registration successful');
      } else {
        return left(jsonResponse['message'] ?? 'Registration failed.');
      }
    } catch (e) {
      return left(
        'An error occurred during registration: $e',
      ); // Exception handling
    }
  }
}
