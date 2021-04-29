

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  final TextEditingController textEditingController;
  
  static const double textFormFieldBorderRadius = 20.0;
  static const bool textFormFieldObscureText = false;
  
  final String labelText;

  const MyTextFormField({
    this.labelText,
    this.textEditingController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: textFormFieldObscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(textFormFieldBorderRadius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(textFormFieldBorderRadius)),
          borderSide: BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(textFormFieldBorderRadius)),
        ),
      ),
    );
  }
}