import 'package:flutter/material.dart';

void main() {
  runApp(const inicioSesion());
}

class inicioSesion extends StatelessWidget {
  const inicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Final',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 85, 151, 209)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bienvenido'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: imagen(),
    );
  }
}

Widget imagen() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/fondo azul.jpeg'), // Usa la imagen local
        fit: BoxFit.cover, // La imagen rellena toda la pantalla
      ),
    ),
    child: Center(
      child: iniciarSesion(),
    ),
  );
}

/*
Widget iniciarSesion() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Inicia Sesión",
        style: TextStyle(color: Colors.black, fontSize: 28.0),
      ),
      const SizedBox(height: 20), // Espacio entre el texto y el botón
      boton(), // Aquí se agrega el botón debajo del texto
    ],
  );
}
*/

Widget iniciarSesion() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Inicia Sesión",
        style: TextStyle(
            color: Color.fromARGB(255, 255, 251, 251), fontSize: 28.0),
      ),
      const SizedBox(
          height: 20), // Espacio entre el texto y el campo de usuario
      campoUsuario(), // Aquí se muestra el campo de usuario
      campoContrasena(),
      const SizedBox(height: 20), // Espacio entre el campo y el botón
      boton(), // Aquí se agrega el botón debajo del campo de usuario
    ],
  );
}

Widget campoUsuario() {
  return const Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 400, vertical: 2), // Añadimos un poco de padding horizontal
    child: TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "User",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(), // Añadir un borde al campo de texto
      ),
    ),
  );
}

Widget campoContrasena() {
  return const Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 400, vertical: 2), // Añadimos un poco de padding horizontal
    child: TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(), // Añadir un borde al campo de texto
      ),
    ),
  );
}

Widget boton() {
  return ElevatedButton(
    onPressed: () {
      // Acción al presionar el botón
      print("Botón presionado");
    },
    child: const Text("Presiona"),
  );
}


//funcion crear el usario 
/*Widget campoUsuario() {
  return const TextField(
    decoration: InputDecoration(
      hintText: "Usuario",
    ),
  );
}
*/
//una funcion que retorna "hola"
/*Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/originals/30/79/a2/3079a2b472e0ea0aa2667a2994fe6689.jpg"),
            fit: BoxFit.cover)),
    child: const Center(child: Text("hola")),
  );
}
*/


/*Widget imagen() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/image.jpg'), // Usa la imagen local
        fit: BoxFit.cover, // La imagen rellena toda la pantalla
      ),
    ),
    child: const Center(
      child: Text(
        "hola",
        style: TextStyle(
          fontSize: 40, // Tamaño de fuente más grande
          color: Colors.white, // Color de texto blanco para mejor visibilidad
          fontWeight: FontWeight.bold, // Texto en negrita
        ),
      ),
    ),
  );
}
*/