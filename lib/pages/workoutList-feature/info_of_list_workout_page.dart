import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/set_box_workout_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';

class InfoOfListWorkoutPage extends StatelessWidget {
  final WorkoutList? workoutList;
  InfoOfListWorkoutPage({super.key, this.workoutList});

  final PageRoutes pageRoutes = PageRoutes();
  final WorkoutListDB workoutListDB = serviceLocator<WorkoutListDB>();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white),
        textBar: pageRoutes.workout.infooflistworkout(workoutList).title,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 8),
                child: TextWithStartIconWidget(
                    startIcon: Icon(
                      Icons.directions_run_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName: 'ชุดท่าบริหาร',
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
                    padding: EdgeInsets.all(2),
                    itemBuilder: (context, index) => SetBoxWorkoutWidget(
                          // name:
                          //     'ชื่อท่าที่ ${index + 1} ${workoutList?.workoutData[index].name}',
                          workoutData: workoutList?.workoutData[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                pageRoutes.workout
                                    .infoofsetworkout(
                                        workoutList?.workoutData[index])
                                    .route(context));
                          },
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                    itemCount: workoutList?.workoutData.length ?? 0),
              )
            ],
          )),
          SizedBox(
            height: 16,
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                Navigator.push(
                    context,
                    pageRoutes.workout
                        .nrsafterandbeforeworkout()
                        .route(context));
              },
              text: "เริ่มกายบริหาร",
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
                  : Theme.of(context).textTheme.headlineSmall),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: TextWithStartIconWidget(
                startIcon: Icon(
                  Icons.help_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                topicName: 'ไม่มีอาการปวดอีกต่อไป',
                style: TextStyle(
                  fontFamily: "Noto Sans Thai",
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF484D56),
                )),
          ),
          ButtonWithiconWidget(
            onTap: () async {
              final result = await alertDialog.getshowDialog(
                  context,
                  'ยกเลิกชุดท่าบริหารนี้ใช่หรือไม่ ?',
                  '(ชุดท่านี้จะหายไปจากรายการ)', () {
                Navigator.pop(context, false);
              }, () {
                Navigator.pop(context, true);
              });
              if (result == true) {
                await workoutListDB
                    .deleteWorkoutListByTitle(workoutList?.titleCode ?? '');
                // Navigator.pop(context);
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
            mainAxisAlignment: MainAxisAlignment.center,
            text: 'หยุดบริหาร',
            radius: 8,
            side: BorderSide(width: 1, color: Color(0xFFC9635F)),
            icon: Icons.do_not_disturb_on_outlined,
            iconcolor: Color(0xFFC9635F),
            colorText: Color(0xFFC9635F),
          ),
        ]);
  }
}
