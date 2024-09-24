import 'package:flutter/material.dart';
//import 'package:myapp/main.dart';
//import 'package:myapp/main.dart';
//import 'package:shared_preferences/shared_preferences.dart';

// class login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login',
//       home: SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   void _checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLoggedIn = prefs.getBool('isLoggedin') ?? false;

//     if (isLoggedIn) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }

//Login page

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _login() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (_emailController.text == 'user@example.com' &&
//         _passwordController.text == 'password') {
//       prefs.setBool('isLoggedIn', true);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MyApp()),
//       );
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('credencial invalida')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Iniciar Sesion'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegistrationPage()),
//                 );
//               },
//               child: Text('Crear una cuenta nueva'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _register() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true)
//   }
// }
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Login"),
//     ),
//     body: Center(
//       child: Text("Hola"),
//     ),
//   );
// }

// Widget cuerpo() {
//   return Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//           image: NetworkImage(
//               "https://img.freepik.com/vector-gratis/fondo-futurista-degradado-geometrico_23-2149116406.jpg"),
//           fit: BoxFit.cover),
//     ),
//     child: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           nombre(),
//           campoUsuario(),
//           campoContrasena(),
//           SizedBox(
//             height: 10,
//           ),
//           botonEntrar(),
//         ],
//       ),
//     ),
//   );
// }

// Widget nombre() {
//   return Text(
//     "Sign in ",
//     style: TextStyle(
//         color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
//   );
// }

// Widget campoUsuario() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     child: TextField(
//       decoration: InputDecoration(
//         hintText: "User",
//         fillColor: Colors.white,
//         filled: true,
//       ),
//     ),
//   );
// }

// Widget campoContrasena() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     child: TextField(
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: "User",
//         fillColor: Colors.white,
//         filled: true,
//       ),
//     ),
//   );
// }

Widget botonEntrar() {
  return ElevatedButton(
    onPressed: () {},
    child: Text("Enter"),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      textStyle: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}
