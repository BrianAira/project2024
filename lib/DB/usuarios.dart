import './articulos.dart';
//import 'package:sqflite/sqflite.dart';
//import 'dart:async';

final List<Usuario?> usuarios = [
  Usuario('user1', "user@example.com", "password", []),
  Usuario('user2', "admin@example.com", "admin123", []),
  Usuario('user3', "test@example.com", "test123", []),
];

class Usuario {
  String nombre;
  String email;
  String contrasena;
  //List<compras> historial;
  List<Articulo> favoritos;

  Usuario(this.nombre, this.email, this.contrasena,
      /* this.historial,*/ this.favoritos);

  void registrarse() {}

  void iniciarSesion(String email, String contrasena) {}
  void agregarFavoritos(Articulo articulo) {
    if (favoritos.contains(articulo)) {
      favoritos.remove(articulo);
    } else {
      favoritos.add(articulo);
    }
  }
}

//configuracion de base de datos

