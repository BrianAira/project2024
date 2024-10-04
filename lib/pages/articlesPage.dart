import 'package:flutter/material.dart';
import '../DB/articulos.dart';
import '../widgets/articuloCard.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  //barra de busqueda --->
  TextEditingController _searchController = TextEditingController();
  List<Articulo> _filteredArticles = [];

  @override
  void initState() {
    super.initState();
    _filteredArticles = articulos;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _filteredArticles = articulos.where((articulo) {
        return articulo.nombre
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            articulo.tipo
                .toLowerCase()
                .contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

// <--- fin barra de busqueda
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Articulos"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: 'Buscar Producto...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double itemWith = 200;

            int crossAxisCount = (constraints.maxWidth / itemWith).floor();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4),
              itemCount: _filteredArticles.length,
              itemBuilder: (context, index) {
                return ArticuloCard(articulo: _filteredArticles[index]);
              },
            );
          },
        ));
  }
}

//barra de busqueda --->
//TextEditingController _searchController = TextEditingController();
//List<Articulo> _filteredArticles = [];

// Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     child: TextField(
              //       controller: _searchController,
              //       decoration: InputDecoration(
              //         hintText: 'Buscar producto...',
              //         prefixIcon: Icon(Icons.search),
              //         fillColor: Colors.white,
              //         filled: true,
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(30),
              //           borderSide: BorderSide.none,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),


  // @override
  // void initState() {
  //   super.initState();
  //   _filteredArticles = articulos;
  //   _searchController.addListener(_onSearchChanged);
  // }

  // void _onSearchChanged() {
  //   setState(() {
  //     _filteredArticles = articulos.where((articulo) {
  //       return articulo.nombre
  //               .toLowerCase()
  //               .contains(_searchController.text.toLowerCase()) ||
  //           articulo.tipo
  //               .toLowerCase()
  //               .contains(_searchController.text.toLowerCase());
  //     }).toList();
  //   });
  // }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

              //   child: LayoutBuilder(
              //     builder: (context, constraints) {
              //       final double itemWidth = 200;
              //       int crossAxisCount =
              //           (constraints.maxWidth / itemWidth).floor();
              //       return GridView.builder(
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: crossAxisCount,
              //           crossAxisSpacing: 10,
              //           mainAxisSpacing: 10,
              //           childAspectRatio: 3 / 4,
              //         ),
              //         itemCount: _filteredArticles.length,
              //         itemBuilder: (context, index) {
              //           return ArticuloCard(articulo: _filteredArticles[index]);
              //         },
              //       );
              //     },
              //   ),