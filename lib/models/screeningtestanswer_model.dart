import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class ScreeningTestAnswerModel {
  final int? id;
  final int? questionPart;
  final String? area;
  final int? questionId;
  final int? answer;
  final DateTime? created_at;
  final DateTime? deleted_at;

  ScreeningTestAnswerModel({
    this.id,
    this.questionPart,
    this.area,
    this.questionId,
    this.answer,
    this.created_at,
    this.deleted_at,
  });

  factory ScreeningTestAnswerModel.fromAnswer(Answer answer) {
    return ScreeningTestAnswerModel(
      questionPart: answer.questionPart,
      area: ScreeningDiagnoseService.fromThai[answer.area]?.name,
      questionId: answer.questionId,
      answer: answer.answer,
    );
  }

  factory ScreeningTestAnswerModel.fromPostureAnswer(PostureAnswer answer) {
    return ScreeningTestAnswerModel(
      questionPart: 4,
      area: ScreeningDiagnoseService.fromThai[answer.title]?.name,
      questionId: answer.questionId,
      answer: answer.answer,
    );
  }

  factory ScreeningTestAnswerModel.fromMap(Map<String, dynamic> data) =>
      ScreeningTestAnswerModel(
        id: data['id'],
        questionPart: data['questionPart'],
        area: data['area'],
        questionId: data['questionId'],
        answer: data['answer'],
        created_at: DateTime.tryParse(data['created_at'] ?? ''),
        deleted_at: DateTime.tryParse(data['deleted_at'] ?? ''),
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'questionPart': questionPart,
        'area': area,
        'questionId': questionId,
        'answer': answer,
        'created_at': created_at?.toIso8601String(),
        'deleted_at': deleted_at?.toIso8601String(),
      };

  ScreeningTestAnswerModel copyWith({
    int? id,
    int? questionPart,
    String? area,
    int? questionId,
    int? answer,
    DateTime? created_at,
    DateTime? deleted_at,
  }) {
    return ScreeningTestAnswerModel(
      id: id ?? this.id,
      questionPart: questionPart ?? this.questionPart,
      area: area ?? this.area,
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
      created_at: created_at ?? this.created_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  @override
  String toString() =>
      'ScreeningTestAnswerModel(id: $id, questionPart: $questionPart, area: $area, questionId: $questionId, ans: $answer, created_at: $created_at, deleted_at: $deleted_at)';
}
