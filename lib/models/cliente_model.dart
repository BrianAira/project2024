class Cliente {
  final int edad;
  final String nombre;
  final String email;
  final int telefono;
  final String password;
  final String direccion;

  Cliente({
    this.edad = 0,
    required this.nombre,
    required this.email,
    this.telefono = 2622698336,
    required this.password,
    this.direccion = "",
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      nombre: json['nombre'],
      edad: json['edad'],
      email: json['email'],
      telefono: json['telefono'],
      password: json['password'],
      direccion: json['direccion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'edad': edad,
      'email': email,
      'telefono': telefono,
      'password': password,
      'direccion': direccion,
    };
  }
}
