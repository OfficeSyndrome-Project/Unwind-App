import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_results_workout.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ResultsWorkoutPage extends StatelessWidget {
  final AnswerContext? answerContext;
  final String? resultText;
  final List<WorkoutList> workoutLists;

  ResultsWorkoutPage({
    Key? key,
    required this.workoutLists,
    this.answerContext,
    this.resultText,
  }) : super(key: key);

  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        vertical: 0,
        children: [
          Column(
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
                  'อาการ : $resultText',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
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
              SingleChildScrollView(
                  child: Column(
                children: workoutLists
                    .map((element) => buildWorkoutData(element))
                    .toList(),
              )),
              // ListView.separated(
              //   itemBuilder: (context, index) =>
              //       buildWorkoutData(workoutLists[index]),
              //   itemCount: workoutLists.length,
              //   separatorBuilder: (context, index) => Text('$index'),
              //   physics: NeverScrollableScrollPhysics(),
              // ),
              SizedBox(
                height: 16,
              )
            ],
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

  Widget buildWorkoutData(WorkoutList workoutList) {
    return Column(children: [
      ...workoutList.workoutData
          .map((workoutData) => BoxResultsWorkout(
              name: workoutData.title,
              detail: workoutData.detail,
              time: Duration(
                seconds: workoutData.time,
              )))
          .toList(),
      SizedBox(
        height: 50,
      )
    ]);
  }
}
