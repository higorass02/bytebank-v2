import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextEditingController _controlador;
  String _rotulo;
  String _dica;
  IconData icone;
  TextInputType teclado;

  TextForm(this._controlador, this._rotulo, this._dica, {this.icone, this.teclado});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: _rotulo,
          hintText: _dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: teclado != null ? teclado : TextInputType.number,
      ),
    );
  }
}