import 'package:flutter/material.dart';
import 'package:projeto2/components/mycard.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/screens/formcontact.dart';
import 'package:projeto2/dababase/config_database.dart';

class ContactList extends StatefulWidget {

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Contact contact ;
  List<Contact> listContatos = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cantacts'),
      ),
      body: FutureBuilder(
        future: findAllContact(),
        builder: (context,snapshot){
          List<Contact> contacts = snapshot.data;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext ctx,int indice) {
              Contact listContato = contacts[indice];
              return MyCard(listContato.nome,listContato.numero.toString());
            },
          );
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
              if(contactReturn != null) {
                debugPrint('Transferência recebida no then do Future $contactReturn');
                setState(() =>
                {
                  listContatos.add(contactReturn)
                }
                );
              }
            });
          },
      ),
    );
  }
}