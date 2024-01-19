import 'package:flutter/material.dart';

class TextWithStartIconWidget extends StatelessWidget {
  final Icon startIcon;
  final String topicName;
  final TextStyle? style;
  const TextWithStartIconWidget(
      {super.key,
      required this.startIcon,
      required this.topicName,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        startIcon,
        const SizedBox(
          width: 8,
        ),
        Text(
          topicName,
          style: style,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
