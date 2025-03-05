// import 'package:flutter/material.dart';
// import '../models/producto_model.dart';
// import '../services/api_services.dart';

// class ProductosPage extends StatefulWidget {
//   @override
//   ProductosPageState createState() => ProductosPageState();
// }

// class ProductosPageState extends State<ProductosPage> {
//   final ApiService apiService = ApiService();
//   late Future<List<Producto>> productosFuture;

//   @override
//   void initState() {
//     super.initState();
//     productosFuture = obtenerProductos();
//   }

//   Future<List<Producto>> obtenerProductos() async {
//     final List<dynamic> response = await apiService.getProductos();
//     print("Respuesta de la API: $response");
//     return response.map((json) => Producto.fromJson(json)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Lista de Productos')),
//       body: FutureBuilder<List<Producto>>(
//         future: productosFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}, '));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No hay productos disponibles.'));
//           }

//           final productos = snapshot.data!;
//           return ListView.builder(
//             itemCount: productos.length,
//             itemBuilder: (context, index) {
//               final producto = productos[index];
//               return ListTile(
//                 leading: producto.url.isNotEmpty
//                     ? Image.network(producto.url,
//                         width: 50, height: 50, fit: BoxFit.cover)
//                     : Icon(Icons.image_not_supported, size: 50),
//                 title: Text(producto.nombre),
//                 subtitle: Text('\$${producto.precio.toStringAsFixed(2)}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
