import 'package:app_manutencao/models/empresa.model.dart';

class Equipamento {
  int id;
  String nome;
  Empresa empresa;

  Equipamento({this.id, this.nome, this.empresa});

  factory Equipamento.fromJson(Map<String, dynamic> json) {
    return Equipamento(
      id: json['id'],
      nome: json['nome'],
      empresa: Empresa.fromJson(json['empresa']),
    );
  }

  String toJson() {
    return """
      {
        "nome": "$nome",
        "empresa": ${empresa.toJson()}
      }
    """;
  }
}
