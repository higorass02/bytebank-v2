import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData icone;
  final TextInputType teclado;

  TextForm(this._controlador, this._rotulo, this._dica, {this.icone, this.teclado});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _rotulo == 'Id' ? false : true,
      child: Padding(
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
      ),
    );
  }
}