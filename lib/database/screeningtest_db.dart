// import 'dart:async';
// import 'package:sqflite/sqflite.dart';
// import 'package:unwind_app/database/db_helper.dart';
// import 'package:unwind_app/models/screeningtest_model.dart';

// class ScreeningTestDB {
//   DatabaseHelper database;
//   ScreeningTestDB(this.database);

//   //insert screeningtest
//   Future<ScreeningTestModel?> insertScreeningTest(
//       ScreeningTestModel screeningTestModel) async {
//     Database db = await database.database;
//     final success = await db.insert(
//       'ScreeningTest',
//       screeningTestModel.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     // getScreeningTest(tId);
//     final screeningTest = await getScreeningTest(success);
//     return screeningTest;
//   }

//   //get all screeningtest
//   Future<List<ScreeningTestModel>> getAllScreeningTest() async {
//     Database db = await database.database;
//     final List<Map<String, dynamic>> maps =
//         await db.query('ScreeningTest', where: "deleted_at IS NULL");
//     return maps.map((e) => ScreeningTestModel.fromJson(e)).toList();
//   }

//   //get screeningtest by t_id
//   Future<ScreeningTestModel?> getScreeningTest(int tId) async {
//     Database db = await database.database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       'ScreeningTest',
//       where: 't_id = ? AND deleted_at IS NULL',
//       whereArgs: [tId],
//     );
//     if (maps.isEmpty) {
//       return null;
//     }
//     return maps.map((e) => ScreeningTestModel.fromJson(e)).first;
//   }

//   //update screeningtest by t_id
//   Future<int> updateScreeningTest(int tId, DateTime timestamp) async {
//     Database db = await database.database;
//     return await db.update(
//       'ScreeningTest',
//       {
//         'created_at': timestamp.toIso8601String(),
//       },
//       where: 't_id = ? AND deleted_at IS NULL',
//       whereArgs: [tId],
//     );
//   }

//   //delete screeningtest by t_id
//   Future<int> deleteScreeningTest(int tId) async {
//     Database db = await database.database;
//     return await db.update(
//       'ScreeningTest',
//       {
//         'deleted_at': DateTime.now().toIso8601String(),
//       },
//       where: 't_id = ? AND deleted_at IS NULL',
//       whereArgs: [tId],
//     );
//   }

//   //delete all screeningtest
//   Future<int> deleteAllScreeningTest() async {
//     Database db = await database.database;
//     return await db.update(
//       'ScreeningTest',
//       {
//         'deleted_at': DateTime.now().toIso8601String(),
//       },
//       where: 'deleted_at IS NULL',
//     );
//   }
// }
