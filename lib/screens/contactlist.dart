import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cantacts'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('asd'),
              subtitle: Text('123'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return null;
                })
            );
          },
      ),
    );
  }
}