import 'dart:convert';

import 'package:http/http.dart' as http;

class DataServices {
  final getEmpresa = 'https://app-manut-senai.herokuapp.com/api/empresa/obter';
  final postEmpresa = 'https://app-manut-senai.herokuapp.com/api/empresa/incluir';
  final putEmpresa = 'https://app-manut-senai.herokuapp.com/api/empresa/{id}';
  final deleteEmpresa = 'https://app-manut-senai.herokuapp.com/api/empresa/{id}/excluir';

  final getEquipamento = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/obter';
  final postEquipamento = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/incluir';
  final putEquipamento = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/{id}';
  final deleteEquipamento = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/{id}/excluir';

  final getInspecao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/obter';
  final postInspecao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/incluir';
  final putInspecao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/{id}';
  final deleteInspecao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/{id}/excluir';

  final getManutencao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/manutencao/obter';
  final postManutencao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/manutencao/incluir';
  final putManutencao = 'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/manutencao/{id}';
  final deleteManutencao =
      'https://app-manut-senai.herokuapp.com/api/empresa/equipamento/inspecao/manutencao/{id}/excluir';

  Future<Iterable> makeGetRequest(String url) async {
    var response = await http.get(
      Uri.parse(url),
    );
    String json = response.body;
    print(json);

    if (response.statusCode == 200) {
      Iterable l = jsonDecode(utf8.decode(response.bodyBytes));
      return l;
    } else {
      throw Exception('Falha no Get');
    }
  }

  makePostRequest(String url, String json) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post(Uri.parse(url), headers: headers, body: json);
    String body = response.body;
    print(body);
  }

  makePutRequest(String principalurl, int id) async {
    String url = principalurl.replaceFirst('{id}', id.toString());
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"title": "Hello", "body": "body text", "userId": 1}';
    var response = await http.put(Uri.parse(url), headers: headers, body: json);
    String body = response.body;
    print(body);
  }

  makeDeleteRequest(String principalurl, int id) async {
    String url = principalurl.replaceFirst('{id}', id.toString());
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.delete(Uri.parse(url), headers: headers);
    String body = response.body;
    print(body);
  }
}
