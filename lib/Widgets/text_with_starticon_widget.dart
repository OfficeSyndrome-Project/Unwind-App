import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget textIcon(BuildContext context, String text, Color color, Icon icon) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      icon,
      const SizedBox(
        width: 8,
      ),
      AutoSizeText(
        text,
        style: TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w600,
        ),
        maxFontSize: 16,
        minFontSize: 14,
        maxLines: 1,
      ),
    ],
  );
}
