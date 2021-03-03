import 'package:projeto2/dababase/config_database.dart';
import 'package:projeto2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {

  static const _tableName = 'CONTACT';
  static const _id = 'id';
  static const _nome = 'nome';
  static const _numeroConta = 'numero_conta';

  static const tableSql = "CREATE TABLE $_tableName ("
      "$_id INTEGER primary key,"
      "$_nome TEXT,"
      "$_numeroConta INTEGER"
      ")";

  Map<String,dynamic> _toMap(Contact contact){
    Map<String, dynamic> map = Map();

    if(contact.id != null){
      map[_id] = contact.id;
    }
    map[_nome] = contact.nome;
    map[_numeroConta] = contact.numero;
    return map;
  }

  Future<int> saveContact(Contact contact) async{
    Database banco = await createDatabase();
    return banco.insert('CONTACT', _toMap(contact));
  }

  Future<int> editContact(Contact contact) async{
    Database banco = await createDatabase();
    return banco.update('$_tableName', _toMap(contact),where: "id = ?", whereArgs: [contact.id]);
  }

  Future<List<Contact>> findAllContact() async {
    // passando para SINCRONO
    Database banco = await createDatabase();
    List<Map<String, dynamic>> rows = await banco.query('CONTACT', orderBy: '1 asc');

    List<Contact> contacts = List();

    for (Map<String, dynamic> row in rows) {
      //debugPrint(row.toString());
      Contact contact = Contact(
          row['nome'], row['numero_conta'], id: row['id']);
      contacts.add(contact);
    }
    return contacts;
    // SINCRONO
    //      .then((banco){
    //
    //     return banco.query('CONTACT',orderBy: '1 asc').then((rows){
    //      List<Contact> contacts = List();
    //
    //      for(Map<String,dynamic> row in rows){
    //        //debugPrint(row.toString());
    //        Contact contact = Contact(row['nome'],row['numero_conta'],id: row['id']);
    //        contacts.add(contact);
    //      }
    //
    //      return contacts;
    //    });
    // });
  }

  Future<List<Contact>> findByContact(id) async{
    Database banco = await createDatabase();
    List<Map<String, dynamic>> rows = await banco.query(
        "$_tableName",
        where: "id = ?",
        whereArgs: [id],
        orderBy: '1 asc'
    );

    List<Contact> contacts = List();

    for (Map<String, dynamic> row in rows) {
      //debugPrint(row.toString());
      Contact contact = Contact(row[_nome], row[_numeroConta], id: row[_id]);
      contacts.add(contact);
    }
    return contacts;
  }
}