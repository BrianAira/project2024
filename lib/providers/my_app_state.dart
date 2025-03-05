import 'package:flutter/material.dart';
import '../models/producto_model.dart';

class MyAppState extends ChangeNotifier {
  final List<Producto> _productos = [];
  List<Producto> get productos => _productos;

  final List<Producto> _favoritos = [];
  List<Producto> get favoritos => _favoritos;

  void toggleFavorite(Producto producto) {
    if (_favoritos.contains(producto)) {
      _favoritos.remove(producto);
    } else {
      _favoritos.add(producto);
    }
    notifyListeners();
  }

  void agregarArticulo(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }
}
