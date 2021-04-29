import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/equipamento_model.dart';
import 'package:app_manutencao/models/inspecao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_form_field.widget.dart';

class CadInspecao extends GetView<HomePageController> {
  CadInspecao() {
    Get.lazyPut(() => HomePageController());
  }

  final Inspecao inspecao = Inspecao();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();
  final TextEditingController textEditingController4 = TextEditingController();

  List<DropdownMenuItem<Equipamento>> buildDropdownMenuItems(List equips) {
    List<DropdownMenuItem<Equipamento>> items = [];
    for (Equipamento equip in equips) {
      items.add(
        DropdownMenuItem(
          value: equip,
          child: Text(equip.nome),
        ),
      );
    }
    return items;
  }

  Equipamento _selectedEquipamento;
  onChangeDropdownItem(Equipamento selectedequip) {
    _selectedEquipamento = selectedequip;
    controller.hintDrop.value = _selectedEquipamento.nome;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 350.0,
        height: 500.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Spacing.small(),
                        Center(
                            child: const Text(
                          'Cadastrar Inspecao',
                          style: TextStyle(fontSize: 21),
                        )),
                        SizedBox(
                          height: 25.0,
                        ),
                        MyTextFormField(
                          labelText: 'EPIs:',
                          textEditingController: textEditingController1,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MyTextFormField(
                          labelText: 'Elementos:',
                          textEditingController: textEditingController2,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MyTextFormField(
                          labelText: 'Tipo:',
                          textEditingController: textEditingController3,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MyTextFormField(
                          labelText: 'Frequencia:',
                          textEditingController: textEditingController4,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text('Equipa.:     '),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<Equipamento>(
                                hint: Obx(() => Text(controller.hintDrop.value)),
                                value: _selectedEquipamento,
                                items: buildDropdownMenuItems(controller.equipamentos),
                                onChanged: onChangeDropdownItem,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.hintDrop.value = 'Selecione';
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'CANCELAR',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      // Spacing.normal(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          right: 15.0,
                        ),
                        child: TextButton(
                          onPressed: () {
                            inspecao.epis = textEditingController1.text;
                            inspecao.elementos = textEditingController2.text;
                            inspecao.tipo = textEditingController3.text;
                            inspecao.frequencia = textEditingController4.text;
                            inspecao.equipamento = _selectedEquipamento;
                            controller.addInspecao(inspecao.toJson());
                            controller.hintDrop.value = 'Selecione';
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'CADASTRAR',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
