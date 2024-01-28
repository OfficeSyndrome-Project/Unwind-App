import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';

class ScreeningTestDB {
  DatabaseHelper database;
  ScreeningTestDB(this.database);

  Future<int> insertScreeningTest(DateTime timestamp) async {
    Database db = await database.database;
    return await db.insert(
      'ScreeningTest',
      {
        'created_at': timestamp.toIso8601String(),
      },
    );
  }

  // Future<int> insertScreeningTest(Map<String, dynamic> screeningTest) async {
  //   Database db = await database.database;
  //   return await db.insert(
  //     'ScreeningTest',
  //     screeningTest,
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // Future<int> updateScreeningTest(Map<String, dynamic> screeningTest) async {
  //   Database db = await database.database;
  //   return await db.update(
  //     'ScreeningTest',
  //     screeningTest,
  //     where: 't_id = ?',
  //     whereArgs: [screeningTest['t_id']],
  //   );
  // }

  // Future<int> deleteScreeningTest(int id) async {
  //   Database db = await database.database;
  //   return await db.delete(
  //     'ScreeningTest',
  //     where: 't_id = ?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<Map<String, dynamic>> getScreeningTest(int id) async{
  //   Database db = await database.database;
  //   final List<Map<String, dynamic>> maps = await db.query('ScreeningTest');
  //   return maps.first;
  // }

  // Future<List<Map<String, dynamic>>> getAllScreeningTest() async{
  //   Database db = await database.database;
  //   final List<Map<String, dynamic>> maps = await db.query('ScreeningTest');
  //   return maps;
  // }
}
