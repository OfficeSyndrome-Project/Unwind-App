import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

class HeaderBox extends StatelessWidget {
  final String text;

  const HeaderBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextWithStartIconWidget(
        startIcon: Icon(
          Icons.attach_file,
          color: Theme.of(context).colorScheme.primary,
        ),
        topicName: text,
        style: TextStyle(
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF3b67cd),
        ),
      ),
    );
  }
}
