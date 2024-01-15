import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';

class ScreeningTestAnswerDB{
  DatabaseHelper database;
  ScreeningTestAnswerDB(this.database);

  Future<int> insertScreeningTestAnswer(int tId,int id, String type, String area, int qId, String ans) async {
    Database db = await database.database;
    return await db.insert('ScreeningTest_answer', {
      't_id': tId,
      'id': id,
      'type': type,
      'area': area,
      'qID': qId,
      'ans': ans,
    });
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