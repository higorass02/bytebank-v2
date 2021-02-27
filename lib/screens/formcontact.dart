import 'package:flutter/material.dart';
import 'package:projeto2/components/textform.dart';

class FormContact extends StatelessWidget {

  TextEditingController controladorDoCampoName = TextEditingController();
  TextEditingController controladorDoCampoValor  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: Text('Novo Contato'),
        ),
        body: Column(
          children: <Widget>[
            TextForm(
              controladorDoCampoName,
              'Nome',
              'Novo contato',
              teclado: TextInputType.text,
              icone: Icons.account_circle,
            ),
            TextForm(
              controladorDoCampoValor,
              'Numero da conta',
              '0000',
              icone: Icons.call,
              teclado: TextInputType.number,
            ),
            RaisedButton(
              child: Text('Cadastrar'),
              onPressed: () => null,
            ),
          ],
        ),
      )
    );
  }
}