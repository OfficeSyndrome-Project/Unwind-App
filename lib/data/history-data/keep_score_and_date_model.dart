class KeepScoreAndDateModel {
  final String? name;
  final int day;
  final DateTime dateTime;
  final int beforeScore;
  final int afterScore;

  KeepScoreAndDateModel(
      {required this.name,
      required this.day,
      required this.dateTime,
      required this.beforeScore,
      required this.afterScore});

  static List<KeepScoreAndDateModel> getData() {
    List<KeepScoreAndDateModel> keepscores = [];

    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 1,
        dateTime: DateTime.utc(2566, 8, 8),
        beforeScore: 8,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 2,
        dateTime: DateTime.utc(2566, 8, 9),
        beforeScore: 5,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 3,
        dateTime: DateTime.utc(2566, 8, 10),
        beforeScore: 5,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 4,
        dateTime: DateTime.utc(2566, 8, 11),
        beforeScore: 5,
        afterScore: 3));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 5,
        dateTime: DateTime.utc(2566, 8, 12),
        beforeScore: 4,
        afterScore: 3));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 6,
        dateTime: DateTime.utc(2566, 8, 13),
        beforeScore: 4,
        afterScore: 3));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 7,
        dateTime: DateTime.utc(2566, 8, 14),
        beforeScore: 6,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 8,
        dateTime: DateTime.utc(2566, 8, 15),
        beforeScore: 6,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 9,
        dateTime: DateTime.utc(2566, 8, 16),
        beforeScore: 6,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 10,
        dateTime: DateTime.utc(2566, 8, 17),
        beforeScore: 6,
        afterScore: 4));
    keepscores.add(KeepScoreAndDateModel(
        name: 'ชุดท่าบริหารคอ',
        day: 11,
        dateTime: DateTime.utc(2566, 8, 18),
        beforeScore: 6,
        afterScore: 2));

    return keepscores;
  }
}
