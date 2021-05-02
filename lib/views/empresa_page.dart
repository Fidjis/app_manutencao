import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/widgets/card_empresa_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpresaPage extends GetView<HomePageController> {
  EmpresaPage() {
    Get.lazyPut(() => HomePageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empresas'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                controller.getEmpresas();
              })
        ],
      ),
      body: Scrollbar(
        child: Obx(
          () => controller.isGetEmpresasLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.empresas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardEmpresaWidget(controller: controller, empresa: controller.empresas[index]);
                  },
                ),
        ),
      ),
    );
  }
}
