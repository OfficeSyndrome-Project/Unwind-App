import 'package:flutter/material.dart';

class ProfileDropdown extends StatefulWidget {
  final List<String>? listSelection;
  final String dropdownName;

  ProfileDropdown({
    Key? key,
    this.listSelection,
    required this.dropdownName,
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
    _selectedValue = widget.listSelection?.isNotEmpty == true
        ? widget.listSelection![0]
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: DropdownButtonFormField(
        items:
            widget.listSelection?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    color: Color(0xFF484D56),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ));
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedValue = value;
          });
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
