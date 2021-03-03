import 'package:flutter/material.dart';
import 'package:projeto2/components/textform.dart';
import 'package:projeto2/dababase/dao/contact_dao.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/screens/contactlist.dart';

class FormContact extends StatefulWidget {
  @override
  _FormContactState createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  TextEditingController controladorDoCampoName = TextEditingController();

  TextEditingController controladorDoNumeroConta  = TextEditingController();

  ContactDao dao = ContactDao();

  @override
  Widget build(BuildContext context,{idContact}) {

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
                        dao.saveContact(Contact(novoContato.nome,novoContato.numero)).then((id)=> debugPrint('Contato Cadastrado: $id'));
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

class FormContactEdit extends StatefulWidget {

  final int id;

  FormContactEdit(this.id);

  @override
  _FormContactEditState createState() => _FormContactEditState();
}

class _FormContactEditState extends State<FormContactEdit> {
  TextEditingController controladorDoCampoName = TextEditingController();

  TextEditingController controladorDoNumeroConta  = TextEditingController();

  TextEditingController controladorId  = TextEditingController();

  ContactDao dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Contato'),
      ),
      body: FutureBuilder(
        future: dao.findByContact(widget.id),
        builder: (context, snapshot) {
          debugPrint(context.toString());
          List<Contact> contacts = snapshot.data;

          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              for(Contact C1 in contacts){
                controladorDoCampoName.text = C1.nome;
                controladorDoNumeroConta.text = C1.numero.toString();
                controladorId.text = C1.id.toString();
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      TextForm(
                        controladorId,
                        'Id',
                        'id contrato',
                        teclado: TextInputType.text,
                        icone: Icons.account_circle,
                      ),
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
                              int	itemid	=	int.tryParse(controladorId.text);
                              Contact	editContato	=	Contact(nome,	numero,id: itemid);
                              dao.editContact(Contact(editContato.nome,editContato.numero,id:editContato.id)).then((id)=> debugPrint('Contato Editado: $id'));
                              Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) =>ContactList()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              break;
          }
          return Text('asd');
        },
      )
    );
  }
}

//