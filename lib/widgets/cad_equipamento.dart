import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/empresa.model.dart';
import 'package:app_manutencao/models/equipamento_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_form_field.widget.dart';

class CadEquipamentoModal extends GetView<HomePageController> {
  CadEquipamentoModal({Equipamento equipamento}) {
    Get.lazyPut(() => HomePageController());

    if (equipamento != null) {
      isEditMode = true;
      this.equipamento = equipamento;
      textEditingController1 = TextEditingController(text: equipamento.nome);
    } else {
      isEditMode = false;
      textEditingController1 = TextEditingController();
    }
  }

  bool isEditMode;
  Equipamento equipamento = Equipamento();
  TextEditingController textEditingController1;
  TextEditingController textEditingController2;
  TextEditingController textEditingController3;

  List<DropdownMenuItem<Empresa>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Empresa>> items = [];
    for (Empresa company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.nome),
        ),
      );
    }
    return items;
  }

  Empresa _selectedCompany;
  onChangeDropdownItem(Empresa selectedCompany) {
    _selectedCompany = selectedCompany;
    controller.hintDrop.value = _selectedCompany.nome;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 350.0,
        height: 300.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                        'Cadastrar Equipamento',
                        style: TextStyle(fontSize: 21),
                      )),
                      SizedBox(
                        height: 25.0,
                      ),
                      MyTextFormField(
                        labelText: 'Nome:',
                        textEditingController: textEditingController1,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text('Empresa:     '),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<Empresa>(
                              hint: Obx(() => Text(controller.hintDrop.value)),
                              value: _selectedCompany,
                              items: buildDropdownMenuItems(controller.empresas),
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
                          controller.hintDrop.value = 'Selecione uma empresa';
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
                          if (!isEditMode) {
                            equipamento.nome = textEditingController1.text;
                            equipamento.empresa = _selectedCompany;
                            controller.addEquipamento(equipamento.toJson());
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
    );
  }
}
