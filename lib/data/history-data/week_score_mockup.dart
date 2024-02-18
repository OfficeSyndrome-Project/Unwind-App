class WeekScoreMockup {
  final int? week;
  final DateTime weekDay;
  final int? beforeScore;
  final int? afterScore;

  WeekScoreMockup(
      {required this.weekDay,
      required this.week,
      required this.beforeScore,
      required this.afterScore});

  static List<WeekScoreMockup> getData() {
    List<WeekScoreMockup> scoreweekmockup = [];

    scoreweekmockup.add(WeekScoreMockup(
        weekDay: DateTime.utc(2024, 1, 1),
        beforeScore: 8,
        afterScore: 6,
        week: 1));
    scoreweekmockup.add(WeekScoreMockup(
        weekDay: DateTime.utc(2024, 1, 8),
        beforeScore: 6,
        afterScore: 5,
        week: 2));

    scoreweekmockup.add(WeekScoreMockup(
        weekDay: DateTime.utc(2024, 1, 15),
        beforeScore: 5,
        afterScore: 4,
        week: 3));

    scoreweekmockup.add(WeekScoreMockup(
        weekDay: DateTime.utc(2024, 1, 22),
        beforeScore: 4,
        afterScore: 3,
        week: 4));

    return scoreweekmockup;
  }
}
