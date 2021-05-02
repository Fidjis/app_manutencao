import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/equipamento_model.dart';
import 'package:app_manutencao/models/inspecao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_form_field.widget.dart';

class CadInspecao extends GetView<HomePageController> {
  CadInspecao({Inspecao inspecao}) {
    Get.lazyPut(() => HomePageController());

    if (inspecao != null) {
      isEditMode = true;
      this.inspecao = inspecao;
      textEditingController1 = TextEditingController(text: inspecao.epis);
      textEditingController2 = TextEditingController(text: inspecao.elementos);
      textEditingController3 = TextEditingController(text: inspecao.tipo);
      textEditingController4 = TextEditingController(text: inspecao.frequencia);
    } else {
      isEditMode = false;
      textEditingController1 = TextEditingController();
      textEditingController2 = TextEditingController();
      textEditingController3 = TextEditingController();
      textEditingController4 = TextEditingController();
    }
  }

  bool isEditMode;

  Inspecao inspecao = Inspecao();
  TextEditingController textEditingController1;
  TextEditingController textEditingController2;
  TextEditingController textEditingController3;
  TextEditingController textEditingController4;

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
                          child: Text(
                            isEditMode ? '' : 'CANCELAR',
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
                            if (isEditMode) {
                              //controller.edtEmpresa(empresa.toJson(), empresa.id);
                            } else {
                              inspecao.epis = textEditingController1.text;
                              inspecao.elementos = textEditingController2.text;
                              inspecao.tipo = textEditingController3.text;
                              inspecao.frequencia = textEditingController4.text;
                              inspecao.equipamento = _selectedEquipamento;
                              controller.addInspecao(inspecao.toJson());
                              controller.hintDrop.value = 'Selecione';
                            }
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            isEditMode ? 'FECHAR' : 'CADASTRAR',
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
