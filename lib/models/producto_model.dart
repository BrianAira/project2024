class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final String url;
  final int stock;

  Producto({
    required this.nombre,
    required this.descripcion,
    this.precio = 99,
    required this.url,
    //    "https://armoto.vtexassets.com/arquivos/ids/165522/157010-1200-auto.png?v=638439565882870000",
    required this.stock,
    //required this.tipoProducto,
  });

  /// Método para convertir un JSON en un objeto Producto
  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      //id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      //precio: json['precio'].toDouble(),
      url: json['url'],
      stock: json['stock'],
      //tipoProducto: json['tipoProducto'],
      //administrador: json['administrador']);
    );
  }

  /// Método para convertir un objeto Producto en JSON
  Map<String, dynamic> toJson() {
    return {
      //'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'url': url,
      'stock': stock,
      //'tipoProducto': tipoProducto,
      //'administrador': administrador,
    };
  }
}
