import 'package:app_manutencao/models/equipamento_model.dart';

class Inspecao {
  int id;
  String epis;
  String elementos;
  String tipo;
  String frequencia;
  Equipamento equipamento;

  Inspecao({
    this.id,
    this.epis,
    this.elementos,
    this.tipo,
    this.frequencia,
    this.equipamento,
  });

  factory Inspecao.fromJson(Map<String, dynamic> json) {
    return Inspecao(
        id: json['id'],
        epis: json['epis'],
        elementos: json['elementos'],
        tipo: json['tipo'],
        frequencia: json['frequencia'],
        equipamento: Equipamento.fromJson(json['equipamento']));
  }

  String toJson() {
    return """
      {
        "id": $id,
        "epis": "$epis",
        "elementos": "$elementos",
        "tipo": "$tipo",
        "frequencia": "$frequencia",
        "equipamento": 
          {
            "id":${equipamento.id}
          }
      }
    """;
  }
}
