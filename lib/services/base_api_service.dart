import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseApiService {
  final String baseUrl = "https://tienda-3ry1.onrender.com";

  Future<T> get<T>(String endpoint, T Function(dynamic) parser) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse<T>(response, parser);
    } catch (e) {
      throw Exception('Error en GET: $e');
    }
  }

  Future<T> post<T>(String endpoint, Map<String, dynamic> body,
      T Function(dynamic) parser) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      return _handleResponse<T>(response, parser);
    } catch (e) {
      throw Exception('Error en POST: $e');
    }
  }

  T _handleResponse<T>(http.Response response, T Function(dynamic) parser) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decoded = jsonDecode(response.body);
      return parser(decoded);
    } else {
      throw Exception('Error HTTP ${response.statusCode}: ${response.body}');
    }
  }
}
