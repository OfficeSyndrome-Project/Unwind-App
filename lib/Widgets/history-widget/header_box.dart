import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

class HeaderBox extends StatelessWidget {
  final int screeningPart;
  final String partName;

  const HeaderBox({
    super.key,
    required this.screeningPart,
    required this.partName,
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
        topicName: 'ส่วนที่ ${screeningPart} ${partName}',
        style: TextStyle(
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF3b67cd),
        ),
      ),
    );
  }
}
