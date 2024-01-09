import 'package:flutter/material.dart';
import 'dart:core';
// import 'package:flutter/services.dart';

class ProfileTextForm extends StatefulWidget {
  const ProfileTextForm({
    required this.formName,
    this.inputType,
    this.formUnit,
    this.controller,
    this.onChange,
    Key? key,
  }) : super(key: key);

  final String formName;
  final TextInputType? inputType;
  final String? formUnit;
  final TextEditingController? controller;
  final void Function(String)? onChange;

  @override
  ProfileTextFormState createState() => ProfileTextFormState();
}

class ProfileTextFormState extends State<ProfileTextForm> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  String errorTextShow = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    // เมื่อมีการเปลี่ยนแปลงใน _focusNode
    setState(() {
      // _controller.text = _focusNode.hasFocus ? "Focus" : "Not Focus";
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
      _controller.value = _controller.value.copyWith(
        text: _controller.text,
        selection: _controller.selection,
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      // height: 50,
      width: double.infinity,
      child: TextFormField(
        onChanged: (value) {
          widget.onChange?.call(value);
        },
        controller: _controller,
        focusNode: _focusNode,
        style: TextStyle(
          // color: Color(0xFF484D56),
          color: _focusNode.hasFocus ? Color(0xFF484D56) : Color(0xFF9BA4B5),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: widget.inputType ?? TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0, top: 10),
            // errorText: errorTextShow.isEmpty ? null : errorTextShow,
            // errorStyle: TextStyle(
            //   fontSize: 12,
            //   fontWeight: FontWeight.w500,
            // ),
            suffixText: widget.formUnit ?? ' ',
            suffixStyle: const TextStyle(
              color: Color(0xFF9BA4B5),
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
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF3B67CD),
                width: 1,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            )
            // contentPadding: EdgeInsets.only(bottom: 0, top: 10),
            ),
      ),
    );
  }
}
