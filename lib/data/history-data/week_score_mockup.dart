/// WeekScore interface use for SummaryPage in line series
abstract class WeekScore {
  String? get weekName;
  int? get week;
  int? get beforeScore;
  int? get afterScore;
}

class WeekScoreRealize implements WeekScore {
  final String? weekName;
  final int? week;
  final int? beforeScore;
  final int? afterScore;

  WeekScoreRealize({
    required this.week,
    required this.weekName,
    required this.beforeScore,
    required this.afterScore,
  });
  @override
  String toString() =>
      'WeekScoreRealize $weekName $week $beforeScore $afterScore';
}

class WeekScoreMockup implements WeekScore {
  final String? weekName;
  final int? week;
  final int? beforeScore;
  final int? afterScore;

  WeekScoreMockup(
      {required this.week,
      required this.weekName,
      required this.beforeScore,
      required this.afterScore});

  static List<WeekScoreMockup> getData() {
    List<WeekScoreMockup> scoreweekmockup = [];

    scoreweekmockup.add(WeekScoreMockup(
        week: 1, beforeScore: 8, afterScore: 6, weekName: 'week 1'));
    scoreweekmockup.add(WeekScoreMockup(
        week: 2, beforeScore: 6, afterScore: 5, weekName: 'week 2'));

    scoreweekmockup.add(WeekScoreMockup(
        week: 3, beforeScore: 5, afterScore: 4, weekName: 'week 3'));

    scoreweekmockup.add(WeekScoreMockup(
        week: 4, beforeScore: 4, afterScore: 3, weekName: 'week 4'));

    return scoreweekmockup;
  }
}
