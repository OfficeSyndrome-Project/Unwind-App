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

class WorkoutListPage extends StatelessWidget {
  WorkoutListPage({super.key});

  static PageRoutes pageRoute = PageRoutes();

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
                List<WorkoutList> workoutLists = data
                    .map((s) => WorkoutList.workoutListFromString[s]!)
                    .toList();
                return ListView.separated(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  itemBuilder: (context, index) => WorkoutBoxWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          pageRoute.workout
                              .reportworkoutpage(workoutLists[index])
                              .route(context));
                    },
                    workoutName: workoutLists[index].description,
                    numberWorkout:
                        workoutLists[index].workoutData.length.toString(),
                    time: workoutLists[index].workoutData.isEmpty
                        ? ''
                        : workoutLists[index]
                                .workoutData
                                .map((e) => Duration(seconds: e.time))
                                .reduce((value, element) => value + element)
                                .inSeconds
                                .toString() +
                            ' วินาที',
                    assetName: workoutLists[index].titlePath,
                  ),
                  itemCount: workoutLists.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16,
                  )
                  // children: workoutLists
                  //     .map(
                  //       (workoutList) => WorkoutBoxWidget(
                  //         workoutName: workoutList.description,
                  //         numberWorkout:
                  //             workoutList.workoutData.length.toString(),
                  //         time: workoutList.workoutData.isEmpty
                  //             ? ''
                  //             : workoutList.workoutData
                  //                     .map((e) => Duration(seconds: e.time))
                  //                     .reduce(
                  //                         (value, element) => value + element)
                  //                     .inSeconds
                  //                     .toString() +
                  //                 ' วินาที',
                  //         assetName: workoutList.titlePath,
                  //       ),
                  //     )
                  //     .toList(),
                  // children: [
                  //   WorkoutBoxWidget(
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             pageRoute.workout
                  //                 .reportworkoutpage()
                  //                 .route(context));
                  //       },
                  //       workoutName: 'ชุดท่าบริหารคอ',
                  //       numberWorkout: '4 ชุดท่า',
                  //       time: '',
                  //       assetName: 'lib/assets/images/screeningPart/neck.png')
                  // ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
          TextWithStartIconWidget(
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
          SizedBox(
            height: 16,
          ),
          ButtonWithiconWidget(
            onTap: () {},
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
