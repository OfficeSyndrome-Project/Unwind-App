import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class BoxOnlyQ extends StatelessWidget {
  final String question;
  final String answer;
  const BoxOnlyQ({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Text(
            '${question}',
            style: TextStyle(
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF484D56),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                'ตอบ',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF484D56),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Text(
                answer,
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF484D56),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
