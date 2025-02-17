import 'dart:io';

import 'package:image_picker/image_picker.dart';
// import '../DB/articulos.dart';
// import '../main.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});
  @override
  StorePageState createState() => StorePageState();
}

class StorePageState extends State<StorePage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController talleController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  String estadoSeleccionado = "Nuevo";
  File? _imagenSeleccionada;

  Future<void> _seleccionarImagen() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);
    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  void _subirProducto() {
    if (nombreController.text.isEmpty || precioController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Por favor, completa todos los campos obligatorios")),
      );
      return;
    }
    // Aquí iría la lógica para enviar los datos a la base de datos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Producto subido correctamente")),
    );
  }

  ////---------INICIA GESTION PARA EDITAR Y ELIMINAR PRODUCTOS
  ///implementacion de campo de texto y objeto temporal para reemplazar la base de datos
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _products = [
    {'name': 'Pantalón', 'type': 'Ropa', 'price': 1000},
    {'name': 'Remera', 'type': 'Ropa', 'price': 500},
    {'name': 'Zapatillas', 'type': 'Calzado', 'price': 2000},
  ];
  List<Map<String, dynamic>> _filteredProducts = [];

  //Inicia estado para la barra de busqueda
  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(_products);
  }

  void _searchProducts(String query) {
    setState(() {
      _filteredProducts = _products.where((product) {
        return product['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _editAllProducts() {
    setState(() {
      for (var product in _filteredProducts) {
        product['price'] = (product['price'] * 0.9).toInt();
      }
    });
  }

  void _editProduct(int index) {
    setState(() {
      _filteredProducts[index]['price'] += 100;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeWhere((product) => _filteredProducts[index] == product);
      _filteredProducts.removeAt(index);
    });
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
              _buildTextField(nombreController, "Nombre del producto"),
              _buildTextField(tipoController, "Tipo de producto"),
              _buildTextField(cantidadController, "Cantidad", isNumeric: true),
              _buildTextField(precioController, "Precio", isNumeric: true),
              _buildTextField(descripcionController, "Descripción",
                  maxLines: 3),
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
              _buildTextField(talleController, "Talle (Opcional)"),
              _buildTextField(colorController, "Color (Opcional)"),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _seleccionarImagen,
                    icon: const Icon(Icons.image),
                    label: const Text('seleccionar imagen'),
                    //child: const Text("Seleccionar imagen"),
                  ),
                  const SizedBox(width: 10),
                  _imagenSeleccionada != null
                      ? Image.file(_imagenSeleccionada!, height: 50)
                      : const Text("Ninguna imagen seleccionada"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _subirProducto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Subir producto',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isNumeric = false, int maxLines = 1}) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          maxLines: maxLines,
        ));
  }

  Widget _ProductManager(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Buscar por nombre o tipo',
              border: OutlineInputBorder(),
            ),
            onChanged: _searchProducts,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _editAllProducts,
            child: const Text('Editar todos'),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _filteredProducts.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(_filteredProducts[index]['name']),
                  subtitle: Text(
                      "Tipo ${_filteredProducts[index]['type']}\nPrecio: \$${_filteredProducts[index]['price']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => _editProduct(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteProduct(index),
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
