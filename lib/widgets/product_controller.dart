// // product_controller.dart
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import '../models/producto_model.dart';
// import '../services/api_services.dart';
// import 'package:flutter/material.dart';

// class ProductController {
//   final ApiService apiService = ApiService();
//   final TextEditingController nombreController = TextEditingController();
//   final TextEditingController tipoController = TextEditingController();
//   final TextEditingController stockController = TextEditingController();
//   final TextEditingController precioController = TextEditingController();
//   final TextEditingController descripcionController = TextEditingController();
//   final TextEditingController talleController = TextEditingController();
//   final TextEditingController colorController = TextEditingController();

//   String estadoSeleccionado = "Nuevo";
//   File? imagenSeleccionada;

//   Future<void> seleccionarImagen(Function(File?) updateState) async {
//     final picker = ImagePicker();
//     final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);
//     if (imagen != null) {
//       updateState(File(imagen.path));
//     }
//   }

//   Future<void> enviarProducto(BuildContext context) async {
//     if (nombreController.text.isEmpty ||
//         descripcionController.text.isEmpty ||
//         precioController.text.isEmpty ||
//         stockController.text.isEmpty ||
//         tipoController.text.isEmpty) {
//       _mostrarMensaje(context, "Todos los campos son obligatorios", false);
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
//       _mostrarMensaje(context, "Producto agregado con éxito", true);
//     } catch (e) {
//       _mostrarMensaje(context, "Error al agregar producto: $e", false);
//     }
//   }

//   void _mostrarMensaje(BuildContext context, String mensaje, bool esExito) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(mensaje, style: TextStyle(color: Colors.white)),
//         backgroundColor: esExito ? Colors.green : Colors.red,
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
// }
