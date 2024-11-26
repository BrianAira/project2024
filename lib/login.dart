import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './main.dart';
//import 'package:flutter/widgets.dart';
//import 'package:myapp/main.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import './DB/usuarios.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usuarioController = TextEditingController();
  //final _emailController = TextEditingController();
  final _contrasenaController = TextEditingController();
  String text = 'Ingrese los datos por favor';

  void _login() {
    String nombreUsuario = _usuarioController.text.trim();
    String contrasenaUsuario = _contrasenaController.text.trim();

    if (nombreUsuario.isEmpty || contrasenaUsuario.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor completa los campos')));
      return;
    }

    final usuario = usuarios.firstWhere(
      (element) =>
          element?.nombre == nombreUsuario &&
          element?.contrasena == contrasenaUsuario,
      orElse: () => null,
    );

    if (usuario == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
      // Detener ejecución si no se encuentra el usuario
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: 'Flutter Demo Home Page',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        //implementeacion de la imagen de fondo
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpeg'), // Usa la imagen local
            fit: BoxFit.cover, // La imagen rellena toda la pantalla
          ),
        ),
        child: Center(
          child: Column(
            //cuadros de inicio de sesion
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Inicia Sesión",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 251, 251), fontSize: 28.0),
              ),

              const SizedBox(height: 20),
              // Espacio entre el texto y el campo de usuario
              LayoutBuilder(
                builder: (context, constraints) {
                  // Calculamos el ancho dinámicamente
                  double width = constraints.maxWidth *
                      0.8; // Usa el 80% del ancho disponible

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8), // Ajusta el padding vertical
                    child: Center(
                      child: SizedBox(
                        width: width > 400
                            ? 400
                            : width, // Máximo ancho 400, ajusta según la pantalla
                        child: TextField(
                          controller:
                              _usuarioController, // Conecta el controlador
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "User",
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(), // Borde estándar
                            filled: true,
                            fillColor: Color(
                                0xFF2C2C34), // Fondo oscuro para contraste
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ), // Aquí se muestra el campo de usuario
              LayoutBuilder(builder: (context, constraints) {
                double width = constraints.maxWidth * 0.8;
                return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8), // Añadimos un poco de padding horizontal
                    child: Center(
                        child: SizedBox(
                      width: width > 400 ? 400 : width,
                      child: TextField(
                        controller: _contrasenaController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color(
                                0xFF2C2C34) // Añadir un borde al campo de texto
                            ),
                      ),
                    )));
              }),
              const SizedBox(height: 20), // Espacio entre el campo y el botón
              ElevatedButton(
                onPressed: _login,
                child: Text("Ingresar"),
              ),
              nuevaCuenta(), // Aquí se agrega el botón debajo del campo de usuario
            ],
          ),
        ),
      ),
    );
  }
}

// Widget imagen() {
//   return Container(
//     decoration: const BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage('assets/fondo.jpeg'), // Usa la imagen local
//         fit: BoxFit.cover, // La imagen rellena toda la pantalla
//       ),
//     ),
//     child: Center(
//       child: iniciarSesion(),
//     ),
//   );
// }

// Widget iniciarSesion() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Text(
//         "Inicia Sesión",
//         style: TextStyle(
//             color: Color.fromARGB(255, 255, 251, 251), fontSize: 28.0),
//       ),

//       const SizedBox(height: 20),
//       // Espacio entre el texto y el campo de usuario
//       campoUsuario(_LoginPageState()
//           ._usuarioController), // Aquí se muestra el campo de usuario
//       campoContrasena(_LoginPageState()._contrasenaController),
//       const SizedBox(height: 20), // Espacio entre el campo y el botón
//       ingresar(),
//       nuevaCuenta(), // Aquí se agrega el botón debajo del campo de usuario
//     ],
//   );
// }

// Widget mensaje() {
//   return Text(
//     'Por favor ingrese los datos',
//     style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
//   );
// }

// Widget campoUsuario(TextEditingController controller) {
//   return LayoutBuilder(
//     builder: (context, constraints) {
//       // Calculamos el ancho dinámicamente
//       double width =
//           constraints.maxWidth * 0.8; // Usa el 80% del ancho disponible

//       return Padding(
//         padding: const EdgeInsets.symmetric(
//             vertical: 8), // Ajusta el padding vertical
//         child: Center(
//           child: SizedBox(
//             width: width > 400
//                 ? 400
//                 : width, // Máximo ancho 400, ajusta según la pantalla
//             child: TextField(
//               controller: controller, // Conecta el controlador
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 hintText: "User",
//                 hintStyle: TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(), // Borde estándar
//                 filled: true,
//                 fillColor: Color(0xFF2C2C34), // Fondo oscuro para contraste
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget campoContrasena(TextEditingController controller) {
//   return LayoutBuilder(builder: (context, constraints) {
//     double width = constraints.maxWidth * 0.8;
//     return Padding(
//         padding: EdgeInsets.symmetric(
//             vertical: 8), // Añadimos un poco de padding horizontal
//         child: Center(
//             child: SizedBox(
//           width: width > 400 ? 400 : width,
//           child: TextField(
//             controller: controller,
//             style: TextStyle(color: Colors.white),
//             decoration: const InputDecoration(
//                 hintText: "Password",
//                 hintStyle: TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor:
//                     Color(0xFF2C2C34) // Añadir un borde al campo de texto
//                 ),
//           ),
//         )));
//   });
// }

// Widget ingresar() {
//   return ElevatedButton(
//     onPressed: _LoginPageState()._login,
//     child: Text("Ingresar"),
//   );
// }

Widget nuevaCuenta() {
  return ElevatedButton(
      onPressed: () {}, child: const Text('Crear nueva cuenta'));
}
