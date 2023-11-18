import 'package:flutter/material.dart';

class ButtomTapTheme extends StatelessWidget {
  final String text;
  final double radius;
  final double width;
  final double height;
  final Color color;
  final BorderSide borderSide;
  final TextStyle? style;
  const ButtomTapTheme(this.text, this.radius, this.width, this.height,
      this.color, this.borderSide, this.style,
      {super.key});

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
