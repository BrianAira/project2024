// import '../DB/articulos.dart';
// import 'package:flutter/material.dart';

// class Ventas extends StatefulWidget {
//   const Ventas({super.key});
//   @override
//   VentasState createState() => VentasState();
// }

// class VentasState extends State<Ventas> {
//   String selectedOption = "";
//   final _nombreController = TextEditingController();
//   final _tipoController = TextEditingController();
//   final _precioController = TextEditingController();
//   final _estadoController = TextEditingController();
//   final _descripcionController = TextEditingController();
//   final _imgUrlController = TextEditingController();
//   Articulo vistaPreviaProducto = Articulo(
//       tipo: '',
//       nombre: '',
//       precio: 0,
//       cantidad: 0,
//       descripcion: '',
//       imageUrl: '');

//   void _agregarProducto() {
//     setState(() {
//       vistaPreviaProducto = Articulo(
//         tipo: _tipoController.text,
//         nombre: _nombreController.text,
//         precio: double.tryParse(_precioController.text) ?? 0,
//         cantidad: 10,
//         descripcion: _descripcionController.text,
//         imageUrl: _imgUrlController.text,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: const Text('Gestion de productos'),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedOption = "Agregar";
//                     });
//                   },
//                   child: const Text("Agregar"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedOption = "Eliminar";
//                     });
//                   },
//                   child: const Text("Eliminar"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       selectedOption = "Modificar";
//                     });
//                   },
//                   child: const Text("Modificar"),
//                 )
//               ],
//             ),
//             if (selectedOption == "Agregar") _buildAgregarProducto(context),
//             if (selectedOption == "Eliminar") _buildEliminarProducto(context),
//             //Center(child: Text("Funcionalidad de Eliminar")),
//             if (selectedOption == "Modificar")
//               const Center(child: Text("Funcionalidad de Modificar")),
//           ],
//         ));
//   }

//   Widget _buildAgregarProducto(BuildContext context) {
//     return Expanded(
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _nombreController,
//                 decoration: const InputDecoration(labelText: "Nombre"),
//               ),
//               TextField(
//                 controller: _tipoController,
//                 decoration: const InputDecoration(labelText: "Tipo"),
//               ),
//               TextField(
//                 controller: _precioController,
//                 decoration: const InputDecoration(labelText: "Precio"),
//               ),
//               TextField(
//                 controller: _imgUrlController,
//                 decoration: const InputDecoration(labelText: "Imagen URL"),
//               ),
//               TextField(
//                 controller: _descripcionController,
//                 decoration: const InputDecoration(labelText: "Descripcion"),
//               ),
//               ElevatedButton(
//                 onPressed: _agregarProducto,
//                 child: const Text('Agregar'),
//               )
//             ],
//           )),
//         ],
//       ),
//     );
//   }

//   Widget _buildEliminarProducto(BuildContext context) {
//     return Expanded(
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _nombreController,
//                 decoration: const InputDecoration(labelText: "Nombre"),
//               ),
//               TextField(
//                 controller: _tipoController,
//                 decoration: const InputDecoration(labelText: "Tipo"),
//               ),
//               ElevatedButton(
//                 onPressed: () {}, //_buscarProducto,
//                 child: const Text('buscar'),
//               ),
//               ElevatedButton(
//                   onPressed: () {}, //_eliminarProducto,
//                   child: const Text('Eliminar'))
//             ],
//           )),
//           Expanded(
//               child: Container(
//             color: Colors.green.shade50,
//             child: const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('vista previa: ',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }

// List<Articulo> mostrarProducto() {
//   return articulos;
//}
