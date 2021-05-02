import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/empresa.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_form_field.widget.dart';

class CadEmpresaModal extends GetView<HomePageController> {
  CadEmpresaModal({Empresa empresa}) {
    Get.lazyPut(() => HomePageController());

    if (empresa != null) {
      isEditMode = true;
      this.empresa = empresa;
      textEditingController1 = TextEditingController(text: empresa.nome);
      textEditingController2 = TextEditingController(text: empresa.cnpj);
      textEditingController3 = TextEditingController(text: empresa.contato);
    } else {
      isEditMode = false;
      textEditingController1 = TextEditingController();
      textEditingController2 = TextEditingController();
      textEditingController3 = TextEditingController();
    }
  }

  bool isEditMode;
  Empresa empresa = Empresa();
  TextEditingController textEditingController1;
  TextEditingController textEditingController2;
  TextEditingController textEditingController3;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 350.0,
        height: 350.0,
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
                        'Cadastrar Empresa',
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
                      MyTextFormField(
                        labelText: 'CNPJ:',
                        textEditingController: textEditingController2,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MyTextFormField(
                        labelText: 'Contato:',
                        textEditingController: textEditingController3,
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
                          empresa.nome = textEditingController1.text;
                          empresa.cnpj = textEditingController2.text;
                          empresa.contato = textEditingController3.text;
                          if (isEditMode) {
                            //controller.edtEmpresa(empresa.toJson(), empresa.id);
                          } else {
                            controller.addEmpresa(empresa.toJson());
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
