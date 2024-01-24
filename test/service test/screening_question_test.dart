import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/data/screening-data/screening_q_page.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

void main() {
  group('Test screening question (Part 1)', () {
    test('get all question ID', () {
      var allQuestionIds = ScreeningPartOneModel.getScreeningPartOneModel()
          .map((question) => question.questionId)
          .toSet()
          .toList();
      var serviceQuestionIds =
          ScreeningQuestionPartOneService.getAllQuestionId();
      expect(serviceQuestionIds, allQuestionIds);
    });
    test('unique question ID (id ต้องไม่ซ้ำกัน)', () {
      var uniqueIds = ScreeningQuestionPartOneService.getAllQuestionId();
      var isUnique = Set<int>.from(uniqueIds).length == uniqueIds.length;
      expect(isUnique, true);
    });

////////////////////////////////////// NOTE ////////////////////////////////////////
//NOTE : ไม่สามารถเช็ค actualPages == expectedPages ได้โดยตรง
//(เนื่องจากเป็น Instance of 'ScreeningQPage') จึงเช็คเป็น .length
    test('get ScreeningQPage objects (ScreeningQPage ใน data)', () {
      var expectedPages = ScreeningQPage.getScreeningQPage();
      var actualPages = ScreeningQuestionPartOneService.getAllQuestionPage();
      expect(actualPages, isList);
      expect(actualPages.length, equals(expectedPages.length));
      // print(actualPages.lenght);
      // print(expectedPages.length);
    });
////////////////////////////////////// NOTE ////////////////////////////////////////
    test('get questions by page', () {
      var pageCheck = 1;
      var expectedQuestions = ScreeningPartOneModel.getScreeningPartOneModel()
          .where((question) => question.questionPage == pageCheck)
          .map((question) => question.question)
          .toList();
      var actualQuestions =
          ScreeningQuestionPartOneService.getQuestionsByPage(pageCheck);
      expect(actualQuestions, isList);
      expect(actualQuestions, expectedQuestions);
      // print(actualQuestions);
      // print(expectedQuestions);
    });
  });

  group('Test screening question (Part 2)', () {
    test('choices (title question page)', () {
      expect(ScreeningQuestionPartTwoService.choices, isNotNull);
      expect(ScreeningQuestionPartTwoService.choices,
          isA<List<ScreeningPartTwoSelectPart>>());
      expect(ScreeningQuestionPartTwoService.choices, isNotEmpty);
    });

    test('questions', () {
      expect(ScreeningQuestionPartTwoService.questions, isNotNull);
      expect(ScreeningQuestionPartTwoService.questions,
          isA<List<ScreeningPartTwoQuestionModel>>());
      expect(ScreeningQuestionPartTwoService.questions, isNotEmpty);
    });

    test('posture', () {
      expect(ScreeningQuestionPartTwoService.posture, isNotNull);
      expect(ScreeningQuestionPartTwoService.posture,
          isA<List<ScreeningPartTwoPostureModel>>());
      expect(ScreeningQuestionPartTwoService.posture, isNotEmpty);
    });

    test('get models by list of part', () {
      var parts = ['คอ', 'บ่า', 'ไหล่'];
      var result =
          ScreeningQuestionPartTwoService.getScreeningPartTwoModelByListOfParts(
              parts);
      expect(result.length, parts.length);
    });

    test('get questions by page', () {
      var Testquestion = [
        ScreeningPartTwoQuestionModel(
          topic: "ทดสอบ",
          question: "การทำงานของ getQuestionsByPage ถูกต้องหรือไม่ ?",
          questionPage: 1,
          questionType: "a",
          questionId: 1,
        ),
      ];
      var questionPage = 1;
      var actualQuestion = ScreeningQuestionPartTwoService.getQuestionsByPage(
          Testquestion, questionPage);
      expect(actualQuestion, isList);
      expect(actualQuestion, isA<List<ScreeningPartTwoQuestionModel>>());
      expect(actualQuestion, equals(Testquestion));
    });

    test('get postures by page', () {
      var testPosture = [
        ScreeningPartTwoPostureModel(
            title: "ทดสอบ",
            postureName: "ท่าทดสอบ 1",
            assetPath: "1",
            question: "การทำงานของ getPostureByPage ถูกต้องหรือไม่ ?",
            questionPage: 1,
            questionType: "a",
            questionId: 1),
        ScreeningPartTwoPostureModel(
            title: "ทดสอบ",
            postureName: "ท่าทดสอบ 2",
            assetPath: "2",
            question: "การทำงานของ getPostureByPage ถูกต้องหรือไม่ ?",
            questionPage: 2,
            questionType: "a",
            questionId: 2),
      ];
      var questionPage = 2;
      var actualPosture = ScreeningQuestionPartTwoService.getPostureByPage(
          testPosture, questionPage);
      expect(actualPosture, isList);
      expect(actualPosture, isA<List<ScreeningPartTwoPostureModel>>());
      expect(
          actualPosture,
          equals(testPosture
              .where((posture) => posture.questionPage == questionPage)
              .toList()));
      // print(actualPosture);
    });

    test('get model by part', () {
      var selectedPart = 'คอ';
      var actualPart = ScreeningQuestionPartTwoService
          .getScreeningPartTwoModelBySelectedPart(selectedPart);
      expect(actualPart.selectedPart.title, selectedPart);
      expect(actualPart.questions, isNotEmpty);
      expect(actualPart.postures, isNotEmpty);
      // print(actualPart);
    });
  });

  group('Test screening question (Part 3)', () {
    /////ยังไม่เสร็จ/////
  });
}
