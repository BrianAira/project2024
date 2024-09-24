import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart'; //importa dependencia de
import 'package:provider/provider.dart';
import 'favoritesPage.dart'; // Ruta relativa
import 'articlesPage.dart';
import 'phonePage.dart';
import 'articulos.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'login.dart';

void main() {
  //runApp(login());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<Articulo> _favoritos = [];
  List<Articulo> get favoritos => _favoritos;

  void toggleFavorite(Articulo articulo) {
    if (_favoritos.contains(articulo)) {
      _favoritos.remove(articulo);
    } else {
      _favoritos.add(articulo);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  // funcion para abrir enlaces
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se puede abrir el enlace $url';
    }
  }

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

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = ArticlePage();
        break;
      case 3:
        page = PhonePage();
      default:
        throw UnimplementedError("Widget no disponible para: $selectedIndex");
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(31, 115, 180, 221),
          titleSpacing: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Aira business',
                  style: TextStyle(
                    color: Color.fromARGB(255, 20, 43, 66),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar producto...',
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _launchURL('https://www.facebook.com/?locale=es_LA');
                  },
                  icon: Icon(Icons.facebook))
            ],
          ),
        ),
        body: Row(
          children: [
            SafeArea(
                child: NavigationRail(
              extended: constraints.maxWidth >= 600,
              minExtendedWidth: 150,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text("Favorites"),
                ),
                NavigationRailDestination(
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text("Articles")),
                NavigationRailDestination(
                    icon: Icon(Icons.phone_android_rounded),
                    label: Text("Phones")),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            )),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// class Articulo extends StatelessWidget{
//   const Articulo({
//     super.key,
//     required this.obj,
//   });
//   final String obj;

//   @override

//   Widget build(BuildContext context){
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );
//   }

// }

// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });
//   final String pair;
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );

//     return Card(
//       color: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           pair.toLowerCase(),
//           style: style,
//           semanticsLabel: "$pair ",
//         ),
//       ),
//     );
//   }
// }

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
