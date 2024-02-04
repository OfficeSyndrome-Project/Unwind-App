import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class TimeStateWidget extends StatelessWidget {
  final int textState;
  const TimeStateWidget({super.key, required this.textState});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textState < 10 ? '0' + textState.toString() : textState.toString(),
        style: TextStyle(
          fontFamily: 'Noto Sans Thai',
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6285D7),
        ),
      ),
    );
  }
}
