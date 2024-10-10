import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import '../DB/articulos.dart';
import '../main.dart';
import 'package:provider/provider.dart';

class ArticuloCard extends StatefulWidget {
  final Articulo articulo;

  ArticuloCard({required this.articulo});
  @override
  _ArticuloCardState createState() => _ArticuloCardState();
}

class _ArticuloCardState extends State<ArticuloCard> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 500,
        child: Card(
          elevation: 8,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 650, minHeight: 250),
                child: Image.network(
                  widget.articulo.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        widget.articulo.nombre,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Precio \$${widget.articulo.precio.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontFamily: AutofillHints.countryName,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Cantidad: ${widget.articulo.cantidad}'),
                    Text(widget.articulo.descripcion),
                  ],
                ),
              ),
              Spacer(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<MyAppState>(builder: (context, myAppState, child) {
                    final isFavorite =
                        myAppState.favoritos.contains(widget.articulo);
                    return ElevatedButton(
                        onPressed: () {
                          myAppState.toggleFavorite(widget.articulo);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, elevation: 0),
                        child: Icon(
                          isFavorite
                              ? (Icons.favorite)
                              : (Icons.favorite_border_outlined),
                          color: isFavorite
                              ? const Color.fromARGB(255, 230, 47, 34)
                              : Colors.black,
                        ));
                  })
                ],
              ),
              MouseRegion(
                onEnter: (_) => setState(() {
                  _isHover = true;
                }),
                onExit: (_) => setState(() {
                  _isHover = false;
                }),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  decoration: BoxDecoration(
                    color: _isHover
                        ? Color.fromARGB(255, 255, 190, 27)
                        : Color.fromARGB(255, 16, 68, 100),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                            size: _isHover ? 28 : 24,
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
