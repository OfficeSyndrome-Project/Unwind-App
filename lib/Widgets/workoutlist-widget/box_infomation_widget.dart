import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class BoxInfomationWidget extends StatelessWidget {
  final String title;
  final String assetName;
  final String infomation;
  const BoxInfomationWidget(
      {super.key,
      required this.title,
      required this.assetName,
      required this.infomation});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF484D56),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 16),
          child: RatioImageoneToOne(
              assetName: assetName,
              smallWidth: 180,
              largeWidth: 240,
              smallHeight: 180,
              largeHeight: 240),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                '\u2022',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Text(
                infomation,
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF646A76),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
