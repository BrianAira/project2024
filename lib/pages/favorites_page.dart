import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/my_app_state.dart';
//import '../models/producto_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Consumer<MyAppState>(
        builder: (context, myAppState, child) {
          if (myAppState.favoritos.isEmpty) {
            return const Center(
              child: Text("No hay articulos en favoritos"),
            );
          }
          return ListView.builder(
            itemCount: myAppState.favoritos.length,
            itemBuilder: (context, index) {
              final articulo = myAppState.favoritos[index];
              return ListTile(
                leading: Image.network(articulo.url),
                title: Text(articulo.nombre),
                subtitle:
                    Text('Precio: \$${articulo.precio.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}
