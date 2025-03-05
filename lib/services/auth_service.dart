import 'base_api_service.dart';

class AuthService extends BaseApiService {
  Future<Map<String, dynamic>> login(String email, String contrasena) async {
    return post<Map<String, dynamic>>(
      "/login",
      {"email": email, "password": contrasena},
      (data) => data,
    );
  }
}
