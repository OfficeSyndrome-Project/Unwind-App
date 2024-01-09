import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_results_workout.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ResultsWorkoutPage extends StatelessWidget {
  ResultsWorkoutPage({Key? key}) : super(key: key);

  final PageRoutes pageRoutes = PageRoutes();

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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 8, bottom: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      shape: BoxShape.rectangle),
                  child: Text(
                    'อาการ : คุณมีอาการออฟฟิศซินโดรม',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF484D56),
                    ),
                  ),
                ),
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
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      )),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          BoxResultsWorkout(name: '1'),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                      itemCount: 10),
                ),
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
              text: "ไปสู่ชุดท่าบริหาร",
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
