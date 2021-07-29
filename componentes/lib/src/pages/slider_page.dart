import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloqueatCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearChecbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        //divisions: 20,
        min: 10,
        max: 400,
        value: _valorSlider,
        onChanged: (_bloqueatCheck) ? null : (valor) {
          setState(() {
            _valorSlider = valor;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://media.metrolatam.com/2019/03/01/batmannew52image-f18c8de05e057731e75071dc11f7aa2a-1200x800.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearChecbox() {
    //return Checkbox(
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloqueatCheck, 
      onChanged: (valor) {
        setState(() {
          _bloqueatCheck = valor;  
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloqueatCheck, 
      onChanged: (valor) {
        setState(() {
          _bloqueatCheck = valor;  
        });
      }
    );
  }
}
