import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class ListDropdownWidget extends StatefulWidget {
  final void Function(String?)? onChanged;
  final List<String> nameList;
  final String? value;
  const ListDropdownWidget(
      {Key? key, this.onChanged, required this.nameList, this.value})
      : super(key: key);

  @override
  State<ListDropdownWidget> createState() => _ListDropdownWidgetState();
}

class _ListDropdownWidgetState extends State<ListDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            value: widget.value,
            alignment: Alignment.centerLeft,
            autovalidateMode: AutovalidateMode.disabled,
            elevation: 2,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            style: TextStyle(
              color: Color(0xFF484D56),
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
              fontFamily: 'Noto Sans Thai',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFFC3C8D2),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFFC3C8D2),
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(8),
            hint: Text(
              'กรุณาเลือกชุดท่าบริหาร',
              style: TextStyle(
                color: Color(0xFF9BA4B5),
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                fontFamily: 'Noto Sans Thai',
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: widget.onChanged,
            items:
                widget.nameList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                alignment: Alignment.centerLeft,
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Color(0xFF484D56),
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontFamily: 'Noto Sans Thai',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
