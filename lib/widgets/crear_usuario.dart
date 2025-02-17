// import 'package:flutter/material.dart';
// import '../DB/basedato_helper.dart';
// //import 'package:sqflite/sqflite.dart';
// import 'package:flutter/material.dart';
// //import 'basedatoshelper.dart'; // Asegúrate de que este archivo esté correctamente importado

// class RegistrarUsuarioPage extends StatelessWidget {
//   final TextEditingController _nombreController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final BasedatosHelper _dbHelper = BasedatosHelper();

//   void _registrarUsuario(BuildContext context) async {
//     final nombre = _nombreController.text.trim();
//     final email = _emailController.text.trim();
//     final contrasena = _passwordController.text.trim();

//     if (nombre.isEmpty || email.isEmpty || contrasena.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Por favor, complete todos los campos')),
//       );
//       return;
//     }

//     try {
//       await _dbHelper.addUsuario(nombre, email, contrasena);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Usuario registrado con éxito')),
//       );
//       Navigator.pop(context); // Regresa a la pantalla anterior
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error al registrar el usuario: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registrar Usuario'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _nombreController,
//               decoration: const InputDecoration(
//                 labelText: 'Nombre',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Correo Electrónico',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Contraseña',
//                 border: OutlineInputBorder(),
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 32.0),
//             ElevatedButton(
//               onPressed: () => _registrarUsuario(context),
//               child: const Text('Registrar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
