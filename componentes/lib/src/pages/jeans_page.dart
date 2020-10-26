import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names

class JeansPage extends StatefulWidget {
  @override
  _JeansPageState createState() => _JeansPageState();
}

class _JeansPageState extends State<JeansPage> {
  String dropdownValuePais;
  String dropdownValueUnidad;
  String _talla;

  bool _visibleMX;
  bool _visibleUSA;
  bool _visibleEU;

  bool _visibleCM;
  bool _visibleIN;

  double _currentSliderValueTallaMX;
  double _currentSliderValueTallaUSA;
  double _currentSliderValueTallaEU;
  double _currentSliderValueCM;
  double _currentSliderValueIN;
  SingingCharacter _character;

  @override
  void initState() {
    super.initState();

    dropdownValuePais = 'Mexico';
    dropdownValueUnidad = 'CM';

    _visibleMX = true;
    _visibleUSA = false;
    _visibleEU = false;

    _visibleCM = true;
    _visibleIN = false;

    _currentSliderValueTallaMX = 3;
    _currentSliderValueTallaUSA = 0;
    _currentSliderValueTallaEU = 32;
    _currentSliderValueCM = 53;
    _currentSliderValueIN = 20.8;
    _character = SingingCharacter.firme;

    _talla = "00 - 6";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _mostrarImagen(),
          Divider(),
          _seleccionPais(),
          SizedBox(
            height: 20.0,
          ),
          if (_visibleMX == true) _seleccionTallaMX(),
          if (_visibleUSA == true) _seleccionTallaUSA(),
          if (_visibleEU == true) _seleccionTallaEU(),
          _seleccionUnidad(),
          SizedBox(
            height: 20.0,
          ),
          if (_visibleCM == true) _seleccionMedidaCinturaCM(),
          if (_visibleIN == true) _seleccionMedidaCinturaIN(),
          SizedBox(
            height: 20.0,
          ),
          _seleccionConfort(),
          SizedBox(
            height: 20.0,
          ),
          _botonCalculaTalla(),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }

