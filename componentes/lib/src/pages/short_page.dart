import 'package:flutter/material.dart';

class ShortPage extends StatefulWidget {
  @override
  _ShortPageState createState() => _ShortPageState();
}

class _ShortPageState extends State<ShortPage> {
  String _dropdownValue;
  String _talla;

  bool _visibleCM;
  bool _visibleIN;

  double _currentSliderValueCM;
  double _currentSliderValueIN;

  @override
  void initState() {
    super.initState();

    _dropdownValue = 'CM';

    _visibleCM = true;
    _visibleIN = false;

    _currentSliderValueCM = 44.9;
    _currentSliderValueIN = 17.7;

    _talla = "2XS";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _mostrarImagen(),
          _seleccionUnidad(),
          if (_visibleCM == true) _seleccionMedidaCinturaCM(),
          if (_visibleIN == true) _seleccionMedidaCinturaIN(),
          SizedBox(
            height: 20.0,
          ),
          _botonCalculaTalla()
        ],
      ),
    );
  }

  Widget _mostrarImagen() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'assets/images/short.png',
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _seleccionUnidad() {
    return Column(
      children: [
        Text('Seleccione unidad'),
        DropdownButton<String>(
          value: _dropdownValue,
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
              _dropdownValue = newValue;

              if (_dropdownValue == "CM") {
                _visibleCM = true;
                _visibleIN = false;
              }

              if (_dropdownValue == "IN") {
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
  // en Normal
  Widget _seleccionMedidaCinturaCM() {
    return Visibility(
        visible: _visibleCM,
        child: Column(
          children: [
            Text('¿Cual es la medida de tu cintura? (CM)'),
            Slider.adaptive(
              value: _currentSliderValueCM.toDouble(),
              min: 44.9,
              max: 75.9,
              divisions: 309,
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
              min: 17.7,
              max: 29.9,
              divisions: 121,
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
    if (_dropdownValue == "CM") {
      if (_currentSliderValueCM >= 44.9 && _currentSliderValueCM <= 48.6) {
        _talla = "2XS";
      } else if (_currentSliderValueCM >= 48.7 &&
          _currentSliderValueCM <= 52.7) {
        _talla = "XS";
      } else if (_currentSliderValueCM >= 52.8 &&
          _currentSliderValueCM <= 56.7) {
        _talla = "S";
      } else if (_currentSliderValueCM >= 56.8 &&
          _currentSliderValueCM <= 60.8) {
        _talla = "M";
      } else if (_currentSliderValueCM >= 60.9 &&
          _currentSliderValueCM <= 64.6) {
        _talla = "L";
      } else if (_currentSliderValueCM >= 64.7 &&
          _currentSliderValueCM <= 68.7) {
        _talla = "XL";
      } else if (_currentSliderValueCM >= 68.8 &&
          _currentSliderValueCM <= 72.7) {
        _talla = "2XL";
      } else if (_currentSliderValueCM >= 72.8 &&
          _currentSliderValueCM <= 75.9) {
        _talla = "3XL";
      }
    }

    if (_dropdownValue == "IN") {
      if (_currentSliderValueIN >= 17.7 && _currentSliderValueIN <= 19.1) {
        _talla = "2XS";
      } else if (_currentSliderValueIN >= 19.2 &&
          _currentSliderValueIN <= 20.7) {
        _talla = "XS";
      } else if (_currentSliderValueIN >= 20.8 &&
          _currentSliderValueIN <= 22.3) {
        _talla = "S";
      } else if (_currentSliderValueIN >= 22.4 &&
          _currentSliderValueIN <= 23.9) {
        _talla = "M";
      } else if (_currentSliderValueIN >= 24.0 &&
          _currentSliderValueIN <= 25.4) {
        _talla = "L";
      } else if (_currentSliderValueIN >= 25.5 &&
          _currentSliderValueIN <= 27.0) {
        _talla = "XL";
      } else if (_currentSliderValueIN >= 27.1 &&
          _currentSliderValueIN <= 28.6) {
        _talla = "2XL";
      } else if (_currentSliderValueIN >= 28.7 &&
          _currentSliderValueIN <= 29.9) {
        _talla = "3XL";
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
