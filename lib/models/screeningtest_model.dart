class ScreeningTestModel {
  final int t_id;
  final String timestamp;

  ScreeningTestModel({
    required this.t_id,
    required this.timestamp,
  });

  factory ScreeningTestModel.fromJson(Map<String, dynamic> json) =>
      ScreeningTestModel(
        t_id: json['t_id'],
        timestamp: json['timestamp'],
      );

  Map<String, dynamic> toJson() => {
        't_id': t_id,
        'timestamp': timestamp,
      };
}
