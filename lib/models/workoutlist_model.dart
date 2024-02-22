import 'dart:convert';

class WorkoutListModel {
  int? id;
  DateTime? date;
  String? WOL_title;
  int? remaining_times;
  int? total_times;
  int? NRS_before;
  int? NRS_after;
  DateTime? created_at;
  DateTime? deleted_at;

  WorkoutListModel({
    this.id,
    this.date,
    this.WOL_title,
    this.remaining_times,
    this.total_times,
    this.NRS_before,
    this.NRS_after,
    this.created_at,
    this.deleted_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.toIso8601String(),
      'WOL_title': WOL_title,
      'remaining_times': remaining_times,
      'total_times': total_times,
      'NRS_before': NRS_before,
      'NRS_after': NRS_after,
      'created_at': created_at?.toIso8601String(),
      'deleted_at': deleted_at?.toIso8601String(),
    };
  }

  factory WorkoutListModel.fromMap(Map<String, dynamic> data) {
    return WorkoutListModel(
      id: data['id'],
      date: DateTime.tryParse(data['date'] ?? ''),
      WOL_title: data['WOL_title'],
      remaining_times: data['remaining_times'],
      total_times: data['total_times'],
      NRS_before: data['NRS_before'],
      NRS_after: data['NRS_after'],
      created_at: DateTime.tryParse(data['created_at'] ?? ''),
      deleted_at: DateTime.tryParse(data['deleted_at'] ?? ''),
    );
  }

  WorkoutListModel copyWith({
    int? id,
    DateTime? date,
    String? WOL_title,
    int? remaining_times,
    int? total_times,
    int? NRS_before,
    int? NRS_after,
    DateTime? created_at,
    DateTime? deleted_at,
  }) {
    return WorkoutListModel(
      id: id ?? this.id,
      date: date ?? this.date,
      WOL_title: WOL_title ?? this.WOL_title,
      remaining_times: remaining_times ?? this.remaining_times,
      total_times: total_times ?? this.total_times,
      NRS_before: NRS_before ?? this.NRS_before,
      NRS_after: NRS_after ?? this.NRS_after,
      created_at: created_at ?? this.created_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  @override
  String toString() {
    final encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(toMap());
  }
}
