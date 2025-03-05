// import 'dart:convert'; // Para convertir JSON en objetos
// import 'package:http/http.dart' as http; // Librería HTTP para hacer peticiones
// import '../models/producto_model.dart';
// import '../models/cliente_model.dart';

// class ApiService {
//   final String baseUrl = "https://tienda-3ry1.onrender.com";

// //PRODUCTOS
//   /// Método para obtener productos desde la API
//   Future<List<Producto>> getProductos() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/producto/traer'));
//       return _handleResponse<List<Producto>>(
//           response,
//           (data) =>
//               data.map<Producto>((json) => Producto.fromJson(json)).toList());
//     } catch (e) {
//       throw Exception('Error al obtener productos: $e');
//     }
//   }

//   /// Método para agregar un producto a la API
//   Future<void> addProducto(Producto producto) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/producto/crear'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(producto.toJson()),
//       );
//       _handleResponse<void>(response, (_) => null);
//     } catch (e) {
//       throw Exception('Error al agregar producto: $e');
//     }
//   }

// //CLIENTES
//   Future<List<Cliente>> getClientes() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/cliente/traer'));
//       return _handleResponse<List<Cliente>>(
//           response,
//           (data) =>
//               data.map<Cliente>((json) => Cliente.fromJson(json)).toList());
//     } catch (e) {
//       throw Exception('Error al obtener clientes: $e');
//     }
//   }

//   Future<void> addCliente(Cliente cliente) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/cliente/crear'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(cliente.toJson()),
//       );
//       _handleResponse<void>(response, (_) => null);
//     } catch (e) {
//       throw Exception('Error al agregar cliente: $e');
//     }
//   }

// // AUTENTICACION

//   Future<Map<String, dynamic>> login(String email, String contrasena) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/login'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "email": email,
//           "password": contrasena,
//         }),
//       );
//       return _handleResponse<Map<String, dynamic>>(response, (data) => data);
//     } catch (e) {
//       throw Exception('Error en el login: $e');
//     }
//   }

//   T _handleResponse<T>(http.Response response, T Function(dynamic) parser) {
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final decoded = jsonDecode(response.body);
//       return parser(decoded);
//     } else {
//       throw Exception('Error HTTP ${response.statusCode}: ${response.body}');
//     }
//   }
// }
