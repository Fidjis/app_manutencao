import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/equipamento_model.dart';
import 'package:app_manutencao/widgets/card_inspecao_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InspecaoPage extends GetView<HomePageController> {
  InspecaoPage() {
    Get.put(HomePageController());
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<String>> items = [];
    for (Equipamento company in companies) {
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
    controller.hintDropInspecao.value = _selected;
    if (selectedCompany == 'Filtrar') {
      controller.hintDropEquip.value = 'Filtrar';
      controller.getInspecao();
    } else {
      controller.filtrarInspecao(selectedCompany);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspeção'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueAccent[100],
              hint: Obx(() => Text(
                    controller.hintDropInspecao.value,
                    style: TextStyle(color: Colors.white),
                  )),
              value: _selected,
              items: buildDropdownMenuItems(controller.equipamentos),
              onChanged: onChangeDropdownItem,
            ),
          ),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                controller.getInspecao();
              })
        ],
      ),
      body: Scrollbar(
        child: Obx(
          () => controller.isGetInspecaoLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.inspecao.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardInspecaoWidget(controller: controller, inspecao: controller.inspecao[index]);
                  },
                ),
        ),
      ),
    );
  }
}
