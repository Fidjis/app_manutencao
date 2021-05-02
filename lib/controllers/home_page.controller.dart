import 'package:app_manutencao/data/data_service.dart';
import 'package:app_manutencao/models/empresa.model.dart';
import 'package:app_manutencao/models/equipamento_model.dart';
import 'package:app_manutencao/models/inspecao_model.dart';
import 'package:app_manutencao/models/manutencao_model.dart';
import 'package:app_manutencao/views/empresa_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final hintDrop = 'Selecione'.obs;
  final hintDropInspecao = 'Filtrar'.obs;
  final hintDropEquip = 'Filtrar'.obs;
  final hintDropManut = 'Filtrar'.obs;

  final _service = new DataServices();
  final currentTab = 0.obs;
  Rx<Widget> currentScreen = EmpresaPage().obs;

  final isGetEmpresasLoading = false.obs;
  final isGetEquipamentosLoading = false.obs;
  final isGetInspecaoLoading = false.obs;
  final isGetManutencaoLoading = false.obs;

  final empresas = <Empresa>[].obs;
  final equipamentos = <Equipamento>[].obs;
  final inspecao = <Inspecao>[].obs;
  final manutencao = <Manutencao>[].obs;

  void onInit() {
    super.onInit();
    getEmpresas();
    getEquipamentos();
    getManutencao();
    getInspecao();
  }

  void showDialog(BuildContext context, Widget widget) {
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return widget;
      },
    );
  }

  filtrarEquipamentos(String empresaNome) async {
    var aux = equipamentos;
    aux.forEach((element) {
      if (element.empresa.nome != empresaNome) {
        equipamentos.remove(element);
      }
    });
  }

  filtrarInspecao(String equipNome) async {
    var aux = inspecao;
    aux.forEach((element) {
      if (element.equipamento.nome != equipNome) {
        inspecao.remove(element);
      }
    });
  }

  filtrarManutencao(String inspNome) async {
    var aux = manutencao;
    aux.forEach((element) {
      if (element.inspecao.tipo != inspNome) {
        manutencao.remove(element);
      }
    });
  }

  getEmpresas() async {
    isGetEmpresasLoading.value = true;
    await _service.makeGetRequest(_service.getEmpresa).then((data) {
      empresas.value = List<Empresa>.from(data.map((model) => Empresa.fromJson(model)));
      isGetEmpresasLoading.value = false;
    });
  }

  getManutencao() async {
    isGetManutencaoLoading.value = true;
    await _service.makeGetRequest(_service.getManutencao).then((data) {
      manutencao.value = List<Manutencao>.from(data.map((model) => Manutencao.fromJson(model)));
      isGetManutencaoLoading.value = false;
    });
  }

  getEquipamentos() async {
    isGetEquipamentosLoading.value = true;
    await _service.makeGetRequest(_service.getEquipamento).then((data) {
      equipamentos.value = List<Equipamento>.from(data.map((model) => Equipamento.fromJson(model)));
      isGetEquipamentosLoading.value = false;
    });
  }

  getInspecao() async {
    isGetInspecaoLoading.value = true;
    await _service.makeGetRequest(_service.getInspecao).then((data) {
      inspecao.value = List<Inspecao>.from(data.map((model) => Inspecao.fromJson(model)));
      isGetInspecaoLoading.value = false;
    });
  }

  addEmpresa(String json) {
    _service.makePostRequest(_service.postEmpresa, json).then((_) => getEmpresas());
  }

  addEquipamento(String json) {
    print(json);
    _service.makePostRequest(_service.postEquipamento, json).then((_) => getEquipamentos());
  }

  addManutencao(String json) {
    _service.makePostRequest(_service.postManutencao, json).then((_) => getManutencao());
  }

  addInspecao(String json) {
    print(json);
    _service.makePostRequest(_service.postInspecao, json).then((_) => getInspecao());
  }

  edtEmpresa(String json, int id) {
    _service.makePutRequest(_service.putEmpresa, id, json).then((_) => getEmpresas());
  }

  edtEquipamento(String json, int id) {
    _service.makePutRequest(_service.putEquipamento, id, json).then((_) => getEquipamentos());
  }

  deleteEmpresa(int id) {
    _service.makeDeleteRequest(_service.deleteEmpresa, id).then((_) => getEmpresas());
  }

  deleteEquipamento(int id) {
    _service.makeDeleteRequest(_service.deleteEquipamento, id).then((_) => getEquipamentos());
  }

  deleteInspecao(int id) {
    _service.makeDeleteRequest(_service.deleteInspecao, id).then((_) => getInspecao());
  }

  deleteManutencao(int id) {
    _service.makeDeleteRequest(_service.deleteManutencao, id).then((_) => getManutencao());
  }
}
