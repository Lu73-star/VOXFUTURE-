import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Replace with your FastAPI backend URL
  static const String baseUrl = 'http://localhost:8000';

  // Get request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Post request
  Future<dynamic> post(String endpoint,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Put request
  Future<dynamic> put(String endpoint,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Delete request
  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Handle response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return null;
      }
      return json.decode(response.body);
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
