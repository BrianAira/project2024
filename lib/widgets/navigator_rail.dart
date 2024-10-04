import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import '../main.dart';

class customNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final double minExtendedWidth;

  customNavigationRail({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.minExtendedWidth,
  });
  @override
  Widget build(BuildContext context) {
    final constraints = MediaQuery.of(context).size;
    return NavigationRail(
      extended: constraints.width >= 600,
      minExtendedWidth: minExtendedWidth /*150*/,
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
            icon: Icon(Icons.add_shopping_cart), label: Text("Articles")),
        NavigationRailDestination(
            icon: Icon(Icons.phone_android_rounded), label: Text("Phones")),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected:
          onDestinationSelected /*(value) {
        setState(() {
          selectedIndex = value;
        });
      }*/
      ,
    );
  }
}
