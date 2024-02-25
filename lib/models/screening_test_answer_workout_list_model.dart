class ScreeningTestAnswerWorkoutListModel {
  int? id;
  int? screeningTestAnswerId;
  int? workoutListId;

  ScreeningTestAnswerWorkoutListModel({
    this.id,
    this.screeningTestAnswerId,
    this.workoutListId,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'ScreeningTestAnswer_id': screeningTestAnswerId,
        'WorkoutList_id': workoutListId,
      };

  factory ScreeningTestAnswerWorkoutListModel.fromMap(
          Map<String, dynamic> map) =>
      ScreeningTestAnswerWorkoutListModel(
        id: map['id'],
        screeningTestAnswerId: map['ScreeningTestAnswer_id'],
        workoutListId: map['WorkoutList_id'],
      );

  ScreeningTestAnswerWorkoutListModel copyWith({
    int? id,
    int? screeningTestAnswerId,
    int? workoutListId,
  }) =>
      ScreeningTestAnswerWorkoutListModel(
        id: id ?? this.id,
        screeningTestAnswerId:
            screeningTestAnswerId ?? this.screeningTestAnswerId,
        workoutListId: workoutListId ?? this.workoutListId,
      );

  @override
  String toString() =>
      'ScreeningTestAnswerWorkoutListModel{id: $id, ScreeningTestAnswer_id: $screeningTestAnswerId, WorkoutList_id: $workoutListId}';
}
