import 'package:flutter/material.dart';
import 'package:projeto2/models/contact.dart';
import 'file:///C:/Users/Higor/Desktop/Projetos_flutterz/projeto2/lib/screens/Contact/formcontact.dart';

class MyCard extends StatefulWidget {
  final String _rotulo;
  final String _dica;
  final IconData icone;
  final int id;

  MyCard(this._rotulo, this._dica, {this.icone, this.id});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Card(
          child: ListTile(
            title: Text(widget._rotulo,style: TextStyle(fontSize: 24.0)),
            subtitle: Text(widget._dica,style: TextStyle(fontSize: 16.0),),
            leading: widget.icone != null ? Icon(widget.icone) : null,
            trailing: InkWell(
              child: Icon(Icons.drive_file_rename_outline),
              onTap: (){
                Future<Contact> contact = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) {
                          if(widget.id != null){
                            //debugPrint(widget.id.toString());
                            return FormContactEdit(widget.id);
                          }else{
                            return FormContact();
                          }
                        }
                    )
                );
                contact.then((contactReturn) {
                  //debugPrint(contactReturn.toString());
                  if(contactReturn != null) {
                    //debugPrint('Transferência recebida no then do Future $contactReturn');
                    setState(() =>
                    {
                      //debugPrint('recarregar! 0'),
                      //listContatos.add(contactReturn)
                    }
                    );
                  }
                });
              },

            ),
          ),
        ),
      ),
    );
  }
}