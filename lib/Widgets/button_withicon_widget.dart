import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

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
                    Text(
                      text,
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w600,
                        color: colorText,
                      ),
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
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: "Noto Sans Thai",
                          fontWeight: FontWeight.w600,
                          color: colorText,
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 14
                              : 16),
                    )
                  ]),
      ),
    );
  }
}
