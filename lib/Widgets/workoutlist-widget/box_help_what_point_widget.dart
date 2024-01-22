import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

class BoxHelpWhatPointWidget extends StatelessWidget {
  final String helpPoint;
  const BoxHelpWhatPointWidget({super.key, required this.helpPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextWithStartIconWidget(
        startIcon: Icon(
          Icons.check_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
        topicName: helpPoint,
        style: TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF636A75),
        ),
      ),
    );
  }
}
