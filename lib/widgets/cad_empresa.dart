import 'package:app_manutencao/controllers/home_page.controller.dart';
import 'package:app_manutencao/models/empresa.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_form_field.widget.dart';

class CadEmpresaModal extends GetView<HomePageController> {

  CadEmpresaModal(){
    Get.lazyPut(() => HomePageController());
  }

  final Empresa empresa = Empresa();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();

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
                      Center(child: const Text('Cadastrar Empresa', style: TextStyle(fontSize: 21),)),
                      SizedBox(height: 25.0,),
                      MyTextFormField(labelText: 'Nome:', textEditingController: textEditingController1,),
                      SizedBox(height: 10.0,),
                      MyTextFormField(labelText: 'CNPJ:', textEditingController: textEditingController2,),
                      SizedBox(height: 10.0,),
                      MyTextFormField(labelText: 'Contato:', textEditingController: textEditingController3,),
                    ],
                  ),
                )
                ),
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
                        child: const Text('CANCELAR', style: TextStyle(color: Colors.red),),
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
                          controller.addEmpresa(empresa.toJson());
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
    );
  }
}