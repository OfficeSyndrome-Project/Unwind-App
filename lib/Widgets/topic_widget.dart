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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        startIcon,
        const SizedBox(
          width: 8,
        ),
        Text(
          topicName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
