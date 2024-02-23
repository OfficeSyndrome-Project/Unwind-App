import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_model.dart';

class ScreeningTestAnswerWorkoutListDB {
  static const String TABLE = 'ScreeningTestAnswerWorkoutList';
  static const String ID = 'id';
  static const String SCREENING_TEST_ANSWER_ID = 'ScreeningTestAnswer_id';
  static const String WORKOUT_LIST_ID = 'WorkoutList_id';

  DatabaseHelper databaseHelper;
  ScreeningTestAnswerWorkoutListDB({
    required this.databaseHelper,
  });

  Future<ScreeningTestAnswerWorkoutListModel> insert(
      ScreeningTestAnswerWorkoutListModel model) async {
    final db = await databaseHelper.database;
    final success = await db.insert(
      TABLE,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return model.copyWith(id: success);
  }

  Future<List<ScreeningTestAnswerWorkoutListModel>> insertAll(
      List<ScreeningTestAnswerWorkoutListModel> models) async {
    final db = await databaseHelper.database;
    final batch = db.batch();
    for (final model in models) {
      batch.insert(
        TABLE,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    try {
      await batch.commit(continueOnError: false);
      return models;
    } catch (e) {
      return [];
    }
  }

  Future<List<ScreeningTestAnswerWorkoutListModel>> getAllByWorkoutListId(
      int workoutListId) async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: '$WORKOUT_LIST_ID = ?',
      whereArgs: [workoutListId],
    );
    return maps
        .map((e) => ScreeningTestAnswerWorkoutListModel.fromMap(e))
        .toList();
  }

  Future<List<ScreeningTestAnswerWorkoutListModel>>
      getAllByScreeningTestAnswerId(int screeningTestAnswerId) async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
      where: '$SCREENING_TEST_ANSWER_ID = ?',
      whereArgs: [screeningTestAnswerId],
    );
    return maps
        .map((e) => ScreeningTestAnswerWorkoutListModel.fromMap(e))
        .toList();
  }

  Future<List<ScreeningTestAnswerWorkoutListModel>> getAll() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE,
    );
    return maps
        .map((e) => ScreeningTestAnswerWorkoutListModel.fromMap(e))
        .toList();
  }

  Future<int> delete(ScreeningTestAnswerWorkoutListModel model) async {
    final db = await databaseHelper.database;
    return await db.delete(
      TABLE,
      where: '$ID = ?',
      whereArgs: [model.id],
    );
  }

  Future<int> deleteAll() async {
    final db = await databaseHelper.database;
    return await db.delete(TABLE);
  }
}
