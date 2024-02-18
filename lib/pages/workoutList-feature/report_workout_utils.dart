import 'package:collection/collection.dart';

import 'package:unwind_app/models/workoutlist_model.dart';

/// Given a list of [WorkoutListModel]s and a target [DateTime] date, this function
/// generates a map where keys represent integers (possibly day indices within the week)
/// and values are nullable [WorkoutListModel]s. The mapping is based on the workouts
/// falling within the week centered around the provided date.
///
/// The mapping involves filtering the workout list using a browsing week and creating
/// a mapping of day indices to corresponding workout models within that week.
///
/// Parameters:
///   - `workouts`: A list of [WorkoutListModel]s representing workout data.
///   - `targetDate`: The target [DateTime] date around which the browsing week is centered.
///
/// Returns:
///   A map where keys are integers (possibly day indices) and values are nullable
///   [WorkoutListModel]s representing workouts within the browsing week.
Map<int?, WorkoutListModel?> Function(DateTime targetDate)
    mapWorkoutListForBrowsingWeek(List<WorkoutListModel> workouts) =>
        (targetDate) {
          final weekDates = createWeekDateList(targetDate);
          final filteredWorkouts =
              filterWorkoutListByBrowsingWeek(workouts)(weekDates);
          return workoutListDateRangeMap(filteredWorkouts);
        };

/// Creates a map representing a mapping of day indices to [WorkoutListModel]s
/// within a given list of workouts. (Circle Map)
///
/// Given a list of [WorkoutListModel]s representing workouts for a specific date range,
/// this function generates a map where keys are integers (day indices) and values
/// are nullable [WorkoutListModel]s. The mapping is based on the weekdays, and each
/// key represents a day within a week.
///
/// Parameters:
///   - `workoutLists`: A list of [WorkoutListModel]s representing workouts for a
///     specific date range.
///
/// Returns:
///   A map where keys are integers (day indices) and values are nullable
///   [WorkoutListModel]s, indicating workouts for each day within the date range.
Map<int?, WorkoutListModel?> workoutListDateRangeMap(
        List<WorkoutListModel> workoutLists) =>
    Map.fromIterable(
      List<int>.generate(7, (n) => n),
      key: (n) => n,
      value: (n) =>
          workoutLists.firstWhereOrNull((wol) => wol.date?.weekday == n + 1),
    );

/// Filters a list of [WorkoutListModel]s based on a provided browsing window.
///
/// Given a list of [WorkoutListModel]s and a browsing window represented by a list
/// of [DateTime] objects, this function filters and returns a subset of workout models
/// that have dates falling within the specified browsing window.
///
/// Parameters:
///   - `wolModels`: A list of [WorkoutListModel]s representing workout data.
///
/// Returns:
///   A function that takes a list of [DateTime] objects representing a browsing
///   window and returns a filtered list of [WorkoutListModel]s for that window.
///
/// Matching example:
/// A = [1,2,3,4]
/// B = [2,3]
/// wolInBrowsingWindow = [2,3]
///
List<WorkoutListModel> Function(List<DateTime>) filterWorkoutListByBrowsingWeek(
        List<WorkoutListModel> wolModels) =>
    (List<DateTime> browsingWindow) => wolModels
        .where((wol) => browsingWindow
            .any((browsingDate) => isSameDay(browsingDate, wol.date)))
        .toList();

/// Creates a list of [DateTime] objects representing the days of the week
/// centered around the provided date.
///
/// Given a target [DateTime] date, this function calculates the Monday of
/// the week in which the date falls and generates a list of [DateTime] objects
/// representing each day of that week.
///
/// Parameters:
///   - `date`: The target [DateTime] date around which the week is centered.
///
/// Returns:
///   A list of [DateTime] objects, containing seven elements, representing
///   the days of the week starting from Monday.
List<DateTime> createWeekDateList(DateTime date) {
  final thisMonday =
      date.subtract(Duration(days: date.weekday - DateTime.monday));
  return List<DateTime>.generate(7, (n) => thisMonday.add(Duration(days: n)));
}

/// Checks if two [DateTime] objects represent the same day.
///
/// Given two nullable [DateTime] objects, this function compares their year, month,
/// and day components to determine if they represent the same calendar day.
///
/// Parameters:
///   - `dateA`: The first nullable [DateTime] object for comparison.
///   - `dateB`: The second nullable [DateTime] object for comparison.
///
/// Returns:
///   A boolean value indicating whether both [DateTime] objects represent the same day.
///   If either or both of the input dates are null, the function returns false.
bool isSameDay(DateTime? dateA, DateTime? dateB) {
  return (dateA != null && dateB != null) &&
      dateA.year == dateB.year &&
      dateA.month == dateB.month &&
      dateA.day == dateB.day;
}
