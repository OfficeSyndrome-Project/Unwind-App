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
      {required this.weekName,
      required this.week,
      required this.beforeScore,
      required this.afterScore});

  static List<WeekScoreMockup> getData() {
    List<WeekScoreMockup> scoreweekmockup = [];

    scoreweekmockup.add(WeekScoreMockup(
        weekName: 'week 1', beforeScore: 8, afterScore: 6, week: 1));
    scoreweekmockup.add(WeekScoreMockup(
        weekName: 'week 2', beforeScore: 6, afterScore: 5, week: 2));

    scoreweekmockup.add(WeekScoreMockup(
        weekName: 'week 3', beforeScore: 5, afterScore: 4, week: 3));

    scoreweekmockup.add(WeekScoreMockup(
        weekName: 'week 4', beforeScore: 4, afterScore: 3, week: 4));

    return scoreweekmockup;
  }
}
