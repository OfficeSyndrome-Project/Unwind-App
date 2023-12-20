import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/nrs_score_label.dart';

Widget TextWithEmoticonLabel(BuildContext context) {
  List<NrsScoreLabel> scorelabel = NrsScoreLabel.getScore();
  List<Widget> list = [];

  for (var i = 0; i < scorelabel.length; i++) {
    list.add(Column(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(scorelabel[i].assetPath))),
        ),
        Text(
          scorelabel[i].label,
          style: TextStyle(
            color: Color(0xFF7F8795),
            fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 8 : 10,
            fontFamily: 'Noto Sans Thai',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ));
    // if (i % 2 == 0 && i < 12) {
    //   list.add(SizedBox(width: 16));
    // }
  }

  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: list);
}
