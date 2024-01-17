import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/models/user_model.dart';

class UserDB{
  DatabaseHelper database;
  UserDB(this.database);

  Future<int> insertUser(UserModel user) async {
    Database db = await database.database;
    return await db.insert(
      'users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateUser(UserModel user) async {
    Database db = await database.database;
    // Get a reference to the database.
    // Update the given Dog.
    return await db.update(
      'users',
      user.toJson(),
      // Ensure that the Dog has a matching id.
      where: 'u_id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user.u_id],
    );
  }

  Future<int> deleteUser(int id) async {
    // Get a reference to the database.
    Database db = await database.database;
    // Remove the Dog from the database.
    return await db.delete(
      'users',
      // Use a `where` clause to delete a specific dog.
      where: 'u_id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
  
  Future<UserModel> getUser(int id) async{
    // Get a reference to the database.
    Database db = await database.database;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('users');
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return UserModel.fromJson(maps.first);
  }

  Future<List<UserModel>> getAllUser() async{
    // Get a reference to the database.
    Database db = await database.database;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('users');
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return UserModel(
        u_id: maps[i]['u_id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        weight: maps[i]['weight'],
        height: maps[i]['height'],
        sex: maps[i]['sex'],
        career: maps[i]['career'],
        accident: maps[i]['accident'],
      );
    });
  }
}