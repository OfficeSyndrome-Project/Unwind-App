import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

class HeaderBox extends StatelessWidget {
  final int screeningPart;
  final String partName;
  final String? partSelect;
  const HeaderBox(
      {super.key,
      required this.screeningPart,
      required this.partName,
      this.partSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
        if (partSelect != null)
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              '${partSelect}',
              style: TextStyle(
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF484D56),
              ),
            ),
          ),
      ],
    );
  }
}