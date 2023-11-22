import 'package:flutter/material.dart';

Widget btnCircle(BuildContext context, String text, Color color) {
  return SizedBox(
    width: 88,
    height: 88,
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 88,
            height: 88,
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
              width: 78.57,
              height: 78.57,
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
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
