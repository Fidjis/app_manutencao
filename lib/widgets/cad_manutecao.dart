import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/inspecao_model.dart';
import 'package:app_manutencao/models/manutencao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_form_field.widget.dart';

class CadManutencao extends GetView<HomePageController> {
  CadManutencao() {
    Get.lazyPut(() => HomePageController());
  }

  final Manutencao manutencao = Manutencao();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();
  final TextEditingController textEditingController4 = TextEditingController();

  List<DropdownMenuItem<Inspecao>> buildDropdownMenuItems(List insps) {
    List<DropdownMenuItem<Inspecao>> items = [];
    for (Inspecao insp in insps) {
      items.add(
        DropdownMenuItem(
          value: insp,
          child: Text(insp.tipo),
        ),
      );
    }
    return items;
  }

  Inspecao _selectedInspecao;
  onChangeDropdownItem(Inspecao selectedinsp) {
    _selectedInspecao = selectedinsp;
    controller.hintDrop.value = _selectedInspecao.tipo;
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
                          'Cadastrar Manutencao',
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
                          labelText: 'Atividades:',
                          textEditingController: textEditingController2,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MyTextFormField(
                          labelText: 'Localização:',
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
                            Text('insp.:'),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<Inspecao>(
                                hint: Obx(() => Text(controller.hintDrop.value)),
                                value: _selectedInspecao,
                                items: buildDropdownMenuItems(controller.inspecao),
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
                            manutencao.epis = textEditingController1.text;
                            manutencao.atividades = textEditingController2.text;
                            manutencao.localizacao = textEditingController3.text;
                            manutencao.frequencia = textEditingController4.text;
                            manutencao.inspecao = _selectedInspecao;
                            controller.addManutencao(manutencao.toJson());
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
