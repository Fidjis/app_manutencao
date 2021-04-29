import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/widgets/card_equipamento_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipePage extends GetView<HomePageController> {

  EquipePage(){
    Get.put(HomePageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), 
            onPressed: (){
              controller.getEquipamentos();
            }
          )
        ],
      ),
      body: Scrollbar(
        child: Obx(() => controller.isGetEquipamentosLoading.value ? Center(child: CircularProgressIndicator()) : ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.equipamentos.length,
          itemBuilder: (BuildContext context, int index) {
            return CardEquipamentoWidget(controller: controller, equipamento: controller.equipamentos[index]);
          },
        ),),
      ),
    );
  }
}