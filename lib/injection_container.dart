import 'package:get_it/get_it.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/database/screeningtest_db.dart';
import 'package:unwind_app/database/workoutlist_db.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //database helper
  serviceLocator.registerSingleton<DatabaseHelper>(DatabaseHelper());
  serviceLocator.registerLazySingleton<WorkoutListDB>(
      () => WorkoutListDB(serviceLocator<DatabaseHelper>()));
  serviceLocator.registerLazySingleton<ScreeningTestDB>(
      () => ScreeningTestDB(serviceLocator<DatabaseHelper>()));
}
