class WorkoutListModel {
  int? WOL_id;
  DateTime? date;
  String? WOL_title;
  int? remaining_times;
  int? total_times;
  int? NRS_before;
  int? NRS_after;
  DateTime? deleted_at;

  WorkoutListModel({
    this.WOL_id,
    this.date,
    this.WOL_title,
    this.remaining_times,
    this.total_times,
    this.NRS_before,
    this.NRS_after,
    this.deleted_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'WOL_id': WOL_id,
      'date': date?.toIso8601String(),
      'WOL_title': WOL_title,
      'remaining_times': remaining_times,
      'total_times': total_times,
      'NRS_before': NRS_before,
      'NRS_after': NRS_after,
      'deleted_at': deleted_at,
    };
  }

  factory WorkoutListModel.fromJson(Map<String, dynamic> json) {
    return WorkoutListModel(
      WOL_id: json['WOL_id'],
      date: DateTime.tryParse(json['date']),
      WOL_title: json['WOL_title'],
      remaining_times: json['remaining_times'],
      total_times: json['total_times'],
      NRS_before: json['NRS_before'],
      NRS_after: json['NRS_after'],
      deleted_at: DateTime.tryParse(json['deleted_at'] ?? ''),
    );
  }

  // @override
  // String toString() {
  //   return 'WorkoutListModel{WOL_id: $WOL_id, date: $date, WOL_title: $WOL_title, remaining_times: $remaining_times, total_times: $total_times, NRS_before: $NRS_before, NRS_after: $NRS_after, deleted_at: $deleted_at}';
  // }

  //title and date
  @override
  String toString() {
    return '$WOL_title,${date?.day}';
  }
}
