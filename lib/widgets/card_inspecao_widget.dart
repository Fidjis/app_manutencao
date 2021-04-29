import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/inspecao_model.dart';
import 'package:flutter/material.dart';

class CardInspecaoWidget extends StatelessWidget {
  const CardInspecaoWidget({
    Key key,
    @required this.controller,
    @required this.inspecao,
  }) : super(key: key);

  final HomePageController controller;
  final Inspecao inspecao;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: new Text(
          '${inspecao.tipo}',
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Equip: ${inspecao.equipamento.nome}',
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
                  controller.deleteInspecao(inspecao.id);
                }),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
