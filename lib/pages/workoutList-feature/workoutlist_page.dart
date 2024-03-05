import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_box_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/services/general_stored_service.dart';

class WorkoutListPage extends StatefulWidget {
  WorkoutListPage({super.key});

  static PageRoutes pageRoutes = PageRoutes();

  @override
  State<WorkoutListPage> createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: "ชุดท่าบริหาร",
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: FutureBuilder(
            future:
                serviceLocator<WorkoutListDB>().getAvailableWorkoutListTitles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (!(snapshot.data is List<String>)) {
                  return Center(
                    child: Text('Error: ${snapshot.data} is not List<String>'),
                  );
                }
                final data = snapshot.data as List<String>;
                List<WorkoutListData> workoutLists = data
                    .map((s) => WorkoutListData.workoutListFromTitleCode[s]!)
                    .toList()
                  ..sort(WorkoutListData.compareByTitleOrder);
                if (workoutLists.isEmpty) {
                  return Center(
                    child: Text('คุณยังไม่มีชุดท่าออกกำลังกาย'),
                  );
                }
                return ListView.separated(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    itemBuilder: (context, index) => WorkoutBoxWidget(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                WorkoutListPage.pageRoutes.workout
                                    .reportworkoutpage(workoutLists[index])
                                    .route(context));
                            setState(() {});
                          },
                          workoutName: workoutLists[index].titleTH,
                          numberWorkout:
                              workoutLists[index].workoutData.length.toString(),
                          time: workoutLists[index].workoutData.isEmpty
                              ? ''
                              : workoutLists[index].totalTime ?? "",
                          assetName: workoutLists[index].titlePath,
                        ),
                    itemCount: workoutLists.length,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 16,
                        ));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onLongPress: () async {
              await GeneralStoredService.writeBoolean(
                  "isFirstTime", 0, 0, true);
              print(
                  await GeneralStoredService.readBoolean("isFirstTime", 0, 0));
            },
            child: TextWithStartIconWidget(
                startIcon: Icon(
                  Icons.help_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                topicName: 'มีอาการปวดที่จุดอื่น',
                style: TextStyle(
                  fontFamily: "Noto Sans Thai",
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF484D56),
                )),
          ),
          SizedBox(
            height: 16,
          ),
          ButtonWithiconWidget(
            onTap: () {
              Navigator.push(
                  context,
                  WorkoutListPage.pageRoutes.screening
                      .introscreeningpage(0, [], [], null)
                      .route(context));
            },
            onLongPress: () async {
              int count =
                  await serviceLocator<WorkoutListDB>().deleteAllWorkoutList();
              print('successfully deleted $count workouts');
              setState(() {});
            },
            mainAxisAlignment: MainAxisAlignment.center,
            text: 'ตรวจอีกครั้ง',
            radius: 8,
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.primary),
            icon: Icons.refresh,
            iconcolor: Theme.of(context).colorScheme.primary,
            colorText: Theme.of(context).colorScheme.primary,
          )
        ]);
  }
}
