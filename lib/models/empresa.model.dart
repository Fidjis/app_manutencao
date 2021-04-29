class Empresa {
  int id;
  String nome;
  String cnpj;
  String contato;
  List<dynamic> equipamentos;

  Empresa({this.id, this.nome, this.cnpj, this.contato, this.equipamentos});

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      id: json['id'],
      nome: json['nome'],
      cnpj: json['cnpj'],
      contato: json['contato'],
      equipamentos: json['equipamentos'],
    );
  }

  String toJson() {
    return """
      {
        "id": "$id",
        "nome": "$nome",
        "cnpj": "$cnpj",
        "contato": "$contato"
      }
    """;
  }
}
