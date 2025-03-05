import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/navigation_rail.dart';
import 'articles_page.dart';
import 'favorites_page.dart';
//import 'phone_page.dart';
import 'store_page.dart';
import 'pruebaapi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
        page = const ArticlePage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const ArticlePage(); //PhonePage();
        break;
      case 3:
        page = const StorePage();
        break;
      //case 4:
      //page = ProductosPage();
      //break;
      default:
        throw UnimplementedError("Widget no disponible para: $selectedIndex");
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Business'),
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
  }
}
