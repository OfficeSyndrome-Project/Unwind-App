import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common/sqflite_logger.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    var factoryWithLogs = SqfliteDatabaseFactoryLogger(databaseFactory,
        options:
            SqfliteLoggerOptions(type: SqfliteDatabaseFactoryLoggerType.all));
    final database = factoryWithLogs.openDatabase(
      join(await getDatabasesPath(), 'unwind_database.db'),
      options: OpenDatabaseOptions(
        onConfigure: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) {
          //Create User table
          db.execute('''
          CREATE TABLE users(
                u_id INTEGER PRIMARY KEY AUTOINCREMENT, 
                name TEXT, age INTEGER, 
                weight INTEGER, 
                height INTEGER, 
                sex TEXT, 
                career TEXT, 
                accident TEXT)
          ''');

          // Create ScreeningTest table
          db.execute('''
          CREATE TABLE ScreeningTest (
            t_id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp DATETIME
            );
          ''');

          //Create ScreeningTest_answer table
          db.execute('''
          CREATE TABLE ScreeningTest_answer (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            t_id INTEGER,
            type TEXT,
            area TEXT,
            qID INTEGER,
            ans TEXT,
            FOREIGN KEY (t_id) REFERENCES ScreeningTest(t_id)
          );
        ''');

          // Create NRS table
          db.execute('''
          CREATE TABLE NRS (
            NRS_id INTEGER PRIMARY KEY AUTOINCREMENT,
            NRS_before INTEGER,
            NRS_after INTEGER,
            WOL_id INTEGER,
            timestamp DATETIME,
            FOREIGN KEY (WOL_id) REFERENCES WorkoutList(WOL_id)
          );
        ''');

          // Create WorkoutList table
          db.execute('''
          CREATE TABLE WorkoutList (
            WOL_id INTEGER PRIMARY KEY AUTOINCREMENT,
            createAt DATETIME,
            isActivate TEXT
          );
        ''');

          // Create Have_workout table
          db.execute('''
          CREATE TABLE Have_workout (
            HWOL_id INTEGER PRIMARY KEY AUTOINCREMENT,
            WOL_id INTEGER,
            IsDone TEXT,
            FOREIGN KEY (WOL_id) REFERENCES WorkoutList(WOL_id)
          );
        ''');

          // Create Workout table
          db.execute('''
          CREATE TABLE Workout (
            w_id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            name TEXT,
            image TEXT
          );
        ''');
        },
        version: 1,
      ),
    );
    return database;
  }
}
