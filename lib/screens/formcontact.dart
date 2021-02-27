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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
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
                Padding(
                  padding:const EdgeInsets.only(top:16),
                  child: SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: RaisedButton(
                      child: Text('Cadastrar'),
                      onPressed: () => debugPrint('cadastrar novo contato'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}