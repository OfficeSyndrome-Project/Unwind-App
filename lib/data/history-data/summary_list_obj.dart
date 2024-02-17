import 'package:unwind_app/models/workoutlist_model.dart';

import 'keep_score_and_date_model.dart';

class SummaryListObj {
  final List<List<KeepScoreAndDateModel>> weeklyChunks;
  final int index;

  SummaryListObj({required this.weeklyChunks, required this.index});
}

class DailyNrsScore {
  final DateTime? dateTime;
  final int? beforeScore;
  final int? afterScore;
  DailyNrsScore({
    this.dateTime,
    this.beforeScore,
    this.afterScore,
  });
}

class WeeklySummary {
  List<DailyNrsScore> dailyNrsScores;
  int weekNumber;
  WeeklySummary({
    required this.dailyNrsScores,
    required this.weekNumber,
  });
}

DailyNrsScore toDailyNrsScore(WorkoutListModel wol) {
  return DailyNrsScore(
    dateTime: wol.date,
    beforeScore: wol.NRS_before,
    afterScore: wol.NRS_after,
  );
}
