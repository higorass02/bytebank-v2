import 'package:flutter/material.dart';
import 'package:projeto2/screens/contactlist.dart';

class Dashborad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          mainAxisAlignment: 	MainAxisAlignment.spaceBetween,
          crossAxisAlignment:	CrossAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton (
                    color: Colors.transparent,
                    splashColor: Colors.black26,
                    child: Container(
                      height:	100,
                      width:	150,
                      color:	Theme.of(context).primaryColor,
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
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) {
                            return ContactList();
                          }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}