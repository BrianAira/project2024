import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'registro_page.dart';
import './my_home_page.dart';
import '../widgets/custom_text_field.dart';
import '../services/api_services.dart';
import '../models/cliente_model.dart';
import '../services/base_api_service.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _contrasenaController = TextEditingController();
  String text = 'Ingrese los datos por favor';

  final AuthService authService = AuthService();
  //final ApiService apiService = ApiService();
  late Future<List<Cliente>> clienteFuture;

  void _login() async {
    String emailUsuario = _emailController.text.trim();
    String contrasenaUsuario = _contrasenaController.text.trim();

    if (emailUsuario.isEmpty || contrasenaUsuario.isEmpty) {
      _mostrarMensaje('Por favor completa los campos');
      return;
    }

    try {
      Map<String, dynamic> response = await authService.login(emailUsuario,
          contrasenaUsuario); //apiService.login(emailUsuario, contrasenaUsuario);

      if (mounted) {
        if (response['mensaje'] == "Login exitoso") {
          _mostrarMensaje('Inicio de sesión exitoso');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
        } else {
          _mostrarMensaje('Credenciales inválidas');
        }
      }
    } catch (e) {
      if (mounted) {
        _mostrarMensaje('Error al intentar iniciar sesión $e');
      }
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpeg'),
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
              _buildInputField(_emailController, "Email"),
              _buildInputField(_contrasenaController, "Contraseña",
                  isPassword: true),
              const SizedBox(height: 60),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: CustomTextField(
            controller: controller, hintText: hint, isPassword: isPassword),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          text: 'Crear cuenta',
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => CrearUsuario())),
        ),
        CustomButton(text: 'Ingresar', onPressed: _login)
      ],
    );
  }
}
