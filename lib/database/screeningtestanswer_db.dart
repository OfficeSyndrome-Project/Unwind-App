import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';

class ScreeningTestAnswerDB {
  DatabaseHelper database;
  ScreeningTestAnswerDB(this.database);

  Future<ScreeningTestAnswer_Model> insertScreeningTestAnswer(
    ScreeningTestAnswer_Model screeningTestAnswer,
  ) async {
    Database db = await database.database;
    await db.insert(
      'ScreeningTestAnswer',
      screeningTestAnswer.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return screeningTestAnswer;
  }

  Future<List<ScreeningTestAnswer_Model>> getAllScreeningTestAnswer() async {
    Database db = await database.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'ScreeningTestAnswer',
      where: 'deleted_at IS NULL',
    );
    return maps.map((e) => ScreeningTestAnswer_Model.fromJson(e)).toList();
  }

  Future<ScreeningTestAnswer_Model?> getScreeningTestAnswer(int id) async {
    Database db = await database.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'ScreeningTestAnswer',
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return null;
    }
    return ScreeningTestAnswer_Model.fromJson(maps.first);
  }

  Future<int> updateScreeningTestAnswer(
    ScreeningTestAnswer_Model screeningTestAnswer,
  ) async {
    Database db = await database.database;
    return await db.update(
      'ScreeningTestAnswer',
      screeningTestAnswer.toJson(),
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [screeningTestAnswer.id],
    );
  }

  Future<int> deleteScreeningTestAnswer(int id) async {
    Database db = await database.database;
    final screeningTestAnswerToDelete = await getScreeningTestAnswer(id);
    if (screeningTestAnswerToDelete == null) {
      return 0;
    }

    return await db.update(
      'ScreeningTestAnswer',
      {'deleted_at': DateTime.now().toIso8601String()},
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllScreeningTestAnswer() async {
    Database db = await database.database;
    return await db.update(
      'ScreeningTestAnswer',
      {'deleted_at': DateTime.now().toIso8601String()},
      where: 'deleted_at IS NULL',
    );
  }

  // Future<int> insertScreeningTestAnswer(Map<String, dynamic> screeningTestAnswer) async {
  //   Database db = await database.database;
  //   return await db.insert(
  //     'ScreeningTestAnswer',
  //     screeningTestAnswer,
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // Future<int> updateScreeningTestAnswer(Map<String, dynamic> screeningTestAnswer) async {
  //   Database db = await database.database;
  //   return await db.update(
  //     'ScreeningTestAnswer',
  //     screeningTestAnswer,
  //     where: 'a_id = ?',
  //     whereArgs: [screeningTestAnswer['a_id']],
  //   );
  // }

  // Future<int> deleteScreeningTestAnswer(int id) async {
  //   Database db = await database.database;
  //   return await db.delete(
  //     'ScreeningTestAnswer',
  //     where: 'a_id = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<Map<String, dynamic>> getScreeningTestAnswer(int id) async{
  //   Database db = await database.database;
  //   final List<Map<String, dynamic>> maps = await db.query('ScreeningTestAnswer');
  //   return maps.first;
  // }

  // Future<List<Map<String, dynamic>>> getAllScreeningTestAnswer() async{
  //   Database db = await database.database;
  //   final List<Map<String, dynamic>> maps = await db.query('ScreeningTestAnswer');
  //   return maps;
  // }
}
