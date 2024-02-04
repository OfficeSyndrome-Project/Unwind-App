import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class BoxResultSyndromWidget extends StatelessWidget {
  final String result;
  const BoxResultSyndromWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 8, bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          shape: BoxShape.rectangle),
      child: Text(
        'อาการ : ${result}',
        style: TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF484D56),
        ),
      ),
    );
  }
}
