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
        final double itemWith = 250;

        int crossAxisCount;

        if (constraints.maxWidth >= itemWith * 3) {
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
                childAspectRatio: 2 / 4), //relacion de alto y ancho
            itemCount: _phoneList.length,
            itemBuilder: (context, index) {
              return ArticuloCard(
                  articulo: _phoneList[
                      index]); //definir articulos filtrados de telefonos
            });
      }),
    );
  }
}
