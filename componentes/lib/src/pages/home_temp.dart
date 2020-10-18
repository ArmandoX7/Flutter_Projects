import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola'),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return ListView(
      children: _generaListas(),
    );
  }

  List<Widget> _generaListas() {
    return opciones.map((item){

      return Column(
        children: [
          ListTile(
            title: Text(item+'!'),
            subtitle: Text('cualquier cosa'),
            onTap: () {},
          ),

          Divider(),
        ],
      );
    }).toList();
  }
}
