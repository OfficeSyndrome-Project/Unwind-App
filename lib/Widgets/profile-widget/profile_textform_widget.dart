import 'package:flutter/material.dart';

class ProfileTextForm extends StatefulWidget {
  const ProfileTextForm({
    required this.formName,
    this.inputType,
    this.formUnit,
    Key? key,
  }) : super(key: key);

  final String formName;
  final TextInputType? inputType;
  final String? formUnit;

  @override
  ProfileTextFormState createState() => ProfileTextFormState();
}

class ProfileTextFormState extends State<ProfileTextForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: TextFormField(
        style: const TextStyle(
          color: Color(0xFF484D56),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: widget.inputType ?? TextInputType.text,
        decoration: InputDecoration(
          suffixText: widget.formUnit ?? ' ',
          suffixStyle: const TextStyle(
            color: Color(0xFF7F8795),
            fontSize: 16,
          ),
          labelText: widget.formName,
          labelStyle: const TextStyle(
            color: Color(0xFF7F8795),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 0.09,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF9BA4B5),
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.only(bottom: 0, top: 10),
        ),
      ),
    );
  }
}
