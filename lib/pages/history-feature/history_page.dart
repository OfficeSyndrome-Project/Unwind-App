import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/history_boxworkoutlist_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

  // final List<WorkoutList> workoutLists =[];
  final List<WorkoutList> workoutLists = [];

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
              final result = await Future.wait(
                  workoutModelMaps.map(resolveFutureMap).toList());
              return result;
            }(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final workoutLists =
                    snapshot.data as List<Map<String, List<WorkoutListModel>>>;
                return (workoutLists.isEmpty)
                    ? Expanded(
                        child: Center(
                          child: Text('คุณยังไม่มีประวัติออกกำลังกาย'),
                        ),
                      )
                    : Column(children: [
                        ...workoutLists
                            // filter out empty map
                            .where((wolModelMap) => wolModelMap.isNotEmpty)
                            .expand((wolModelMap) => [
                                  HistoryWorkoutListItem(
                                    pageRoutes: pageRoutes,
                                    workoutList:
                                        WorkoutList.workoutListFromTitleCode[
                                            wolModelMap.keys.first]!,
                                    workoutListModels: wolModelMap.values.first,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ])
                            .toList()
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
  final WorkoutList workoutList;
  final PageRoutes pageRoutes;
  final List<WorkoutListModel> workoutListModels;

  const HistoryWorkoutListItem({
    super.key,
    required this.pageRoutes,
    required this.workoutList,
    required this.workoutListModels,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            pageRoutes.history
                .summarypage(workoutList, workoutListModels)
                .route(context));
      },
      child: HistoryWorkoutlistWidget(
        workoutList: workoutList,
        workoutListModels: workoutListModels,
      ),
    );
  }
}

// Future<Map<K, V>> resolveFutureMap<K, V>(Map<K, Future<V>> futureMap) async {
//   final resolvedMap = <K, V>{};

//   await Future.forEach(futureMap.entries, (MapEntry<K, Future<V>> entry) async {
//     final key = entry.key;
//     final futureValue = entry.value;

//     try {
//       final value = await futureValue;
//       resolvedMap[key] = value;
//     } catch (e) {
//       // Handle error gracefully
//       print('Error resolving future for key $key: $e');
//       // omit the key-value pair from the resolved map
//     }
//   });

//   return resolvedMap;
// }

Future<Map<K, V>> resolveFutureMap<K, V>(Map<K, Future<V>> futureMap) async {
  return Future.wait(
    futureMap.entries
        .map((entry) async => entry.value.then(
              (value) => MapEntry(entry.key, value),
            ))
        .toList(),
  ).then(
    (entries) => Map.fromEntries(entries),
  );
}
