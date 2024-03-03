import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/set_box_workout_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/workoutList-feature/start_workout_button_widget.dart';

class InfoOfListWorkoutPage extends StatelessWidget {
  final WorkoutListData? workoutList;
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
                          workoutData: workoutList?.workoutData[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                pageRoutes.workout
                                    .infoofsetworkout(
                                        workoutList?.workoutData[index],
                                        workoutList!)
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
          ConditionalStartWorkoutButton(
              workoutList: workoutList, pageRoutes: pageRoutes),
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
                // Navigator.popUntil(
                //     context, (route) => route.settings.name == PageName.HOME);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (HomePage(
                              selectedIndex: 0,
                            ))));
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

class ConditionalStartWorkoutButton extends StatelessWidget {
  final WorkoutListData? workoutList;
  final PageRoutes pageRoutes;

  const ConditionalStartWorkoutButton({
    super.key,
    required this.workoutList,
    required this.pageRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: serviceLocator<WorkoutListDB>().getWorkoutListByDateAndTitle(
          DateTime.now(), workoutList?.titleCode ?? ''),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          if (workoutList == null) {
            return Text('คุณไม่สามารถบริหารได้');
          }
          final todayWorkout = snapshot.data as List<WorkoutListModel>;
          if (todayWorkout.isEmpty) {
            // return Text('hello');
            return StartWorkoutButton(
              pageRoutes: pageRoutes,
              workoutList: workoutList!,
              text: 'คุณไม่มีการบริหารในวันนี้',
              disabled: true,
            );
          }
          // If the user has already done the workout today
          if (todayWorkout.first.remaining_times == 0) {
            return StartWorkoutButton(
              pageRoutes: pageRoutes,
              workoutList: workoutList!,
              text: 'วันนี้คุณทำท่าบริหารครบแล้ว',
              disabled: true,
            );
          }
          return StartWorkoutButton(
            pageRoutes: pageRoutes,
            workoutList: workoutList!,
          );
        }
        return Text('Loading...');
      },
    );
  }
}
