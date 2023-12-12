import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  final Icon startIcon;
  final String topicName;
  const TopicWidget(
      {super.key, required this.startIcon, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        startIcon,
        const SizedBox(
          width: 8,
        ),
        AutoSizeText(
          topicName,
          style: Theme.of(context).textTheme.bodySmall,
          maxFontSize: 16,
          minFontSize: 14,
          maxLines: 1,
        ),
      ],
    );
  }
}
