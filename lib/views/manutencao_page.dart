import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/inspecao_model.dart';
import 'package:app_manutencao/widgets/card_manutencao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManutencaoPage extends GetView<HomePageController> {
  ManutencaoPage() {
    Get.put(HomePageController());
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<String>> items = [];
    for (Inspecao company in companies) {
      items.add(
        DropdownMenuItem(
          value: company.tipo,
          child: Text(
            company.tipo,
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
    controller.hintDropManut.value = _selected;
    if (selectedCompany == 'Filtrar') {
      controller.hintDropManut.value = 'Filtrar';
      controller.getManutencao();
    } else {
      controller.filtrarManutencao(selectedCompany);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manutenção'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueAccent[100],
              hint: Obx(() => Text(
                    controller.hintDropManut.value,
                    style: TextStyle(color: Colors.white),
                  )),
              value: _selected,
              items: buildDropdownMenuItems(controller.inspecao),
              onChanged: onChangeDropdownItem,
            ),
          ),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                controller.getManutencao();
              })
        ],
      ),
      body: Scrollbar(
        child: Obx(
          () => controller.isGetManutencaoLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.manutencao.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardManutencaoWidget(controller: controller, manutencao: controller.manutencao[index]);
                  },
                ),
        ),
      ),
    );
  }
}
