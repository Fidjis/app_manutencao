import 'package:app_manutencao/models/inspecao_model.dart';

class Manutencao {
  int id;
  String epis;
  String atividades;
  String localizacao;
  String frequencia;
  Inspecao inspecao;

  Manutencao({
    this.id,
    this.epis,
    this.atividades,
    this.localizacao,
    this.frequencia,
    this.inspecao,
  });

  factory Manutencao.fromJson(Map<String, dynamic> json) {
    return Manutencao(
      id: json['id'],
      epis: json['epis'],
      atividades: json['atividades'],
      localizacao: json['localizacao'],
      frequencia: json['frequencia'],
      inspecao: Inspecao.fromJson(json['inspecao']),
    );
  }

  String toJson() {
    return """
      {
        "id": $id,
        "epis": "$epis",
        "atividades": "$atividades",
        "localizacao": "$localizacao",
        "frequencia": "$frequencia",
        "inspecao": 
          {
            "id":${inspecao.id}
          }
      }
    """;
  }
}
