import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonWithiconWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final List<BoxShadow>? shadows;
  final double radius;
  final BorderSide side;
  final IconData? icon;
  final Color? iconcolor;
  final void Function()? onTap;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final Color? colorText;

  const ButtonWithiconWidget({
    super.key,
    required this.onTap,
    required this.mainAxisAlignment,
    this.padding,
    required this.text,
    this.colorText,
    this.color,
    this.shadows,
    required this.radius,
    required this.side,
    this.icon,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    const defualtPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: padding ?? defualtPadding,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: side, borderRadius: BorderRadius.circular(radius)),
            color: color,
            shadows: shadows),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: mainAxisAlignment == MainAxisAlignment.spaceBetween
                ? <Widget>[
                    AutoSizeText(
                      text,
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorText,
                      ),
                      maxFontSize: 16,
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                    Icon(
                      icon,
                      color: iconcolor,
                    ),
                  ]
                : <Widget>[
                    Icon(
                      icon,
                      color: iconcolor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    AutoSizeText(
                      text,
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontWeight: FontWeight.w600,
                        color: colorText,
                      ),
                      minFontSize: 14,
                      maxFontSize: 16,
                      maxLines: 1,
                    )
                  ]),
      ),
    );
  }
}
