class ScreeningTestAnswer_Model {
  final int id;
  final int t_id;
  final String type;
  final String area;
  final int qID;
  final String ans;

  ScreeningTestAnswer_Model({
    required this.id,
    required this.t_id,
    required this.type,
    required this.area,
    required this.qID,
    required this.ans,
  });

  factory ScreeningTestAnswer_Model.fromJson(Map<String, dynamic> json) =>
      ScreeningTestAnswer_Model(
        id: json['id'],
        t_id: json['t_id'],
        type: json['type'],
        area: json['area'],
        qID: json['qID'],
        ans: json['ans'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        't_id': t_id,
        'type': type,
        'area': area,
        'qID': qID,
        'ans': ans,
      };
}
