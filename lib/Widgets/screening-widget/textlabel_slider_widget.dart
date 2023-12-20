import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

Widget getTextWidgets(BuildContext context) {
  List<Widget> list = [];
  for (var i = 0; i < 11; i++) {
    list.add(new Text(
      i.toString(),
      style: TextStyle(
        color: Color(0xFFC3C8D2),
        fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
        fontFamily: 'Noto Sans Thai',
        fontWeight: FontWeight.w500,
      ),
    ));
  }
  return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
}
