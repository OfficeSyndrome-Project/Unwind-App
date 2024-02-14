import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/history_boxworkoutlist_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/pages/loading_page.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

  // final List<WorkoutList> workoutLists =[];
  final List<int> workoutLists = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: pageRoutes.history.historylist().title,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: () async {
              final workoutListDB = serviceLocator<WorkoutListDB>();
              final availableWorkoutListTitles =
                  await workoutListDB.getAvailableWorkoutListTitles();
              final workouts = availableWorkoutListTitles
                  .map((titleCode) =>
                      WorkoutList.workoutListFromTitleCode[titleCode])
                  .where((workout) => workout != null)
                  .map((workout) => workout!)
                  .toList();
              final workoutModelMaps = workouts
                  .map((workout) => {
                        workout.titleCode: workoutListDB
                            .getWorkoutListByTitle(workout.titleCode)
                            .then((workoutListModels) => workoutListModels)
                      })
                  .toList();
              return workoutModelMaps;
            }(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // final workoutLists = snapshot.data as List<Map<String, Future<List<WorkoutList>>>>;
                return Column(children: [
                  ...workoutLists
                      .expand((e) => [
                            HistoryWorkoutListItem(
                                pageRoutes: pageRoutes, title: "Workout $e"),
                            SizedBox(
                              height: 8,
                            ),
                          ])
                      .toList()
                    // Remove the last SizedBox
                    ..removeLast(),
                ]);
              }
              return LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).colorScheme.primary, size: 50);
            },
          )
        ]);
  }
}

class HistoryWorkoutListItem extends StatelessWidget {
  const HistoryWorkoutListItem({
    super.key,
    required this.pageRoutes,
    required this.title,
  });

  final String title;
  final PageRoutes pageRoutes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, pageRoutes.history.summarypage().route(context));
      },
      child: HistoryWorkoutlistWidget(title: title),
    );
  }
}
