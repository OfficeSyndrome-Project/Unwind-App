// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/data/screening-data/screening_q_page.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';
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
    });
////////////////////////////////////// NOTE ////////////////////////////////////////
    test('get questions by page', () {
      var pageCheck = 1;
      var expectedQuestions = ScreeningPartOneModel.getScreeningPartOneModel()
          .where((question) => question.questionPage == pageCheck)
          .map((question) => question.question)
          .toList();
      var actualQuestions =
          ScreeningQuestionPartOneService.getQuestionsByPage(pageCheck)
              .map((question) => question.question)
              .toList();
      expect(actualQuestions, isList);
      expect(actualQuestions, expectedQuestions);
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
          questionPart: 2,
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
            questionPart: 2,
            questionId: 1),
        ScreeningPartTwoPostureModel(
            title: "ทดสอบ",
            postureName: "ท่าทดสอบ 2",
            assetPath: "2",
            question: "การทำงานของ getPostureByPage ถูกต้องหรือไม่ ?",
            questionPage: 2,
            questionType: "a",
            questionPart: 2,
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
    });

    test('get model by part', () {
      var selectedPart = 'คอ';
      var actualPart = ScreeningQuestionPartTwoService
          .getScreeningPartTwoModelBySelectedPart(selectedPart);
      // debugPrint('selectedPart : $selectedPart');
      expect(actualPart.selectedPart.title, selectedPart);
      expect(actualPart.questions, isNotEmpty);
      expect(actualPart.postures, isNotEmpty);
    });
  });

  group('Test screening question (Part 3)', () {
    test('postures', () {
      var result = ScreeningQuestionPartThreeService.posture;
      expect(result, isA<List<ScreeningPartThreePostureModel>>());
    });

    test('questions', () {
      var result = ScreeningQuestionPartThreeService.question;
      expect(result, isA<List<ScreeningPartThreeQuestionModel>>());
    });

    test('get all part title', () {
      var postures = [
        ScreeningPartThreePostureModel(
            title: "คอ",
            postureName: "ท่าก้ม-เงยคอ",
            assetPath: "lib/assets/images/screeningPart/neck_bend_tilt.png",
            question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
            questionId: 7,
            questionPage: 0,
            questionPart: 2,
            questionType: "a"),
        ScreeningPartThreePostureModel(
            title: "คอ",
            postureName: "ท่าหันซ้าย-ขวา",
            assetPath: "lib/assets/images/screeningPart/neck_turn_lr.png",
            question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
            questionId: 8,
            questionPage: 1,
            questionPart: 2,
            questionType: "a"),
        ScreeningPartThreePostureModel(
            title: "บ่า",
            postureName: "ท่าเอนคอ",
            assetPath: "lib/assets/images/screeningPart/neck_lean.png",
            question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
            questionId: 5,
            questionPage: 2,
            questionPart: 2,
            questionType: "a"),
        ScreeningPartThreePostureModel(
            title: "หลังส่วนล่าง",
            postureName: "ท่าเหยียดลำตัวไปด้านหลัง",
            assetPath: "lib/assets/images/screeningPart/back_plank.png",
            question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
            questionId: 4,
            questionPage: 3,
            questionPart: 2,
            questionType: "a"),
        ScreeningPartThreePostureModel(
            title: "หลังส่วนล่าง",
            postureName: "ท่างอลำตัวมาด้านหน้า",
            assetPath: "lib/assets/images/screeningPart/back_turtle.png",
            question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
            questionId: 4,
            questionPage: 4,
            questionPart: 2,
            questionType: "a"),
      ];
      var result = ScreeningQuestionPartThreeService.getAllPartTitle;
      expect(result, isA<List<String>>());
      expect(result.isNotEmpty, isTrue);
      expect(
          result, equals(postures.map((part) => part.title).toSet().toList()));
    });

    test('get models by list of part', () {
      var parts = ["คอ", "บ่า", "หลังส่วนล่าง"]; // Example input
      var result = ScreeningQuestionPartThreeService
          .getScreeningPartThreeModelByListOfParts(parts);
      expect(result, isA<List<ScreeningPartThreeModel>>());
      expect(result.isNotEmpty, isTrue);
      expect(result.length, parts.length);
    });

    test('get questions by page', () {
      var questions = [
        ScreeningPartThreeQuestionModel(
          title: ["คอ", "บ่า", "หลังส่วนล่าง"],
          question: "คุณมีอาการปวดบริเวณนี้มาก่อนหรือไม่ ?",
          questionId: 1,
          questionPage: 1,
          questionPart: 2,
          questionType: "a",
        ),
      ];
      var questionPage = 1;
      var result = ScreeningQuestionPartThreeService.getQuestionsByPage(
          questions, questionPage);
      expect(result.length, greaterThan(0));
      expect(result.every((question) => question.questionPage == questionPage),
          isTrue);
    });

    test('get posture by page', () {
      var postures = [
        ScreeningPartThreePostureModel(
          title: "คอ",
          postureName: "ท่าก้ม-เงยคอ",
          assetPath: "lib/assets/images/screeningPart/neck_bend_tilt.png",
          question: "ท่านมีอาการเจ็บ ปวด ชา ร้าว ระหว่างทำหรือไม่ ?",
          questionId: 7,
          questionPage: 0,
          questionPart: 2,
          questionType: "a",
        ),
      ];
      var questionPage = 0;
      var result = ScreeningQuestionPartThreeService.getPostureByPage(
          postures, questionPage);
      expect(result.length, greaterThan(0));
      expect(result.every((posture) => posture.questionPage == questionPage),
          isTrue);
    });

    test('get model by part', () {
      var selectedPart = "คอ";
      var results = ScreeningQuestionPartThreeService
          .getScreeningPartThreeModelBySelectedPart(selectedPart);
      expect(results, isA<ScreeningPartThreeModel>());
      expect(results.questions, isA<List<ScreeningPartThreeQuestionModel>>());
      expect(results.postures, isA<List<ScreeningPartThreePostureModel>>());
      expect(results.questions.isNotEmpty, isTrue);
      expect(results.postures.isNotEmpty, isTrue);
      expect(
          results.questions
              .every((question) => question.title.contains(selectedPart)),
          isTrue);
      expect(results.postures.every((posture) => posture.title == selectedPart),
          isTrue);
    });
  });
}
