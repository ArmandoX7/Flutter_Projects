import 'package:flutter/material.dart';
import 'package:hello_world/src/providers/menu_provider.dart';
import 'package:hello_world/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Componentes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItem(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        title: Text(opt['texto']),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
