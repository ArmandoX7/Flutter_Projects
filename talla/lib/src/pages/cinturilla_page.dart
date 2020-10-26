import 'package:flutter/material.dart';

class CinturillaPage extends StatefulWidget {
  @override
  _CinturillaPageState createState() => _CinturillaPageState();
}

class _CinturillaPageState extends State<CinturillaPage> {
  String _dropdownValue;
  String _talla;

  bool _visibleCM;
  bool _visibleIN;

  double _currentSliderValueCM;
  double _currentSliderValueIN;
  SingingCharacter _character;

  @override
  void initState() {
    super.initState();

    _dropdownValue = 'CM';

    _visibleCM = true;
    _visibleIN = false;

    _currentSliderValueCM = 58.0;
    _currentSliderValueIN = 22.8;
    _character = SingingCharacter.Normal;
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
          _seleccionLigera(),
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
            'assets/img/cinturilla.png',
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
              min: 58.0,
              max: 113.0,
              divisions: 549,
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
              min: 22.8,
              max: 44.4,
              divisions: 215,
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
  // ( Normal / Ligera )
  Widget _seleccionLigera() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('¿Como deseas sentir el producto?'),
          ListTile(
            title: const Text('Normal'),
            leading: Radio(
              value: SingingCharacter.Normal,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Ligera'),
            leading: Radio(
              value: SingingCharacter.Ligera,
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
    _dropdownValue = 'CM';
  
    _currentSliderValueCM = 58.0;
    _currentSliderValueIN = 22.8;
    */
    if (_dropdownValue == "CM") {
      if (_currentSliderValueCM >= 58.0 && _currentSliderValueCM <= 63.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "2XS";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "XS";
        }
      } else if (_currentSliderValueCM >= 64.0 &&
          _currentSliderValueCM <= 68.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "XS";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "S";
        }
      } else if (_currentSliderValueCM >= 69.0 &&
          _currentSliderValueCM <= 73.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "S";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "M";
        }
      } else if (_currentSliderValueCM >= 74.0 &&
          _currentSliderValueCM <= 79.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "M";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "L";
        }
      } else if (_currentSliderValueCM >= 80.0 &&
          _currentSliderValueCM <= 85.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "L";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "XL";
        }
      } else if (_currentSliderValueCM >= 86.0 &&
          _currentSliderValueCM <= 90.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "2XL";
        }
      } else if (_currentSliderValueCM >= 91.0 &&
          _currentSliderValueCM <= 95.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "2XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "3XL";
        }
      } else if (_currentSliderValueCM >= 96.0 &&
          _currentSliderValueCM <= 101.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "3XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "4XL";
        }
      } else if (_currentSliderValueCM >= 102.0 &&
          _currentSliderValueCM <= 107.9) {
        if (_character == SingingCharacter.Normal) {
          _talla = "4XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "Por el momento no tenemos inventario de esta talla";
        }
      } else if (_currentSliderValueCM >= 108.0 &&
          _currentSliderValueCM <= 113.0) {
        if (_character == SingingCharacter.Normal) {
          _talla =
              "Por el momento no contamos con esta talla para tu tipo de ajuste, elije otra opcion.";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla =
              "Por el momento no contamos con esta talla para tu tipo de ajuste, elije otra opcion.";
        }
      }
    }

    if (_dropdownValue == "IN") {
      if (_currentSliderValueIN >= 22.8 && _currentSliderValueIN <= 25.1) {
        if (_character == SingingCharacter.Normal) {
          _talla = "2XS";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "XS";
        }
      } else if (_currentSliderValueIN >= 25.2 &&
          _currentSliderValueIN <= 27.1) {
        if (_character == SingingCharacter.Normal) {
          _talla = "XS";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "S";
        }
      } else if (_currentSliderValueIN >= 27.2 &&
          _currentSliderValueIN <= 29.0) {
        if (_character == SingingCharacter.Normal) {
          _talla = "S";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "M";
        }
      } else if (_currentSliderValueIN >= 29.1 &&
          _currentSliderValueIN <= 31.4) {
        if (_character == SingingCharacter.Normal) {
          _talla = "M";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "L";
        }
      } else if (_currentSliderValueIN >= 31.5 &&
          _currentSliderValueIN <= 33.8) {
        if (_character == SingingCharacter.Normal) {
          _talla = "L";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "XL";
        }
      } else if (_currentSliderValueIN >= 33.9 &&
          _currentSliderValueIN <= 35.7) {
        if (_character == SingingCharacter.Normal) {
          _talla = "XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "2XL";
        }
      } else if (_currentSliderValueIN >= 35.8 &&
          _currentSliderValueIN <= 37.7) {
        if (_character == SingingCharacter.Normal) {
          _talla = "2XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "3XL";
        }
      } else if (_currentSliderValueIN >= 37.8 &&
          _currentSliderValueIN <= 40.1) {
        if (_character == SingingCharacter.Normal) {
          _talla = "3XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "4XL";
        }
      } else if (_currentSliderValueIN >= 40.2 &&
          _currentSliderValueIN <= 42.4) {
        if (_character == SingingCharacter.Normal) {
          _talla = "4XL";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla = "Por el momento no tenemos inventario de esta talla";
        }
      } else if (_currentSliderValueIN >= 42.5 &&
          _currentSliderValueIN <= 44.4) {
        if (_character == SingingCharacter.Normal) {
          _talla =
              "Por el momento no contamos con esta talla para tu tipo de ajuste, elije otra opcion.";
        }
        if (_character == SingingCharacter.Ligera) {
          _talla =
              "Por el momento no contamos con esta talla para tu tipo de ajuste, elije otra opcion.";
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

enum SingingCharacter { Normal, Ligera }
