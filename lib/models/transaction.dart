
import 'package:projeto2/models/contact.dart';

class Transaction {
  final String id;
  final double value;
  final Contact contact;

  Transaction(
      this.value,
      this.contact,
      {this.id}
      );

  @override
  String toString() {
    return 'Transaction{id: $id value: $value, contact: $contact}';
  }

}