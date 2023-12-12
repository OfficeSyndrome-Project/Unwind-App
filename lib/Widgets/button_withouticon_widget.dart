import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ButtonWithoutIconWidget extends StatelessWidget {
  final String text;
  final double radius;
  final double width;
  final double height;
  final Color? color;
  final BorderSide borderSide;
  final TextStyle? style;
  final void Function()? onTap;
  const ButtonWithoutIconWidget(
      {super.key,
      required this.onTap,
      required this.text,
      required this.radius,
      required this.width,
      required this.height,
      required this.color,
      required this.borderSide,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            AutoSizeText(
              text,
              style: style,
              maxFontSize: 16,
              minFontSize: 14,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
