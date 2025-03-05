import './base_api_service.dart';
import '../models/producto_model.dart';

final apiService = BaseApiService(); // 🔹 Instancia de la clase

Future<List<Producto>> getProductos() async {
  return apiService.get<List<Producto>>(
    // 🔹 Ahora llamamos al método desde la instancia
    "/producto/traer",
    (data) => (data as List).map((json) => Producto.fromJson(json)).toList(),
  );
}

Future<void> addProducto(Producto producto) async {
  await apiService.post<void>(
    "/producto/crear",
    producto.toJson(),
    (_) => null,
  );
}
