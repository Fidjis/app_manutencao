import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/widgets/cad_empresa.dart';
import 'package:app_manutencao/widgets/cad_equipamento.dart';
import 'package:app_manutencao/widgets/cad_inspecao.dart';
import 'package:app_manutencao/widgets/cad_manutecao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'empresa_page.dart';
import 'equipe_page.dart';
import 'inspecao_page.dart';
import 'manutencao_page.dart';

class Home extends GetView<HomePageController> {
  Home() {
    Get.lazyPut(() => HomePageController());
  }

  final List<Widget> screens = [
    EmpresaPage(),
    ManutencaoPage(),
    InspecaoPage(),
    EquipePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  void _showDialog(BuildContext context, Widget widget) {
    showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return widget;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageStorage(
            child: controller.currentScreen.value,
            bucket: bucket,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              switch (controller.currentTab.value) {
                case 0:
                  _showDialog(context, CadEmpresaModal());
                  break;
                case 1:
                  _showDialog(context, CadManutencao());
                  break;
                case 2:
                  _showDialog(context, CadInspecao());
                  break;
                case 3:
                  _showDialog(context, CadEquipamentoModal());
                  break;
                default:
              }
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          controller.currentScreen = EmpresaPage().obs;
                          controller.currentTab.value = 0;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.dashboard,
                              color: controller.currentTab.value == 0 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Empresas',
                              style: TextStyle(
                                color: controller.currentTab.value == 0 ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          controller.currentScreen =
                              ManutencaoPage().obs; // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 1;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.chat,
                              color: controller.currentTab.value == 1 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Manutenção',
                              style: TextStyle(
                                color: controller.currentTab.value == 1 ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  // Right Tab bar icons

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          controller.currentScreen =
                              InspecaoPage().obs; // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 2;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.edit,
                              color: controller.currentTab.value == 2 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Inspeção',
                              style: TextStyle(
                                color: controller.currentTab.value == 2 ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          controller.currentScreen =
                              EquipePage().obs; // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 3;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.toll,
                              color: controller.currentTab.value == 3 ? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Equipa.',
                              style: TextStyle(
                                color: controller.currentTab.value == 3 ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