  // Widget para mostrar la imagen dentro de un Card
  Widget _mostrarImagen() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 80.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'assets/images/jeans.png',
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Widget que contiene un DropDown Button para seleccionar
  // el pais de procedencia de la talla para los Jeans
  Widget _seleccionPais() {
    return Column(
      children: [
        Text('¿En que zona sueles comprar tus jeans?'),
        DropdownButton<String>(
          value: dropdownValuePais,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValuePais = newValue;
              if (dropdownValuePais == "Mexico") {
                _visibleUSA = false;
                _visibleMX = true;
                _visibleEU = false;
              }
              if (dropdownValuePais == "Estados Unidos") {
                _visibleUSA = true;
                _visibleMX = false;
                _visibleEU = false;
              }
              if (dropdownValuePais == "Europa") {
                _visibleUSA = false;
                _visibleMX = false;
                _visibleEU = true;
              }
            });
          },
          items: <String>['Mexico', 'Estados Unidos', 'Europa']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Widget que contiene un Slider para mostrar
  // las tallas MEXICANAS [3-15] en jeans
  Widget _seleccionTallaMX() {
    return Visibility(
      visible: _visibleMX,
      child: Column(
        children: [
          Text('¿Cual es tu talla? (MX)'),
          Slider(
            value: _currentSliderValueTallaMX,
            min: 3,
            max: 15,
            divisions: 6,
            label: _currentSliderValueTallaMX.round().toString(),
            onChanged: (value) {
              setState(() {
                _currentSliderValueTallaMX = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Widget que contiene un Slider para mostrar
  // las tallas AMERICANAS [0-12] en jeans
  Widget _seleccionTallaUSA() {
    return Visibility(
        visible: _visibleUSA,
        child: Column(
          children: [
            Text('¿Cual es tu talla? (USA)'),
            Slider(
              value: _currentSliderValueTallaUSA,
              min: 0,
              max: 12,
              divisions: 6,
              label: _currentSliderValueTallaUSA.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValueTallaUSA = value;
                });
              },
            ),
          ],
        ));
  }

  // Widget que contiene un Slider para mostrar
  // las tallas EUROPEAS [32-44] en jeans
  Widget _seleccionTallaEU() {
    return Visibility(
        visible: _visibleEU,
        child: Column(
          children: [
            Text('¿Cual es tu talla? (EU)'),
            Slider(
              value: _currentSliderValueTallaEU,
              min: 32,
              max: 44,
              divisions: 6,
              label: _currentSliderValueTallaEU.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValueTallaEU = value;
                });
              },
            ),
          ],
        ));
  }

  // Widget que contiene un DropDown Button para
  // seleccionar la unidad de medida para
  // la cintura ( CM / IN )
  Widget _seleccionUnidad() {
    return Column(
      children: [
        Text('Seleccione unidad'),
        DropdownButton<String>(
          value: dropdownValueUnidad,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValueUnidad = newValue;

              if (dropdownValueUnidad == "CM") {
                _visibleCM = true;
                _visibleIN = false;
              }

              if (dropdownValueUnidad == "IN") {
                _visibleCM = false;
                _visibleIN = true;
              }
            });
          },
          items: <String>['CM', 'IN']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Widget que contiene un Slider para mostrar
  // las medidas de la cintura que puede elegir
  // en firme
  Widget _seleccionMedidaCinturaCM() {
    return Visibility(
        visible: _visibleCM,
        child: Column(
          children: [
            Text('¿Cual es la medida de tu cintura? (CM)'),
            Slider.adaptive(
              value: _currentSliderValueCM.toDouble(),
              min: 53.0,
              max: 118.0,
              divisions: 649,
              label: _currentSliderValueCM.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValueCM = value;
                });
              },
            ),
          ],
        ));
  }

  // Widget que contiene un Slider para mostrar
  // las medidas de la cintura que puede elegir
  // en PULGADAS
  Widget _seleccionMedidaCinturaIN() {
    return Visibility(
        visible: _visibleIN,
        child: Column(
          children: [
            Text('¿Cual es la medida de tu cintura? (IN)'),
            Slider.adaptive(
              value: _currentSliderValueIN.toDouble(),
              min: 20.8,
              max: 46.4,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValueIN = value;
                });
              },
              label: _currentSliderValueIN.toStringAsFixed(1),
            ),
          ],
        ));
  }

  // Widget que contiene un Radio Button para
  // seleccionar el ajuste del producto
  // ( FIRME / CONFORT )
  Widget _seleccionConfort() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('¿Como deseas sentir el producto?'),
          ListTile(
            title: const Text('Firme'),
            leading: Radio(
              value: SingingCharacter.firme,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Confort'),
            leading: Radio(
              value: SingingCharacter.confort,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget que contiene un RaisedButton para calcular
  // la talla segun seleccionado las opciones previamente.
  Widget _botonCalculaTalla() {
    return RaisedButton(
      child: Text('Calcula mi talla'),
      textColor: Colors.white,
      onPressed: () => _mostrarResultado(context),
      color: Colors.blue,
      shape: StadiumBorder(),
    );
  }

  // Metodo que calcula las tallas y las muestra en un AlertDialog
  void _mostrarResultado(BuildContext context) {
    /*
    dropdownValuePais = 'Mexico';
    dropdownValueUnidad = 'CM';

    _currentSliderValueTallaMX = 3;
    _currentSliderValueTallaUSA = 0;
    _currentSliderValueTallaEU = 32;
    _currentSliderValueCM = 53;
    _currentSliderValueIN = 20.8;

    */

    if (dropdownValuePais == "Mexico") {
      if (_currentSliderValueTallaMX == 3) {
        if (_currentSliderValueCM >= 53 && _currentSliderValueCM <= 68) {
          if (_character == SingingCharacter.confort) {
            _talla = "00 - 6";
          }

          if (_character == SingingCharacter.firme) {
            _talla = "00 - 6";
            // _talla = "Para una mejor asesoria, es necesario hablar con asesor especializado, click aqui";
          }
        }
        if (_currentSliderValueCM >= 60 && _currentSliderValueCM <= 72) {
          if (_character == SingingCharacter.firme) {
            _talla = "0 - 6";
          }
          if (_character == SingingCharacter.confort) {
            _talla = "0 - 6";
          }
        }
      }
    }

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Resultado'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Te recomendamos la talla:'),
                SizedBox(
                  height: 10.0,
                ),
                Text('$_talla'),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}

enum SingingCharacter { firme, confort }
