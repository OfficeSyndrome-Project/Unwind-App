import 'package:unwind_app/database/screening_test_answer_workout_list_db.dart';
import 'package:unwind_app/database/screeningtestanswer_db.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_model.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

class ScreeningTestAnswerWorkoutListService {
  ScreeningTestAnswerWorkoutListDB screeningTestAnswerWorkoutListDB;
  ScreeningTestAnswerDB screeningTestAnswerDB;
  WorkoutListDB workoutListDB;
  ScreeningTestAnswerWorkoutListService({
    required this.screeningTestAnswerWorkoutListDB,
    required this.screeningTestAnswerDB,
    required this.workoutListDB,
  });

  Future<List<ScreeningTestAnswerWorkoutListModel>> insertAll(
      List<ScreeningTestAnswerWorkoutListModel> models) async {
    if (models.isEmpty) {
      return [];
    }
    if (models.any((element) => element.screeningTestAnswerId == null) ||
        models.any((element) => element.workoutListId == null)) {
      return [];
    }
    return await screeningTestAnswerWorkoutListDB.insertAll(models);
  }

  Future<ScreeningTestAnswerWorkoutListModel>
      insertScreeningTestAnswerWorkoutList(
          ScreeningTestAnswerWorkoutListModel
              screeningTestAnswerWorkoutListModel) async {
    final result = await screeningTestAnswerWorkoutListDB
        .insert(screeningTestAnswerWorkoutListModel);
    return result;
  }

  Future<List<ScreeningTestAnswerModel>> getAllScreeningTestAnswerByWorkoutList(
      WorkoutListModel workoutListModel) async {
    if (workoutListModel.id == null) {
      return [];
    }

    final result = await screeningTestAnswerWorkoutListDB
        .getAllByWorkoutListId(workoutListModel.id!)
        .then((value) => value
            .map((e) => e.screeningTestAnswerId!)
            .map((id) =>
                screeningTestAnswerDB.getScreeningTestAnswer(id).then((value) {
                  if (value != null) {
                    return value;
                  }
                  return null;
                }))
            .toList());
    final screeningTestAnswerModels = await Future.wait(result);

    return screeningTestAnswerModels
        .whereType<ScreeningTestAnswerModel>()
        .toList();
  }

  Future<List<WorkoutListModel>> getAllWorkoutListByScreeningTestAnswer(
      ScreeningTestAnswerModel screeningTestAnswerModel) async {
    final result = await screeningTestAnswerWorkoutListDB
        .getAllByScreeningTestAnswerId(screeningTestAnswerModel.id!)
        .then((value) => value
            .map((e) => e.workoutListId!)
            .map((id) => workoutListDB.getWorkoutList(id).then((value) {
                  return value;
                }))
            .toList());
    final workoutListModels = await Future.wait(result);

    return workoutListModels.whereType<WorkoutListModel>().toList();
  }
}
