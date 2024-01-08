import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class AppbarTheme extends StatelessWidget {
  final String? text;
  final Color? color;
  final TextStyle? style;
  final IconButton? iconButtonStart;
  final IconButton? iconButtonEnd;
  const AppbarTheme(
      {super.key,
      this.text,
      this.style,
      this.color,
      this.iconButtonStart,
      this.iconButtonEnd});

  @override
  Widget build(BuildContext context) {
    final defaulColor = Theme.of(context).colorScheme.primary;
    final defaultStyle = Theme.of(context).textTheme.displayMedium;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      width: double.infinity,
      height: 60,
      decoration: ShapeDecoration(
        color: color ?? defaulColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIconButtonStart(iconButtonStart),
          ResponsiveCheckWidget.isSmallMobile(context)
              ? Text(text ?? '',
                  style: style ??
                      TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFebedf0),
                      ))
              : Text(
                  text ?? '',
                  style: style ?? defaultStyle,
                ),
          _buildIconButtonEnd(
            iconButtonEnd,
          )
        ],
      ),
    );
  }
}

Widget _buildIconButtonStart(IconButton? iconButtonStart) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      IconButtonTheme(
        data: IconButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              alignment: Alignment.centerLeft),
        ),
        child: iconButtonStart ??
            const IconButton(
              alignment: Alignment.centerLeft,
              onPressed: null,
              padding: EdgeInsets.all(0),
              icon: Icon(null),
            ),
      )
    ],
  );
}

Widget _buildIconButtonEnd(IconButton? iconButtonEnd) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      IconButtonTheme(
          data: IconButtonThemeData(
            style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                alignment: Alignment.centerRight),
          ),
          child: iconButtonEnd ??
              const IconButton(
                alignment: Alignment.centerRight,
                onPressed: null,
                padding: EdgeInsets.all(0),
                icon: Icon(null),
              ))
    ],
  );
}
