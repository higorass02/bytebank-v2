import 'package:flutter/material.dart';
import 'package:projeto2/components/textform.dart';
import 'package:projeto2/dababase/config_database.dart';
import 'package:projeto2/models/contact.dart';

class FormContact extends StatefulWidget {

  @override
  _FormContactState createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  TextEditingController controladorDoCampoName = TextEditingController();

  TextEditingController controladorDoNumeroConta  = TextEditingController();

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
                  controladorDoNumeroConta,
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
                      onPressed: () {
                        String	nome	=	controladorDoCampoName.text;
                        int	numero	=	int.tryParse(controladorDoNumeroConta.text);
                        Contact	novoContato	=	Contact(nome,	numero);
                        saveContact(Contact(novoContato.nome,novoContato.numero)).then((id)=> debugPrint('Contato Cadastrado: $id'));
                        Navigator.pop(context,	novoContato);
                      },
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