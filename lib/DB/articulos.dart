class Articulo {
  String tipo;
  String nombre;
  double precio;
  int cantidad;
  String descripcion;
  String imageUrl;
  Articulo({
    required this.tipo,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.descripcion,
    required this.imageUrl,
  });
}

List<Articulo> articulos = [
  Articulo(
    tipo: 'Laptop',
    nombre: 'ThinkBook 14" 7ma Gen - Arctic Grey',
    precio: 999.99,
    cantidad: 10,
    descripcion:
        'Laptop liviana y elegante de 14 para profesionales en movimiento',
    imageUrl:
        'https://p4-ofp.static.pub//fes/cms/2024/07/17/dg5tqo55dtzsazdapqxyyu69hxon3r293669.png',
  ),
  Articulo(
    tipo: 'telefono',
    nombre: 'Smartphone',
    precio: 499.99,
    cantidad: 25,
    descripcion:
        'Smartphone con pantalla OLED de 6.5 pulgadas y 128GB de almacenamiento',
    imageUrl: 'https://example.com/smartphone.jpg',
  ),
  Articulo(
    tipo: 'Auriculares',
    nombre: 'Auriculares',
    precio: 79.99,
    cantidad: 50,
    descripcion: 'Auriculares inalámbricos con cancelación de ruido',
    imageUrl: 'https://example.com/auriculares.jpg',
  ),
  Articulo(
      tipo: 'Telefono',
      nombre: 'Motorola Razr 40 Ultra',
      precio: 254.000,
      cantidad: 5,
      descripcion:
          "Diseño exclusivo con pantalla flexible de 6.9” y bisagra “gota” sin espacios entre sus lados.",
      imageUrl:
          'https://armoto.vtexassets.com/arquivos/ids/165522/157010-1200-auto.png?v=638439565882870000'),
  Articulo(
      tipo: 'Cocina',
      nombre: 'Cocina',
      precio: 250.0,
      cantidad: 2,
      descripcion:
          'Cocina con procesador de moleculas tipo 234hf y rayo lazer integrado',
      imageUrl: 'https://example.com/auriculares.jpg'),
  Articulo(
      tipo: 'TV',
      nombre: 'Televisor',
      precio: 250,
      cantidad: 1,
      descripcion: 'Televisor samsung 157 pulgadas y mucho mas ',
      imageUrl: 'https://example.com/auriculares.jpg'),
  Articulo(
      tipo: 'Telefono',
      nombre: 'Motorola Razr 50',
      precio: 1.999,
      cantidad: 5,
      descripcion:
          "UltraPantalla externa de 4” y 165 Hz: la primera y más amplia con Gemini de Google",
      imageUrl:
          'https://armoto.vtexassets.com/arquivos/ids/167046-800-auto?v=638615757154330000&width=800&height=auto&aspect=true'),
  Articulo(
      tipo: 'Telefono',
      nombre: 'Motorola Edge 50 Ultra',
      precio: 254.000,
      cantidad: 5,
      descripcion:
          "La cámara del motorola edge 50 ultra entre las 5 mejores del mundo en smartphones lanzados en 2024.",
      imageUrl:
          'https://armoto.vtexassets.com/arquivos/ids/166369-800-auto?v=638537821124370000&width=800&height=auto&aspect=true'),
  Articulo(
      tipo: 'Telefono',
      nombre: 'Motorola Edge 40 Pro',
      precio: 254.000,
      cantidad: 5,
      descripcion:
          "Procesador Snapdragon® 8 Gen 2, el más avanzado hasta el momento.",
      imageUrl:
          'https://armoto.vtexassets.com/arquivos/ids/165470-800-auto?v=638426813193130000&width=800&height=auto&aspect=true'),
  Articulo(
      tipo: 'Telefono',
      nombre: 'Telefono',
      precio: 254.000,
      cantidad: 5,
      descripcion: "Moto g9 Power 4/126GB de almacenamiento",
      imageUrl: 'https://example.com/auriculares.jpg'),
  Articulo(
      tipo: 'Telefono',
      nombre: 'Telefono',
      precio: 254.000,
      cantidad: 5,
      descripcion: "Moto g9 Power 4/126GB de almacenamiento",
      imageUrl: 'https://example.com/auriculares.jpg'),
];
