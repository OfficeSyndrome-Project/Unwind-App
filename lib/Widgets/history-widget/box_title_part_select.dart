import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class BoxTitlePartSelect extends StatelessWidget {
  final String partSelect;
  const BoxTitlePartSelect({super.key, required this.partSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(
        '${partSelect}',
        style: TextStyle(
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF484D56),
        ),
      ),
    );
  }
}
