import 'package:flutter/material.dart';

class ProfileDropdown extends StatefulWidget {
  final List<String> listSelection;
  final String dropdownName;
  final String? defaultValue;
  final void Function(String)? onSelect;

  ProfileDropdown({
    Key? key,
    required this.listSelection,
    required this.dropdownName,
    this.defaultValue,
    this.onSelect,
  }) : super(key: key);

  @override
  ProfileDropdownState createState() => ProfileDropdownState();
}

class ProfileDropdownState extends State<ProfileDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();

    // ตั้งค่า _selectedCareer ตามความต้องการ
    _selectedValue = widget.listSelection.contains(widget.defaultValue)
        ? widget.defaultValue ??
            (widget.listSelection.isNotEmpty ? widget.listSelection[0] : null)
        : (widget.listSelection.isNotEmpty ? widget.listSelection[0] : null);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: DropdownButtonFormField(
        items:
            widget.listSelection.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    color: value == _selectedValue
                        ? Color(0xFF7F8795)
                        : Color(0xFF484D56),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ));
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedValue = value;
          });
          widget.onSelect?.call(value ?? "");
        },
        value: _selectedValue,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Color(0xFF9BA4B5),
        ),
        decoration: InputDecoration(
            labelText: widget.dropdownName,
            labelStyle: TextStyle(color: Color(0xFF7F8795)),
            contentPadding: EdgeInsets.only(bottom: 0, top: 0),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFF9BA4B5),
              width: 1,
            ))),
      ),
    );
  }
}
