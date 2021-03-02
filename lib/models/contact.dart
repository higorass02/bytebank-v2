class Contact {
  int id;
  final String nome;
  final int numero;

  Contact(this.nome, this.numero,{this.id});

  @override
  String toString() {
    return 'Contato {id: $id, nome: $nome, _numeroConta: $numero}';
  }

}