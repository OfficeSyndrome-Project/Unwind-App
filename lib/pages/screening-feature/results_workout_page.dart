import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_result_syndrom_widget.dart';

import 'package:unwind_app/Widgets/screening-widget/have_workout_list_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ResultsWorkoutPage extends StatelessWidget {
  ResultsWorkoutPage({Key? key}) : super(key: key);

  final PageRoutes pageRoutes = PageRoutes();
  final bool isSyndrom = true;

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        vertical: 0,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextWithStartIconWidget(
                      startIcon: Icon(
                        Icons.description_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      topicName: 'ผลลัพธ์',
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      )),
                ),
                BoxResultSyndromWidget(result: 'คุณมีอาการออฟฟิศซินโดรม'),
                isSyndrom == true ? HaveWorkoutListWidget() : SizedBox(),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                Navigator.push(
                    context, pageRoutes.home.workoutlist().route(context));
              },
              text: isSyndrom == true ? "ไปสู่ชุดท่าบริหาร" : 'ตกลง',
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    )
                  : Theme.of(context).textTheme.headlineSmall)
        ]);
  }
}
