import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/widgets/card_manutencao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManutencaoPage extends GetView<HomePageController> {

  ManutencaoPage(){
    Get.put(HomePageController());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manutenção'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), 
            onPressed: (){
              controller.getManutencao();
            }
          )
        ],
      ),
      body: Scrollbar(
        child: Obx(() => controller.isGetManutencaoLoading.value ? Center(child: CircularProgressIndicator()) : ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.manutencao.length,
          itemBuilder: (BuildContext context, int index) {
            return CardManutencaoWidget(controller: controller, manutencao: controller.manutencao[index]);
          },
        ),),
      ),
    );
  }
}