import 'package:flutter/material.dart';
import 'package:projeto2/components/loading.dart';
import 'package:projeto2/components/mycard.dart';
import 'package:projeto2/dababase/dao/contact_dao.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/screens/formcontact.dart';

class ContactList extends StatefulWidget {

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Contact contact ;
  List<Contact> listContatos = List();

  ContactDao dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranfer'),
      ),
      body: FutureBuilder(
        // future: Future.delayed(Duration(seconds: 3)).then((value) => findAllContact()),
        future: dao.findAllContact(),
        builder: (context,snapshot){

          List<Contact> contacts = snapshot.data;
          switch(snapshot.connectionState){

            case ConnectionState.none:
              // Ainda nao foi disparado nenhuma chamada assincrona
              break;
            case ConnectionState.waiting:
              return Loading();
              break;
            case ConnectionState.active:
              // Baixar um arquivo
              // carregar barra de progresso
              // processamento ainda nao finalizado
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext ctx,int indice) {
                  Contact listContato = contacts[indice];
                  return MyCard(listContato.nome,listContato.numero.toString(),id: listContato.id);
                },
              );
              break;
          }


          return null;
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:	()	{

            Future<Contact> futuro = Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) {
                      return FormContact();
                    }
                )
            );
            futuro.then((contactReturn) {
              //debugPrint(contactReturn.toString());
              if(contactReturn != null) {
                debugPrint('Transferência recebida no then do Future $contactReturn');
                setState(() =>
                {
                  debugPrint('recarregar! 0')
                  //listContatos.add(contactReturn)
                }
                );
              }
            });
          },
      ),
    );
  }
}