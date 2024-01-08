class DateWorkoutMockup {
  final int day;
  final DateTime dateTime;
  final bool isDone;
  final double percent;

  DateWorkoutMockup(
      {required this.day,
      required this.dateTime,
      required this.isDone,
      required this.percent});

  static List<DateWorkoutMockup> getData() {
    List<DateWorkoutMockup> mockupdate = [];

    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now()
            .subtract(Duration(days: DateTime.now().weekday - DateTime.monday)),
        day: 1,
        isDone: true,
        percent: 1.0));
    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now().subtract(
            Duration(days: DateTime.now().weekday - DateTime.tuesday)),
        day: 2,
        isDone: true,
        percent: 1.0));
    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now().subtract(
            Duration(days: DateTime.now().weekday - DateTime.wednesday)),
        day: 3,
        isDone: true,
        percent: 1.0));
    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now().subtract(
            Duration(days: DateTime.now().weekday - DateTime.thursday)),
        day: 4,
        isDone: false,
        percent: 0.5));
    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now()
            .subtract(Duration(days: DateTime.now().weekday - DateTime.friday)),
        day: 5,
        isDone: false,
        percent: 0.0));
    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now().subtract(
            Duration(days: DateTime.now().weekday - DateTime.saturday)),
        day: 6,
        isDone: false,
        percent: 0.0));
    mockupdate.add(DateWorkoutMockup(
        dateTime: DateTime.now()
            .subtract(Duration(days: DateTime.now().weekday - DateTime.sunday)),
        day: 7,
        isDone: false,
        percent: 0.0));

    return mockupdate;
  }
}
