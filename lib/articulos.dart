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
    nombre: 'Laptop',
    precio: 999.99,
    cantidad: 10,
    descripcion: 'Laptop de alto rendimiento con 16GB RAM y 512GB SSD',
    imageUrl: 'https://example.com/laptop.jpg',
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
      nombre: 'Telefono',
      precio: 254.000,
      cantidad: 5,
      descripcion: "Moto g9 Power 4/126GB de almacenamiento",
      imageUrl: 'https://example.com/auriculares.jpg'),
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
  Articulo(
      tipo: 'Telefono',
      nombre: 'Telefono',
      precio: 254.000,
      cantidad: 5,
      descripcion: "Moto g9 Power 4/126GB de almacenamiento",
      imageUrl: 'https://example.com/auriculares.jpg'),
];
