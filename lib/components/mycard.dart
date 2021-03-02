import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String _rotulo;
  String _dica;
  IconData icone;

  MyCard(this._rotulo, this._dica, {this.icone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(_rotulo),
          subtitle: Text(_dica),
          leading: icone != null ? Icon(icone) : null,
        ),
      ),
    );
  }
}