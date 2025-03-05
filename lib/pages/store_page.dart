import 'dart:io';
import 'package:flutter_application_1/services/producto_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../models/producto_model.dart';
//import '../services/api_services.dart';
import '../widgets/build_text_field_store.dart';
import '../widgets/product_managment_store.dart';
import '../services/store_service.dart';
import '../services/base_api_service.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController talleController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  String estadoSeleccionado = "Nuevo";
  File? _imagenSeleccionada;

  final BaseApiService apiService = BaseApiService();
  //final apiService = ApiService();

  Future<void> _seleccionarImagen() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);
    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  Future<void> _enviarProducto() async {
    if (nombreController.text.isEmpty ||
        descripcionController.text.isEmpty ||
        urlController.text.isEmpty ||
        //precioController.text.isEmpty ||
        stockController.text.isEmpty) {
      _mostrarMensaje(context, "Todos los campos son obligatorios", false);
      return;
    }
    final nuevoProducto = Producto(
      nombre: nombreController.text,
      descripcion: descripcionController.text,
      //precio: double.tryParse(precioController.text) ?? 0.0,
      stock: int.tryParse(stockController.text) ?? 0,
      url: urlController.text,
    );

    try {
      await addProducto(nuevoProducto); //apiService.addProducto(nuevoProducto);
      _mostrarMensaje(context, "Producto agregado con éxito", true);
    } catch (e) {
      _mostrarMensaje(context, "Error al agregar producto: $e ", false);
    }
  }

  void _mostrarMensaje(BuildContext context, String mensaje, bool esExito) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje, style: TextStyle(color: Colors.white)),
        backgroundColor: esExito ? Colors.green : Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  final TextEditingController searchController = TextEditingController();
  // final List<Map<String, dynamic>> _products = [
  //   {'name': 'Pantalón', 'type': 'Ropa', 'price': 1000},
  //   {'name': 'Remera', 'type': 'Ropa', 'price': 500},
  //   {'name': 'Zapatillas', 'type': 'Calzado', 'price': 2000},
  // ];
  List<Map<String, dynamic>> _filteredProducts = [];

  //Inicia estado para la barra de busqueda
  @override
  // void initState() {
  //   super.initState();
  //   _filteredProducts = List.from(_products);
  // }

  void searchProducts(String query) {
    // setState(() {
    //   _filteredProducts = _products.where((product) {
    //     return product['name'].toLowerCase().contains(query.toLowerCase());
    //   }).toList();
    // });
  }

  void editAllProducts() {
    setState(() {
      for (var product in _filteredProducts) {
        product['price'] = (product['price'] * 0.9).toInt();
      }
    });
  }

  void editProduct(int index) {
    setState(() {
      _filteredProducts[index]['price'] += 100;
    });
  }

  void deleteProduct(int index) {
    // setState(() {
    //   _products.removeWhere((product) => _filteredProducts[index] == product);
    //   _filteredProducts.removeAt(index);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Subir producto",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              buildTextField(nombreController, "Nombre del producto"),
              buildTextField(tipoController, "Tipo de producto"),
              buildTextField(stockController, "Cantidad", isNumeric: true),
              buildTextField(precioController, "Precio", isNumeric: true),
              buildTextField(descripcionController, "Descripción", maxLines: 3),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: estadoSeleccionado,
                decoration: const InputDecoration(labelText: "Estado"),
                items: ["Nuevo", "Usado"].map((estado) {
                  return DropdownMenuItem(value: estado, child: Text(estado));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    estadoSeleccionado = value.toString();
                  });
                },
              ),
              buildTextField(talleController, "Talle (Opcional)"),
              buildTextField(urlController, "ImagenURL (obligatorio)"),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _seleccionarImagen,
                    icon: const Icon(Icons.image),
                    label: const Text('seleccionar imagen'),
                  ),
                  const SizedBox(width: 10),
                  _imagenSeleccionada != null
                      ? Image.file(_imagenSeleccionada!, height: 50)
                      : const Text("Ninguna imagen seleccionada"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarProducto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Subir producto',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              productManager(
                searchController: searchController,
                searchProducts: searchProducts,
                filteredProducts: _filteredProducts,
                editAllProducts: editAllProducts,
                editProduct: editProduct,
                deleteProduct: deleteProduct,
              ),
            ],
          ),
        ),
      )),
    );
  }

  // Widget _buildTextField(TextEditingController controller, String label,
  //     {bool isNumeric = false, int maxLines = 1}) {
  //   return Padding(
  //       padding: const EdgeInsets.only(bottom: 10),
  //       child: TextField(
  //         controller: controller,
  //         decoration: InputDecoration(
  //           labelText: label,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //         ),
  //         keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
  //         maxLines: maxLines,
  //       ));
  // }

  // Widget productManager() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         TextField(
  //           controller: _searchController,
  //           decoration: const InputDecoration(
  //             labelText: 'Buscar por nombre o tipo',
  //             border: OutlineInputBorder(),
  //           ),
  //           onChanged: _searchProducts,
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         ElevatedButton(
  //           onPressed: _editAllProducts,
  //           child: const Text('Editar todos'),
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         SizedBox(
  //             height: 300,
  //             child: ListView.builder(
  //               itemCount: _filteredProducts.length,
  //               itemBuilder: (context, index) {
  //                 return Card(
  //                   margin: EdgeInsets.symmetric(vertical: 8),
  //                   child: ListTile(
  //                     title: Text(_filteredProducts[index]['name']),
  //                     subtitle: Text(
  //                         "Tipo ${_filteredProducts[index]['type']}\nPrecio: \$${_filteredProducts[index]['price']}"),
  //                     trailing: Row(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         IconButton(
  //                           icon: const Icon(Icons.edit, color: Colors.orange),
  //                           onPressed: () => _editProduct(index),
  //                         ),
  //                         IconButton(
  //                           icon: const Icon(Icons.delete, color: Colors.red),
  //                           onPressed: () => _deleteProduct(index),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ))
  //       ],
  //     ),
  //   );
  // }
}
