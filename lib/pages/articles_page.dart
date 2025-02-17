import 'package:flutter/material.dart';
import '../DB/articulos.dart';
import '../widgets/articulo_card.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});
  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage> {
  //barra de busqueda --->
  TextEditingController searchController = TextEditingController();
  List<Articulo> _filteredArticles = [];

  @override
  void initState() {
    super.initState();
    _filteredArticles = articulos;
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _filteredArticles = articulos.where((articulo) {
        return articulo.nombre
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            articulo.tipo
                .toLowerCase()
                .contains(searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

// <--- fin barra de busqueda
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Articulos"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar Producto...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            const double itemWidth = 250;

            int crossAxisCount;
            if (constraints.maxWidth >= itemWidth * 3) {
              crossAxisCount = 3;
            } else if (constraints.maxWidth >= 500) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 1;
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 4),
              itemCount: _filteredArticles.length,
              itemBuilder: (context, index) {
                return ArticuloCard(articulo: _filteredArticles[index]);
              },
            );
          },
        ));
  }
}
