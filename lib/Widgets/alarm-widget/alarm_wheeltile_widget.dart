import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class WheelTile extends StatelessWidget {
  final String textstates;

  const WheelTile(this.textstates, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$textstates นาที',
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
