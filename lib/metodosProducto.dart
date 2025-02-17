// import './articulos.dart';

// class RepositorioProductos {
//   List<Articulo> productos = [];
//   void agregarProducto(Articulo articulo) {
//     productos.add(articulo);
//     _mostrarProductos(); // Llama a la función para mostrar la lista actualizada
//   }

//   bool eliminarProducto(String nombre, String tipo) {
//     final producto = buscarProducto(nombre, tipo);
//     if (producto != null) {
//       productos.remove(producto);
//       print('producto eliminado');
//     }
//     return false;
//   }

//   Articulo buscarProducto(String nombre, String tipo) {
//     return productos.firstWhere(
//       (producto) => producto.nombre == nombre || producto.tipo == tipo,
//       orElse: () => throw Exception('No encontrado'),
//     );
//   }

//   void modificarProducto(String nombre, Articulo nuevoProducto) {
//     final index = productos.indexWhere((producto) => producto.nombre == nombre);
//     if (index != -1) {
//       productos[index] = nuevoProducto;
//     }
//   }

//   void _mostrarProductos() {
//     print("Lista de productos actualizada:");
//     for (var producto in productos) {
//       print("""
//       ---------------------------
//       Nombre: ${producto.nombre}
//       Tipo: ${producto.tipo}
//       Precio: \$${producto.precio}
//       Cantidad: ${producto.cantidad}
//       Descripción: ${producto.descripcion}
//       Imagen URL: ${producto.imageUrl}
//       ---------------------------
//       """);
//     }
//   }
// }
