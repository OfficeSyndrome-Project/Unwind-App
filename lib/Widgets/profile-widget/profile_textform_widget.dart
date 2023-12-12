import 'package:flutter/material.dart';

class ProfileTextForm extends StatelessWidget {
  const ProfileTextForm({
    required this.formName,
    this.inputType,
    this.formUnit,
    super.key,
  });

  final String formName;
  final TextInputType? inputType;
  final String? formUnit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.orange),
      keyboardType: inputType ?? TextInputType.text,
      decoration: InputDecoration(
          suffixText: formUnit ?? ' ',
          labelText: formName,
          // hintText: formName,
          labelStyle: const TextStyle(
            color: Color(0xFF7F8795),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 0.09,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            // color: Color(0xFF9BA4B5),
            color: Colors.brown,
            width: 1,
          ))),
    );
  }
}
