import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

enum WorkoutlistTitle {
  neckbaa_ch,
  neckbaa_th,
  shoulder_ch,
  shoulder_th,
  back_ch,
  back_th
}

const Map<String, WorkoutlistTitle> workoutListTitleMap = {
  'neckbaa_ch': WorkoutlistTitle.neckbaa_ch,
  'neckbaa_th': WorkoutlistTitle.neckbaa_th,
  'shoulder_ch': WorkoutlistTitle.shoulder_ch,
  'shoulder_th': WorkoutlistTitle.shoulder_th,
  'back_ch': WorkoutlistTitle.back_ch,
  'back_th': WorkoutlistTitle.back_th,
};

class WorkoutListDB {
  static const String TABLE = 'WorkoutList';
  static const String ID = 'id';
  static const String WOL_TITLE = 'WOL_title';
  static const String DATE = 'date';
  static const String REMAINING_TIMES = 'remaining_times';
  static const String TOTAL_TIMES = 'total_times';
  static const String NRS_BEFORE = 'NRS_before';
  static const String NRS_AFTER = 'NRS_after';
  static const String DELETED_AT = 'deleted_at';

  DatabaseHelper databaseHelper;
  WorkoutListDB({required this.databaseHelper});
  //insert workoutlist
  Future<WorkoutListModel> insertWorkoutList(
      WorkoutListModel workoutList) async {
    Database db = await databaseHelper.database;
    final success = await db.insert(
      TABLE,
      workoutList.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return workoutList.copyWith(id: success);
  }

  Future<WorkoutListModel> getWorkoutList(int id) async {
    Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: '$ID = ? AND $DELETED_AT IS NULL',
      whereArgs: [id],
    );
    return WorkoutListModel.fromMap(maps.first);
  }

  //calculate percentage done
  Future<double> calculatePercentageDone(DateTime date, String title) async {
    final workoutlist = await getWorkoutListByDateAndTitle(date, title);
    if (workoutlist.isEmpty) {
      return 0;
    }
    final workout = workoutlist.first;
    if (workout.remaining_times == null || workout.total_times == null) {
      return 0;
    }
    final percentage = (100 * workout.remaining_times!) / workout.total_times!;
    return double.tryParse(percentage.toStringAsFixed(0)) ?? 0;
  }

