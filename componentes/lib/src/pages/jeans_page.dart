import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
String dropdownValue = 'Mexico';
bool _visible = false;

class JeansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class JeansTalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(),
              _SeleccionPais(),
              SizedBox(
                height: 20.0,
              ),
              if (_visible == true) _SeleccionTallaMX(),
              if (_visible == true) _SeleccionTallaUSA(),
              if (_visible == true) _SeleccionTallaEU(),
              _SeleccionMedidaCintura(),
              SizedBox(
                height: 20.0,
              ),
              _seleccionUnidad(),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                child: Text(
                  'Calcula mi talla',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                color: Colors.blue,
                height: 50.0,
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names

  Widget _seleccionUnidad() {
    return Column(
      children: [
        Text('Seleccione unidad'),
        _SeleccionUnidad(),
      ],
    );
  }
}

class _SeleccionPais extends StatefulWidget {
  @override
  _SeleccionPaisState createState() => _SeleccionPaisState();
}

class _SeleccionPaisState extends State<_SeleccionPais> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('¿En que zona sueles comprar tus jeans?'),
        DropdownButton<String>(
          value: dropdownValue,
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
              dropdownValue = newValue;
              if (dropdownValue == "Estados Unidos") {
                _visible = !_visible;
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
}

class _SeleccionTallaMX extends StatefulWidget {
  @override
  _SeleccionTallaMXState createState() => _SeleccionTallaMXState();
}

class _SeleccionTallaMXState extends State<_SeleccionTallaMX> {
  double _currentSliderValue = 3;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: _visible == true,
        child: Container(
          child: Column(
            children: [
              Text('¿Cual es tu talla? (MX)'),
              Slider(
                value: _currentSliderValue,
                min: 3,
                max: 15,
                divisions: 6,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    if (value.toString() == "Mexico") {
                      _visible = !_visible;
                    }
                  });
                },
              ),
            ],
          ),
        ));
  }
}

class _SeleccionTallaUSA extends StatefulWidget {
  @override
  _SeleccionTallaUSAState createState() => _SeleccionTallaUSAState();
}

class _SeleccionTallaUSAState extends State<_SeleccionTallaUSA> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: _visible,
        child: Column(
          children: [
            Text('¿Cual es tu talla? (USA)'),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 12,
              divisions: 6,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ));
  }
}

class _SeleccionTallaEU extends StatefulWidget {
  @override
  _SeleccionTallaEUState createState() => _SeleccionTallaEUState();
}

class _SeleccionTallaEUState extends State<_SeleccionTallaEU> {
  double _currentSliderValue = 32;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: _visible,
        child: Column(
          children: [
            Text('¿Cual es tu talla? (EU)'),
            Slider(
              value: _currentSliderValue,
              min: 32,
              max: 44,
              divisions: 6,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ));
  }
}

class _SeleccionMedidaCintura extends StatefulWidget {
  @override
  _SeleccionMedidaCinturaState createState() => _SeleccionMedidaCinturaState();
}

class _SeleccionMedidaCinturaState extends State<_SeleccionMedidaCintura> {
  double _currentSliderValue = 50;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('¿Cual es la medida de tu cintura?'),
        Slider(
          value: _currentSliderValue,
          min: 50,
          max: 100,
          divisions: 50,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}

enum SingingCharacter { centimetros, inches }

/// This is the stateful widget that the main application instantiates.
class _SeleccionUnidad extends StatefulWidget {
  _SeleccionUnidad({Key key}) : super(key: key);

  @override
  __SeleccionUnidadState createState() => __SeleccionUnidadState();
}

/// This is the private State class that goes with _SeleccionUnidad.
class __SeleccionUnidadState extends State<_SeleccionUnidad> {
  SingingCharacter _character = SingingCharacter.centimetros;

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: const Text('CM'),
            leading: Radio(
              value: SingingCharacter.centimetros,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('IN'),
            leading: Radio(
              value: SingingCharacter.inches,
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
}
