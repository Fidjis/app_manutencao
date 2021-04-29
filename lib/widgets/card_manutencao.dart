import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/manutencao_model.dart';
import 'package:flutter/material.dart';

class CardManutencaoWidget extends StatelessWidget {
  const CardManutencaoWidget({
    Key key,
    @required this.controller,
    @required this.manutencao,
  }) : super(key: key);

  final HomePageController controller;
  final Manutencao manutencao;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: new Text(
          manutencao.atividades,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Equip: ${manutencao.inspecao.equipamento.nome}',
              style: TextStyle(fontSize: 11.0),
            ),
            SizedBox(height: 10),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  controller.deleteManutencao(manutencao.id);
                }),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
