import 'package:flutter/material.dart';
//import 'package:flutter_application_1/services/base_api_service.dart';
import '../services/producto_service.dart';

import '../models/producto_model.dart';
//import '../services/api_services.dart';

class ArticleProvider extends ChangeNotifier {
  //final BaseApiService _apiService = BaseApiService();
  //final ApiService _apiService = ApiService();
  List<Producto> _productos = [];
  List<Producto> _filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  List<Producto> get filteredProducts => _filteredProducts;

  ArticleProvider() {
    _loadProducts();
    searchController.addListener(_onSearchChanged);
  }
//carga productos y actualiza la lista
  Future<void> _loadProducts() async {
    try {
      final productos =
          await getProductos(); //_apiService.getProductos(); cambio 1

      if (!hasListeners)
        return; // 💡 Evita actualizar si el provider fue eliminado

      _productos = productos;
      _filteredProducts = List.from(_productos);
      notifyListeners();
    } catch (e) {
      print("Erro al cargar productos $e");
    }
  }

  void _onSearchChanged() {
    _filteredProducts = _productos.where((producto) {
      final searchTerm = searchController.text.toLowerCase();
      return producto.nombre.toLowerCase().contains(searchTerm) ||
          producto.descripcion.toLowerCase().contains(searchTerm);
    }).toList();
    if (hasListeners) notifyListeners(); // Notificar cambios a la UI
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
