import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import '../main.dart';

class CustomNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final double minExtendedWidth;

  const CustomNavigationRail({
    super.key,
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
      destinations: const [
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
        NavigationRailDestination(
            icon: Icon(Icons.store), label: Text('Store')),
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
