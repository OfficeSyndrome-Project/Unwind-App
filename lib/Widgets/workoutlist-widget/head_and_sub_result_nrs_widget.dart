import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class HeadAndSubResultNrsWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const HeadAndSubResultNrsWidget({Key? key, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF484D56),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 16),
          child: Text(
            subtitle ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF646a76),
            ),
          ),
        ),
      ],
    );
  }
}
