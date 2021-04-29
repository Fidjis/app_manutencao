import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/empresa.model.dart';
import 'package:flutter/material.dart';

class CardEmpresaWidget extends StatelessWidget {
  const CardEmpresaWidget({
    Key key,
    @required this.controller,
    @required this.empresa,
  }) : super(key: key);

  final HomePageController controller;
  final Empresa empresa;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: new Text(
          'Nome: ${empresa.nome}',
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'CNPJ: ${empresa.cnpj}',
              style: TextStyle(fontSize: 11.0),
            ),
            Text(
              'Contato: ${empresa.contato}',
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
                  controller.deleteEmpresa(empresa.id);
                }),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
