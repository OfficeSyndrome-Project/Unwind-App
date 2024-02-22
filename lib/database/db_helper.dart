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

    String withLog = "no"; // to enable log, change to "yes"
    var dbFactory = databaseFactory;
    if (withLog == "yes") {
      dbFactory = factoryWithLogs;
    }
    print(
        'database path: ${join(await getDatabasesPath(), 'unwind_database.db')}');

    final database = dbFactory.openDatabase(
      join(await getDatabasesPath(), 'unwind_database.db'),
      options: OpenDatabaseOptions(
        onConfigure: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) {
          //Create User table

          // Create ScreeningTest table
          db.execute('''
          CREATE TABLE ScreeningTest (
            t_id INTEGER PRIMARY KEY AUTOINCREMENT,
            created_at DATETIME,
            deleted_at DATETIME
            );
          ''');

          //Create ScreeningTest_answer table
          db.execute('''
          CREATE TABLE ScreeningTest_answer (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            t_id INTEGER,
            type TEXT,
            area TEXT,
            q_id INTEGER,
            ans TEXT,
            FOREIGN KEY (t_id) REFERENCES ScreeningTest(t_id)
          );
        ''');

          // Create WorkoutList table
          db.execute('''
          CREATE TABLE WorkoutList (
            WOL_id INTEGER PRIMARY KEY AUTOINCREMENT,
            date DATETIME,
            WOL_title TEXT,
            remaining_times INTEGER,
            total_times INTEGER,
            NRS_before INTEGER,
            NRS_after INTEGER,
            deleted_at DATETIME
          );
          ''');
        },
        version: 1,
      ),
    );
    return database;
  }
}
