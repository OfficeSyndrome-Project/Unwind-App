import 'package:flutter/material.dart';

class ButtomTapTheme extends StatelessWidget {
  final String text;
  final double radius;
  final double width;
  final double height;
  final Color? color;
  final BorderSide borderSide;
  final TextStyle? style;
  const ButtomTapTheme(
      {super.key,
      required this.text,
      required this.radius,
      required this.width,
      required this.height,
      required this.color,
      required this.borderSide,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderSide,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: style,
          )
        ],
      ),
    );
  }
}
