import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart'; //importa dependencia de
import 'package:provider/provider.dart';
import 'pages/phone_page.dart'; // Ruta relativa
import 'pages/favorites_page.dart';
import 'pages/articles_page.dart';
import 'DB/articulos.dart';
import './widgets/navigator_rail.dart';
import 'widgets/app_bar_widget.dart';
import 'pages/store_page.dart';

void main() {
  runApp(const MyApp());
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
  const GeneratorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final List<Articulo> _articulos = [];
  List<Articulo> get articulos => _articulos;
  final List<Articulo> _favoritos = [];
  List<Articulo> get favoritos => _favoritos;

  void toggleFavorite(Articulo articulo) {
    if (_favoritos.contains(articulo)) {
      _favoritos.remove(articulo);
    } else {
      _favoritos.add(articulo);
    }
    notifyListeners();
  }

  void agregarArticulo(Articulo articulo) {
    articulos.add(articulo);
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

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
      case 1:
        page = const FavoritesPage();
      case 2:
        page = const ArticlePage();
        break;
      case 3:
        page = const PhonePage();
      case 4:
        page = const StorePage();
      default:
        throw UnimplementedError("Widget no disponible para: $selectedIndex");
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: const AppBarWidget(title: 'Bussines'),
        body: Row(
          children: [
            SafeArea(
              child: CustomNavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                minExtendedWidth: 200,
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
