// ignore_for_file: file_names

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
      Text(
        text,
        style: TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
