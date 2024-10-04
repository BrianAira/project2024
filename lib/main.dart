import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart'; //importa dependencia de
import 'package:provider/provider.dart';
import './pages/phonePage.dart'; // Ruta relativa
import './pages/favoritesPage.dart';
import './pages/articlesPage.dart';
import 'DB/articulos.dart';
import './widgets/navigator_rail.dart';

void main() {
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
              child: customNavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                minExtendedWidth: 150,
                /*NavigationRail(
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
              )*/
              ),
            ),
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
