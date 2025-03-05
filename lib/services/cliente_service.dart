import 'base_api_service.dart';
import '../models/cliente_model.dart';

class ClienteService extends BaseApiService {
  Future<List<Cliente>> getClientes() async {
    return get<List<Cliente>>(
      "/cliente/traer",
      (data) => (data as List).map((json) => Cliente.fromJson(json)).toList(),
    );
  }

  Future<void> addCliente(Cliente cliente) async {
    await post<void>(
      "/cliente/crear",
      cliente.toJson(),
      (_) => null,
    );
  }
}
