import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/article_provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArticleProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Productos')),
      body: Column(
        children: [
          TextField(
            controller: provider.searchController,
            decoration: InputDecoration(
              hintText: 'Buscar productos...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: provider.filteredProducts.isEmpty
                ? Center(child: CircularProgressIndicator()) // Cargando...
                : ListView.builder(
                    itemCount: provider.filteredProducts.length,
                    itemBuilder: (context, index) {
                      final producto = provider.filteredProducts[index];
                      return ListTile(
                        title: Text(producto.nombre),
                        subtitle:
                            Text('\$${producto.precio.toStringAsFixed(2)}'),
                        leading: Image.network(producto.url,
                            width: 50, height: 50, fit: BoxFit.cover),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
