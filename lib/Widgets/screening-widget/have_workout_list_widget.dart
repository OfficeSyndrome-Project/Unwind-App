import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_have_workout_list_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

class HaveWorkoutListWidget extends StatelessWidget {
  final String? nameList;
  const HaveWorkoutListWidget({super.key, this.nameList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 8),
          child: TextWithStartIconWidget(
              startIcon: Icon(
                Icons.directions_run,
                color: Theme.of(context).colorScheme.primary,
              ),
              topicName: 'ชุดท่าที่ได้รับ',
              style: TextStyle(
                fontFamily: "Noto Sans Thai",
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF484D56),
              )),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => BoxHaveWorkoutListWidget(
                    name: 'ชุดท่าบริหารคอ',
                    index: index,
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 16,
                  ),
              itemCount: 5),
        ),
      ],
    ));
  }
}
