import 'package:flutter/material.dart';
import '../DB/articulos.dart';
import '../main.dart';
import 'package:provider/provider.dart';

class ArticuloCard extends StatelessWidget {
  final Articulo articulo;

  ArticuloCard({required this.articulo});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              articulo.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articulo.nombre,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Precio \$${articulo.precio.toStringAsFixed(2)}'),
                Text('Cantidad: ${articulo.cantidad}'),
                Text(articulo.descripcion),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<MyAppState>(builder: (context, myAppState, child) {
                final isFavorite = myAppState.favoritos.contains(articulo);
                return TextButton(
                    onPressed: () {
                      myAppState.toggleFavorite(articulo);
                    },
                    child: Icon(isFavorite
                        ? (Icons.favorite)
                        : (Icons.favorite_border_outlined)));
                //isFavorite ? "Eliminar de Favoritos" : "Favoritos"));
              })
            ],
          ),
          TextButton(
              onPressed: () {}, child: Icon(Icons.add_shopping_cart_outlined))
        ],
      ),
    );
  }
}
