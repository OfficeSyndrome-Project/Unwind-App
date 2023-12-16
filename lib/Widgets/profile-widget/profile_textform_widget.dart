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
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
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
      width: double.infinity,
      child: TextFormField(
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
          contentPadding: EdgeInsets.only(bottom: 0, top: 10),
        ),
      ),
    );
  }
}
