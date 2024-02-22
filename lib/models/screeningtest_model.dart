class ScreeningTestModel {
  final int? t_id;
  final DateTime? created_at;

  ScreeningTestModel({
    this.t_id,
    required this.created_at,
  });

  @override
  String toString() {
    return 'ScreeningTestModel{t_id: $t_id, created_at: $created_at}';
  }

  factory ScreeningTestModel.fromJson(Map<String, dynamic> json) =>
      ScreeningTestModel(
          t_id: json['t_id'],
          created_at: DateTime.tryParse(json['created_at']));

  Map<String, dynamic> toJson() => {
        't_id': t_id,
        'created_at': created_at?.toIso8601String(),
      };
}

DateTime? parseDateTimeSafe(dynamic dateTime) {
  print('hello');
  if (dateTime is String?) {
    if (dateTime == null) {
      return null;
    }
    return DateTime.tryParse(dateTime);
  }
  print('hello now');
  return null;
}
