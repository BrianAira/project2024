import 'package:flutter/material.dart';
//import '../widgets/custom_text_field.dart';
//import 'package:flutter/rendering.dart';
//import './main.dart';
//import 'package:flutter/widgets.dart';
//import 'package:myapp/main.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import './DB/usuarios.dart';

//import 'package:flutter/material.dart';

class CrearUsuario extends StatefulWidget {
  @override
  CrearUsuarioState createState() => CrearUsuarioState();
}

class CrearUsuarioState extends State<CrearUsuario> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  //final _telefonoController = TextEditingController();
  final _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Usuario'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            //cuadros de inicio de sesion
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Crear cuenta",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 251, 251), fontSize: 28.0),
              ),

              const SizedBox(height: 20),
              // Espacio entre el texto y el campo de usuario
              LayoutBuilder(builder: (context, constraints) {
                double width = constraints.maxWidth * 0.8;
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8), // Añadimos un poco de padding horizontal
                    child: Center(
                      child: SizedBox(
                        width: width > 400 ? 400 : width,
                        child: TextField(
                          controller: _nombreController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: "Nombre",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(
                                  0xFF2C2C34) // Añadir un borde al campo de texto
                              ),
                        ),
                      ),
                    ));
              }),
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
                              _emailController, // Conecta el controlador
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Email",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8), // Añadimos un poco de padding horizontal
                    child: Center(
                      child: SizedBox(
                        width: width > 400 ? 400 : width,
                        child: TextField(
                          controller: _contrasenaController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(
                                  0xFF2C2C34) // Añadir un borde al campo de texto
                              ),
                        ),
                      ),
                    ));
              }),
              const SizedBox(height: 20), // Espacio entre el campo y el botón
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: crearCuenta(),
                  ),
                  // SizedBox(
                  //   width: 150,
                  //   child: ingresar(),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget crearCuenta() {
    return ElevatedButton(
      onPressed: () {}, //_LoginPageState()._login,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2C2C34),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(
        "Ingresar",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
