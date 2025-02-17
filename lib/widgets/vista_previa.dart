// import './articulos.dart';
// import 'package:flutter/material.dart';

// class VistaProducto extends StatelessWidget {
//   final Articulo producto;
//   VistaProducto({required this.producto});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: EdgeInsets.all(10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         children: [
//           Image.network(
//             producto.imageUrl,
//             height: 150,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(producto.nombre,
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 Text('Tipo: ${producto.tipo}', style: TextStyle(fontSize: 16)),
//                 Text('Precio:\$${producto.precio.toStringAsFixed(2)}',
//                     style: TextStyle(fontSize: 16)),
//                 Text(producto.descripcion,
//                     maxLines: 3, overflow: TextOverflow.ellipsis),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
