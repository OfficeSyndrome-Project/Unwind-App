import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

enum WorkoutlistTitle { neckbaa_ch, neckbaa_th, shoulder, back_ch, back_th }

class WorkoutListDB {
  DatabaseHelper database;
  WorkoutListDB(this.database);
  //insert workoutlist
  Future<int> insertWorkoutList(WorkoutListModel workoutList) async {
    Database db = await database.database;
    return await db.insert(
      'WorkoutList',
      workoutList.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
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
    Database db = await database.database;
    final List<Map<String, dynamic>> maps =
        await db.query('WorkoutList', where: "deleted_at IS NULL");
    return maps.map((e) => WorkoutListModel.fromJson(e)).toList();
  }

  //query workoutlist by specific date
  Future<List<WorkoutListModel>> getWorkoutListByDate(DateTime date) async {
    Database db = await database.database;
    final from = DateTime(date.year, date.month, date.day);
    final to = DateTime(date.year, date.month, date.day + 1);
    final List<Map<String, dynamic>> maps = await db.query(
      'WorkoutList',
      where: "date >= ? AND date < ? AND deleted_at IS NULL",
      whereArgs: [from.toIso8601String(), to.toIso8601String()],
    );
    return maps.map((e) => WorkoutListModel.fromJson(e)).toList();
  }

  //query workoutlist by date and title
  Future<List<WorkoutListModel>> getWorkoutListByDateAndTitle(
      DateTime date, String title) async {
    final workoutlist = await getWorkoutListByDate(date);
    return workoutlist.where((element) => element.WOL_title == title).toList();
  }

  //query workoutlist by title
  Future<List<WorkoutListModel>> getWorkoutListByTitle(String title) async {
    Database db = await database.database;
    final List<Map<String, dynamic>> maps = await db.query('WorkoutList',
        where: "WOL_title = ? AND deleted_at IS NULL",
        whereArgs: [title],
        orderBy: 'date ASC');
    print(maps);
    return maps.map((e) => WorkoutListModel.fromJson(e)).toList();
  }

  //function check if there is workoutlist titles and remaining times > 0
  Future<bool> checkIfThereIsWorkoutListTitles(String workoutList) async {
    final result_get_by_title = await getWorkoutListByTitle(workoutList);
    return result_get_by_title
        .where((workout) => (workout.remaining_times ?? 0) > 0)
        .isNotEmpty;
  }

  //update NRS before
  Future<void> updateNRSbefore(int NRS, int WOL_id) async {
    Database db = await database.database;
    await db.update(
      'WorkoutList',
      {'NRS_before': NRS},
      where: 'WOL_id = ? AND deleted_at IS NULL',
      whereArgs: [WOL_id],
    );
  }

  //update NRS after
  Future<void> updateNRSafter(int NRS, int WOL_id) async {
    Database db = await database.database;
    await db.update(
      'WorkoutList',
      {'NRS_after': NRS},
      where: 'WOL_id = ? AND deleted_at IS NULL',
      whereArgs: [WOL_id],
    );
  }

  //delete workoutlist
  Future<void> deleteWorkoutList(int WOL_id) async {
    Database db = await database.database;
    await db.update(
      'WorkoutList',
      {'deleted_at': DateTime.now().toIso8601String()},
      where: 'WOL_id = ?',
      whereArgs: [WOL_id],
    );
  }

  Future<int> deleteAllWorkoutList() async {
    Database db = await database.database;
    return await db.update(
      'WorkoutList',
      {'deleted_at': DateTime.now().toIso8601String()},
      where: 'deleted_at IS NULL',
    );
  }

  Future<int> deleteWorkoutListByTitle(String title) async {
    Database db = await database.database;
    return await db.update(
      'WorkoutList',
      {'deleted_at': DateTime.now().toIso8601String()},
      where: 'WOL_title = ?',
      whereArgs: [title],
    );
  }

  Future<List<String>> getAvailableWorkoutListTitles() async {
    Database db = await database.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'WorkoutList',
      where: "deleted_at IS NULL AND remaining_times > ?",
      whereArgs: [0],
      groupBy: 'WOL_title',
      columns: ['WOL_title'],
    );

    return maps.map((row) => row['WOL_title'].toString()).toList();
  }
}
