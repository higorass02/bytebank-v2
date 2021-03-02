import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:projeto2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then(
    (diretorioBancoDeDados) {
      String caminhoDoDiretorioDoDB = join(diretorioBancoDeDados, 'bytebank.db');

      return openDatabase(
        caminhoDoDiretorioDoDB,
        version: 1,
        //onDowngrade: (banco,anterior,atual){ banco.execute('delete CONTACT'); },
        //onUpgrade: (banco,anterior,atual){ banco.execute('delete CONTACT'); },
        onDowngrade:onDatabaseDowngradeDelete,
        //onUpgrade: (banco,anterior,atual){ banco.execute('drop table CONTACT'); },
        onCreate: (banco,versao){
          banco.execute("CREATE TABLE CONTACT ("
              "id INTEGER primary key,"
              "nome TEXT,"
              "numero_conta INTEGER"
              ")");
        }
      );
    }
  );
}

Future<int> saveContact (Contact contact){
  return createDatabase().then((banco){
    Map<String, dynamic> map = Map();

    map['nome'] = contact.nome;
    map['numero_conta'] = contact.numero;

    return banco.insert('CONTACT',map);
  });
}

Future<List<Contact>> findAllContact (){
   return createDatabase().then((banco){

      return banco.query('CONTACT',orderBy: '1 asc').then((rows){
       List<Contact> contacts = List();

       for(Map<String,dynamic> row in rows){
         //debugPrint(row.toString());
         Contact contact = Contact(row['nome'],row['numero_conta'],id: row['id']);
         contacts.add(contact);
       }

       return contacts;
     });
  });
}