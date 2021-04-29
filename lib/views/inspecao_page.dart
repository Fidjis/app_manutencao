import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/widgets/card_inspecao_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InspecaoPage extends GetView<HomePageController> {

  InspecaoPage(){
    Get.put(HomePageController());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspeção'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), 
            onPressed: (){
              controller.getInspecao();
            }
          )
        ],
      ),
      body: Scrollbar(
        child: Obx(() => controller.isGetInspecaoLoading.value ? Center(child: CircularProgressIndicator()) : ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.inspecao.length,
          itemBuilder: (BuildContext context, int index) {
            return CardInspecaoWidget(controller: controller, inspecao: controller.inspecao[index]);
          },
        ),),
      ),
    );
  }
}