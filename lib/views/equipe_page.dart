import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/empresa.model.dart';
import 'package:app_manutencao/widgets/card_equipamento_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipePage extends GetView<HomePageController> {
  EquipePage() {
    Get.put(HomePageController());
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<String>> items = [];
    for (Empresa company in companies) {
      items.add(
        DropdownMenuItem(
          value: company.nome,
          child: Text(
            company.nome,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    items.add(
      DropdownMenuItem(
        value: 'Filtrar',
        child: Text(
          'Limpar',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
    return items;
  }

  String _selected;
  onChangeDropdownItem(String selectedCompany) {
    _selected = selectedCompany;
    controller.hintDropEquip.value = _selected;
    if (selectedCompany == 'Filtrar') {
      controller.hintDropEquip.value = 'Filtrar';
      controller.getEquipamentos();
    } else {
      controller.filtrarEquipamentos(selectedCompany);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueAccent[100],
              hint: Obx(() => Text(
                    controller.hintDropEquip.value,
                    style: TextStyle(color: Colors.white),
                  )),
              value: _selected,
              items: buildDropdownMenuItems(controller.empresas),
              onChanged: onChangeDropdownItem,
            ),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.getEquipamentos();
            },
          )
        ],
      ),
      body: Scrollbar(
        child: Obx(
          () => controller.isGetEquipamentosLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.equipamentos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardEquipamentoWidget(controller: controller, equipamento: controller.equipamentos[index]);
                  },
                ),
        ),
      ),
    );
  }
}