  //query all workoutlist
  Future<List<WorkoutListModel>> getallWorkoutList() async {
    Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: "$DELETED_AT IS NULL",
    );
    return maps.map((e) => WorkoutListModel.fromMap(e)).toList();
  }

  //query workoutlist by specific date
  Future<List<WorkoutListModel>> getWorkoutListByDate(DateTime date) async {
    Database db = await databaseHelper.database;
    final from = DateTime(date.year, date.month, date.day);
    final to = DateTime(date.year, date.month, date.day + 1);
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: "$DATE >= ? AND $DATE < ? AND $DELETED_AT IS NULL",
      whereArgs: [from.toIso8601String(), to.toIso8601String()],
    );
    return maps.map((e) => WorkoutListModel.fromMap(e)).toList();
  }

  //query workoutlist by date and title
  Future<List<WorkoutListModel>> getWorkoutListByDateAndTitle(
      DateTime date, String title) async {
    final workoutlist = await getWorkoutListByDate(date);
    return workoutlist.where((element) => element.WOL_title == title).toList();
  }

  //query workoutlist by title
  Future<List<WorkoutListModel>> getWorkoutListByTitle(String title) async {
    Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: "$WOL_TITLE = ? AND $DELETED_AT IS NULL",
      whereArgs: [title],
      orderBy: '$DATE ASC',
    );
    return maps.map((e) => WorkoutListModel.fromMap(e)).toList();
  }

  //function check if there is workoutlist titles and remaining times > 0
  Future<bool> checkIfThereIsWorkoutListTitles(String workoutList) async {
    final result_get_by_title = await getWorkoutListByTitle(workoutList);
    return result_get_by_title
        .where((workout) => (workout.remaining_times ?? 0) > 0)
        .isNotEmpty;
  }

  Future<int> update(WorkoutListModel workoutList) async {
    Database db = await databaseHelper.database;
    return await db.update(
      TABLE,
      workoutList.toMap(),
      where: '$ID = ? AND $DELETED_AT IS NULL',
      whereArgs: [workoutList.id],
    );
  }

  Future<List<Object?>> updateAll(List<WorkoutListModel> workoutList) async {
    Database db = await databaseHelper.database;
    final batch = db.batch();
    workoutList.forEach((workout) {
      batch.update(
        TABLE,
        workout.toMap(),
        where: '$ID = ? AND $DELETED_AT IS NULL',
        whereArgs: [workout.id],
      );
    });
    return await batch.commit(noResult: true);
  }

  //update NRS before
  Future<int> updateNRSbefore(int NRS, int id) async {
    Database db = await databaseHelper.database;
    return await db.update(
      TABLE,
      {'NRS_before': NRS},
      where: '$ID = ? AND $DELETED_AT IS NULL',
      whereArgs: [id],
    );
  }

  //update NRS after
  Future<int> updateNRSafter(int NRS, int id) async {
    Database db = await databaseHelper.database;
    return await db.update(
      TABLE,
      {NRS_AFTER: NRS},
      where: '$ID = ? AND $DELETED_AT IS NULL',
      whereArgs: [id],
    );
  }

  //delete workoutlist
  Future<void> deleteWorkoutList(int id) async {
    Database db = await databaseHelper.database;
    await db.update(
      TABLE,
      {DELETED_AT: DateTime.now().toIso8601String()},
      where: '$ID = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllWorkoutList() async {
    Database db = await databaseHelper.database;
    return await db.update(
      TABLE,
      {DELETED_AT: DateTime.now().toIso8601String()},
      where: '$DELETED_AT IS NULL',
    );
  }

  Future<int> deleteWorkoutListByTitle(String title) async {
    Database db = await databaseHelper.database;
    return await db.update(
      TABLE,
      {DELETED_AT: DateTime.now().toIso8601String()},
      where: '$WOL_TITLE = ?',
      whereArgs: [title],
    );
  }

  Future<List<String>> getAvailableWorkoutListTitles() async {
    Database db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: "$DELETED_AT IS NULL AND $REMAINING_TIMES > ?",
      whereArgs: [0],
      groupBy: WOL_TITLE,
      columns: [WOL_TITLE],
    );

    return maps.map((row) => row[WOL_TITLE].toString()).toList();
  }

  //update remaining times
  Future<int> updateRemainingTimes(int remainingTimes, int id) async {
    if (remainingTimes < 0) {
      return 0;
    }
    Database db = await databaseHelper.database;
    return await db.update(
      TABLE,
      {REMAINING_TIMES: remainingTimes},
      where: '$ID = ? AND $DELETED_AT IS NULL',
      whereArgs: [id],
    );
  }

  Future<int?> getFirstTimeNrsByTitle(String titleCode) async {
    final workoutlist = await getWorkoutListByTitle(titleCode);
    final workoutWithNrs =
        workoutlist.where((workout) => workout.NRS_before != null).toList();
    if (workoutWithNrs.isEmpty) {
      return null;
    }
    return workoutWithNrs.first.NRS_before;
  }

  Future<int?> getLatestNrsByTitle(String titleCode) async {
    final workoutlist = await getWorkoutListByTitle(titleCode);
    final workoutWithNrs =
        workoutlist.where((workout) => workout.NRS_after != null).toList();
    if (workoutWithNrs.isEmpty) {
      return null;
    }
    return workoutWithNrs.last.NRS_after;
  }

  Future<int> cumulativeDayOfWorkoutListTitle(String titleCode) async {
    final workoutlist = await getWorkoutListByTitle(titleCode);
    return cumulativeActiveDay(workoutlist);
  }

  Future<double> averageCumulativeNrsByTitle(String titleCode) async {
    final workoutlist = await getWorkoutListByTitle(titleCode);
    final workoutWithNrs = workoutlist
        .where((workout) =>
            workout.NRS_before != null && workout.NRS_after != null)
        .toList();
    if (workoutWithNrs.isEmpty) {
      return 0;
    }
    final sumNrs = (workoutWithNrs
                .map((workout) => workout.NRS_before)
                .reduce((acc, value) => (acc ?? 0) + (value ?? 0)) ??
            0) +
        (workoutWithNrs
                .map((workout) => workout.NRS_after)
                .reduce((acc, value) => (acc ?? 0) + (value ?? 0)) ??
            0);
    ;
    return sumNrs / 2 * workoutWithNrs.length;
  }

  /// Get the number of days that the user has done the workout
  static int cumulativeActiveDay(List<WorkoutListModel> workouts) =>
      workouts.where(didWorkout).length;

  /// Compare the remaining times and total times, if the remaining times is less than the total times, then the user has done the workout
  static bool didWorkout(workout) =>
      ((workout.remaining_times == null) || (workout.total_times == null))
          ? false
          : workout.remaining_times! < workout.total_times!;
}
