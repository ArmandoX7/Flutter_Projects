import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

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
/*
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

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
    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //  print('builder');
        //  print(snapshot.data);
        return ListView(
          children: _listaItem(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}


*/
