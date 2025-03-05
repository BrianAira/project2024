// // services/store_service.dart
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import '../models/producto_model.dart';
// import '../services/api_services.dart';
// import 'package:flutter/material.dart';

// class StoreService {
//   final ApiService apiService = ApiService();
//   File? imagenSeleccionada;

//   Future<void> seleccionarImagen(Function(File?) actualizarImagen) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);
//     if (imagen != null) {
//       actualizarImagen(File(imagen.path));
//     }
//   }

//   Future<void> enviarProducto(
//       BuildContext context,
//       TextEditingController nombreController,
//       TextEditingController descripcionController,
//       TextEditingController precioController,
//       TextEditingController stockController,
//       TextEditingController tipoController) async {
//     if (nombreController.text.isEmpty ||
//         descripcionController.text.isEmpty ||
//         precioController.text.isEmpty ||
//         stockController.text.isEmpty ||
//         tipoController.text.isEmpty) {
//       mostrarMensaje(context, "Todos los campos son obligatorios", false);
//       return;
//     }

//     final nuevoProducto = Producto(
//       nombre: nombreController.text,
//       descripcion: descripcionController.text,
//       precio: double.tryParse(precioController.text) ?? 0.0,
//       stock: int.tryParse(stockController.text) ?? 0,
//       url: tipoController.text,
//     );

//     try {
//       await apiService.addProducto(nuevoProducto);
//       mostrarMensaje(context, "Producto agregado con éxito", true);
//     } catch (e) {
//       mostrarMensaje(context, "Error al agregar producto: $e", false);
//     }
//   }

//   void mostrarMensaje(BuildContext context, String mensaje, bool esExito) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(mensaje, style: TextStyle(color: Colors.white)),
//         backgroundColor: esExito ? Colors.green : Colors.red,
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
// }
