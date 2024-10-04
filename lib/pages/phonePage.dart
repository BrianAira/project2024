import 'package:flutter/material.dart';
import '../widgets/articuloCard.dart';
import '../DB/articulos.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  List<Articulo> _phoneList = [];
  @override
  void initState() {
    super.initState();
    _filterPhone();
  }

  void _filterPhone() {
    setState(() {
      _phoneList =
          articulos.where((articulo) => articulo.tipo == "Telefono").toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phones'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final double itemWith = 200;
        final double minWidthForSingleColumn = 200;
        int crossAxisCount;

        if (constraints.maxWidth < minWidthForSingleColumn) {
          crossAxisCount = 1;
        } else {
          crossAxisCount = (constraints.maxWidth / itemWith).floor();
        }
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4),
            itemBuilder: (context, index) {
              return ArticuloCard(
                  articulo: _phoneList[
                      index]); //definir articulos filtrados de telefonos
            });
      }),
    );
  }
}
