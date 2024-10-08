import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart'; //importa dependencia de
import 'package:provider/provider.dart';
import './pages/phonePage.dart'; // Ruta relativa
import './pages/favoritesPage.dart';
import './pages/articlesPage.dart';
import 'DB/articulos.dart';
import './widgets/navigator_rail.dart';
import './widgets/appBarWidget.dart';

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
        appBar: appBarWidget(title: 'Bussines'),
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
