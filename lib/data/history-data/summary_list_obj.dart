import 'keep_score_and_date_model.dart';

class SummaryListObj {
  final List<List<KeepScoreAndDateModel>> weeklyChunks;
  final int index;

  SummaryListObj({required this.weeklyChunks, required this.index});
}
