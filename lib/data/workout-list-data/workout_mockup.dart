class WorkoutMockup {
  final int day;
  final DateTime workoutDate;
  final bool isDone;
  final double percent;

  WorkoutMockup(
      {required this.day,
      required this.workoutDate,
      required this.isDone,
      required this.percent});

  static List<WorkoutMockup> getData() {
    List<WorkoutMockup> workoutmockup = [];

    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 3), //wed
        day: 1,
        isDone: true,
        percent: 1.0));
    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 4),
        day: 2,
        isDone: true,
        percent: 1.0));
    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 5),
        day: 3,
        isDone: true,
        percent: 1.0));
    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 6),
        day: 4,
        isDone: false,
        percent: 0.5));
    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 7),
        day: 5,
        isDone: false,
        percent: 0.0));
    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 8),
        day: 6,
        isDone: false,
        percent: 0.0));
    workoutmockup.add(WorkoutMockup(
        workoutDate: DateTime.utc(2024, 1, 9),
        day: 7,
        isDone: false,
        percent: 0.0));

    return workoutmockup;
  }
}
