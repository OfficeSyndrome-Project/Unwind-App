import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';
import 'package:unwind_app/services/answer-service/answer_filter.dart';

void main() {
  final normalAnswer = ScreeningTestAnswerModel(isNrsScore: null);
  final normalNotNrsAnswer = ScreeningTestAnswerModel(isNrsScore: false);
  final nrsAnswer = ScreeningTestAnswerModel(isNrsScore: true);
  test('should return None', () {
    AnswerFilter answerFilter = AnswerFilter(isNrsScore: true);
    final normal = answerFilter.applyOne(normalAnswer);

    expect(normal, Option.none());
  });

  test('should return None', () {
    AnswerFilter answerFilter = AnswerFilter(isNrsScore: true);
    final normalNotNrs = answerFilter.applyOne(normalNotNrsAnswer);

    expect(normalNotNrs, Option.none());
  });

  test('should return Some', () {
    AnswerFilter answerFilter = AnswerFilter(isNrsScore: true);
    final nrs = answerFilter.applyOne(nrsAnswer);

    expect(nrs, Option.of(nrsAnswer));
  });
}
