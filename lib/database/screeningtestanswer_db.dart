import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';

class ScreeningTestAnswerDB {
  DatabaseHelper database;
  ScreeningTestAnswerDB(this.database);

  Future<ScreeningTestAnswerModel?> insertScreeningTestAnswer(
    ScreeningTestAnswerModel screeningTestAnswer,
  ) async {
    Database db = await database.database;
    final now = DateTime.now();
    final answerToInsert =
        screeningTestAnswer.copyWith(created_at: now, deleted_at: null);
    try {
      final id = await db.insert(
        'ScreeningTestAnswer',
        answerToInsert.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return answerToInsert.copyWith(id: id);
    } catch (e) {
      return null;
    }
  }

  Future<List<ScreeningTestAnswerModel>> insertAll(
      List<ScreeningTestAnswerModel> answers) async {
    Database db = await database.database;
    final now = DateTime.now();
    List<ScreeningTestAnswerModel> insertedAnswers = [];
    try {
      await db.transaction(
        (txn) async {
          for (var answer in answers) {
            final inserted_id = await txn.insert(
              'ScreeningTestAnswer',
              answer.copyWith(created_at: now).toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
            insertedAnswers
                .add(answer.copyWith(id: inserted_id, created_at: now));
          }
        },
      );
      return insertedAnswers;
    } catch (e) {
      return [];
    }
  }

  Future<List<ScreeningTestAnswerModel>> getAllScreeningTestAnswer() async {
    Database db = await database.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'ScreeningTestAnswer',
      where: 'deleted_at IS NULL',
    );
    return maps.map((e) => ScreeningTestAnswerModel.fromMap(e)).toList();
  }

  Future<ScreeningTestAnswerModel?> getScreeningTestAnswer(int id) async {
    Database db = await database.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'ScreeningTestAnswer',
      where: 'id = ? AND deleted_at IS NULL',
      whereArgs: [id],
    );
    if (maps.isEmpty) {
      return null;
    }
    return ScreeningTestAnswerModel.fromMap(maps.first);
  }

  Future<ScreeningTestAnswerModel?> updateScreeningTestAnswer(
    ScreeningTestAnswerModel screeningTestAnswer,
  ) async {
    Database db = await database.database;
    try {
      final id = await db.update(
        'ScreeningTestAnswer',
        screeningTestAnswer.toMap(),
        where: 'id = ? AND deleted_at IS NULL',
        whereArgs: [screeningTestAnswer.id],
      );
      return screeningTestAnswer.copyWith(id: id);
    } catch (e) {
      return null;
    }
  }

  Future<ScreeningTestAnswerModel?> deleteScreeningTestAnswer(int id) async {
    Database db = await database.database;
    final screeningTestAnswerToDelete = await getScreeningTestAnswer(id);
    if (screeningTestAnswerToDelete == null) {
      return null;
    }
    try {
      final now = DateTime.now();
      await db.update(
        'ScreeningTestAnswer',
        {'deleted_at': now.toIso8601String()},
        where: 'id = ? AND deleted_at IS NULL',
        whereArgs: [id],
      );
      return screeningTestAnswerToDelete.copyWith(deleted_at: now);
    } catch (e) {
      return null;
    }
  }

  Future<int> deleteAllScreeningTestAnswer() async {
    Database db = await database.database;
    final now = DateTime.now();
    try {
      final success = await db.transaction(
        (txn) async {
          await txn.update(
            'ScreeningTestAnswer',
            {'deleted_at': now.toIso8601String()},
            where: 'deleted_at IS NULL',
          );
        },
      );
      return success;
    } catch (e) {
      return 0;
    }
  }
}
