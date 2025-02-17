import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../main.dart';

//import 'package:Proyecto fin de año/myapp/generatorPage.dart'; // Ruta absoluta desde el paquete
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
                leading: Image.network(articulo.imageUrl),
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
