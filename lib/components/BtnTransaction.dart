import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto2/screens/contactlist.dart';

class BtnTransaction extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Theme.of(context).primaryColor,
            child: InkWell (
              child: Container(
                height:	100,
                width:	150,
                padding:	EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment:	MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:	CrossAxisAlignment.start,
                  children:	<Widget>[
                    Icon(Icons.people,color:	Colors.white, size: 32,),
                    Text('Contacts', style: TextStyle(color: Colors.white,fontSize: 16.0)),
                  ],
                ),
              ),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) =>ContactList()),
                );
              },
            ),
          ),
        ),
      ]
    );
  }
}