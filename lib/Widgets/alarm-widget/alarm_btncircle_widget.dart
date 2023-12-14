import 'package:flutter/material.dart';

import '../responsive_check_widget.dart';

Widget btnCircle(BuildContext context, String text, Color color) {
  return SizedBox(
    width: ResponsiveCheckWidget.isSmallMobile(context) ? 88 : 98,
    height: ResponsiveCheckWidget.isSmallMobile(context) ? 88 : 98,
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: ResponsiveCheckWidget.isSmallMobile(context) ? 88 : 98,
            height: ResponsiveCheckWidget.isSmallMobile(context) ? 88 : 98,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: color,
              shadows: const [
                BoxShadow(
                  color: Color(0x26111E3D),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Container(
              width:
                  ResponsiveCheckWidget.isSmallMobile(context) ? 78.57 : 88.57,
              height:
                  ResponsiveCheckWidget.isSmallMobile(context) ? 78.57 : 88.57,
              decoration: const ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.8,
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x26111E3D),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
                fontFamily: 'Noto Sans Thai',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
