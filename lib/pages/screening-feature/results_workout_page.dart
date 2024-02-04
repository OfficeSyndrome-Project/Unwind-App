import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_results_workout.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';
import 'package:unwind_app/services/general_stored_service.dart';

class ResultsWorkoutPage extends StatelessWidget {
  final AnswerContext? answerContext;
  final String? resultText;
  final List<WorkoutList> workoutLists;
  final Widget? nextPage;

  ResultsWorkoutPage({
    Key? key,
    required this.workoutLists,
    this.answerContext,
    this.resultText,
    this.nextPage,
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
                  child: Text(
                    'อาการ : $resultText',
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
                workoutLists.isNotEmpty
                    ? Container(
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
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? 14
                                      : 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF484D56),
                            )),
                      )
                    : SizedBox(),
                // SingleChildScrollView(
                //     child: Column(
                //   children: workoutLists
                //       .map((element) => buildWorkoutData(element))
                //       .toList(),
                // )),
                // ListView.separated(
                //   itemBuilder: (context, index) =>
                //       buildWorkoutData(workoutLists[index]),
                //   itemCount: workoutLists.length,
                //   separatorBuilder: (context, index) => Text('$index'),
                //   physics: NeverScrollableScrollPhysics(),
                // ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  // height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                            child:
                                buildWorkoutData(context, workoutLists[index]),
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(25),
                            //     color: Colors.white,
                            //     shape: BoxShape.rectangle),
                          ),
                      shrinkWrap: true,
                      itemCount: workoutLists.length,
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          )),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          ButtonWithoutIconWidget(
              onTap: () async {
                await GeneralStoredService.writeBoolean(
                    GeneralStoredService.isFirstTime, 0, 0, false);
                Navigator.push(
                    context,
                    nextPage == null
                        ? pageRoutes.home.workoutlist().route(context)
                        : MaterialPageRoute(builder: (context) => nextPage!));
              },
              text: "ดำเนินการต่อ",
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: appTheme.colorScheme.onPrimary,
                    )
                  : Theme.of(context).textTheme.headlineSmall)
        ]);
  }

  Widget buildWorkoutData(BuildContext context, WorkoutList workoutList) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), shape: BoxShape.rectangle),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  workoutList.description,
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            color: appTheme.colorScheme.primary,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => BoxResultsWorkout(
              name: workoutList.workoutData[index].name,
              detail: workoutList.workoutData[index].detail,
              time: Duration(
                seconds: workoutList.workoutData[index].sec,
              ),
              imagePath: workoutList.workoutData[index].thumbnailPath,
            ),
            itemCount: workoutList.workoutData.length,
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: Color(0xebf0fa),
            ),
          ),
        ],
      ),
    );
  }
}
