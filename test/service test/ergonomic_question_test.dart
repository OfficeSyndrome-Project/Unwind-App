import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';
import 'package:unwind_app/services/ergonomics-service/question_service.dart';

void main() {
  group('Test ergonomic questions', () {
    test('list of ErgonomicModel', () {
      const int testCategoryId = 1;
      final List<ErgonomicModel> result =
          QuestionService.getQuestionsByIdCategory(testCategoryId);
      expect(result, isA<List<ErgonomicModel>>());
    });

    test('length (Number of questions in idCategory)', () {
      const int testCategoryId = 1;
      final int result = QuestionService.getLenghtByIdCategory(testCategoryId);
      expect(result, equals(5));
    });

    test('list of integers', () {
      final List<int> result = QuestionService.getAllIdCategory();
      expect(result, isA<List<int>>());
    });

    test('category type', () {
      const int testCategoryId = 1;
      final String result = QuestionService.getTypeByIdCategory(testCategoryId);
      expect(result, equals('ท่าทาง'));
    });
  });
}
