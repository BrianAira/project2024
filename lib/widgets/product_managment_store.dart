import 'package:flutter/material.dart';
//import '../pages/store_page.dart';
// import 'dart:io';

Widget productManager({
  required TextEditingController searchController,
  required Function(String) searchProducts,
  required List<Map<String, dynamic>> filteredProducts,
  required VoidCallback editAllProducts,
  required Function(int) editProduct,
  required Function(int) deleteProduct,
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: searchController,
          decoration: const InputDecoration(
            labelText: 'Buscar por nombre o tipo',
            border: OutlineInputBorder(),
          ),
          onChanged: searchProducts,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: editAllProducts,
          child: const Text('Editar todos'),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(filteredProducts[index]['name']),
                    subtitle: Text(
                        "Tipo ${filteredProducts[index]['type']}\nPrecio: \$${filteredProducts[index]['price']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () => editProduct(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteProduct(index),
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
