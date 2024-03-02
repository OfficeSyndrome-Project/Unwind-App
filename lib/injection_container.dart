import 'package:get_it/get_it.dart';
import 'package:unwind_app/database/db_helper.dart';
import 'package:unwind_app/database/screening_test_answer_workout_list_db.dart';
import 'package:unwind_app/database/screeningtestanswer_db.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //database helper
  serviceLocator.registerSingleton<DatabaseHelper>(DatabaseHelper());
  serviceLocator.registerLazySingleton<WorkoutListDB>(
      () => WorkoutListDB(databaseHelper: serviceLocator()));
  serviceLocator.registerLazySingleton<ScreeningTestAnswerDB>(
      () => ScreeningTestAnswerDB(serviceLocator<DatabaseHelper>()));
  serviceLocator.registerLazySingleton<ScreeningTestAnswerWorkoutListDB>(
      () => ScreeningTestAnswerWorkoutListDB(
            databaseHelper: serviceLocator(),
          ));

  //service

  // question service

  // answer service
  serviceLocator.registerLazySingleton<ScreeningTestAnswerWorkoutListService>(
      () => ScreeningTestAnswerWorkoutListService(
            screeningTestAnswerWorkoutListDB: serviceLocator(),
            screeningTestAnswerDB: serviceLocator(),
            workoutListDB: serviceLocator(),
          ));
  // serviceLocator.registerLazySingleton<AnswerService>(() => AnswerService(
  //     ));
}
