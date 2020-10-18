import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardTipo1(), SizedBox(height: 30.0), _cardTipo2()],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Este es el subtitulo de la tarjeta que puede ser cualquier cosa que se desea mostrar como informacion adicional'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {}),
              FlatButton(
                  child: Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {}),
              SizedBox(
                width: 6.0,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.wallpaperflare.com/static/77/639/813/nature-landscape-mountains-photo-wallpaper.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0), child: Text('Cualquier cosa '))
        ],
      ),
      elevation: 10.0,
    );
  }
}
