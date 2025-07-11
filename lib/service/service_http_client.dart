import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceHttpClient {
  final String _baseUrl = "http://127.0.0.1:8000/api";

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse("$_baseUrl$endpoint"),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse("$_baseUrl$endpoint"),
      headers: headers ?? {'Content-Type': 'application/json'},
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      Uri.parse("$_baseUrl$endpoint"),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonResponse;
    } else {
      throw Exception(jsonResponse['message'] ?? 'Terjadi kesalahan');
    }
  }
}
