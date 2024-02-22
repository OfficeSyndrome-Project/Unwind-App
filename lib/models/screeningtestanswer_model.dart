import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class ScreeningTestAnswer_Model {
  final int? id;
  final int? t_id;
  final String? questionPart;
  final String? area;
  final int? questionId;
  final String? ans;

  ScreeningTestAnswer_Model({
    this.id,
    this.t_id,
    this.questionPart,
    this.area,
    this.questionId,
    this.ans,
  });

  factory ScreeningTestAnswer_Model.fromAnswer(Answer answer) =>
      ScreeningTestAnswer_Model(
        questionPart: answer.questionPart.toString(),
        area: answer.title,
        questionId: answer.questionId,
        ans: answer.answer.toString(),
      );

  factory ScreeningTestAnswer_Model.fromJson(Map<String, dynamic> json) =>
      ScreeningTestAnswer_Model(
        id: json['id'],
        t_id: json['t_id'],
        questionPart: json['questionPart'],
        area: json['area'],
        questionId: json['questionId'],
        ans: json['ans'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        't_id': t_id,
        'type': questionPart,
        'area': area,
        'qID': questionId,
        'ans': ans,
      };

  @override
  String toString() =>
      'ScreeningTestAnswer_Model{id: $id, t_id: $t_id, type: $questionPart, area: $area, qID: $questionId, ans: $ans}';
}
