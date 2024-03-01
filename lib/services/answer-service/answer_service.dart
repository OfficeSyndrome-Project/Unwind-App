// ignore_for_file: sdk_version_since

// import 'package:flutter/material.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/data/screening-data/typepain_screening.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';
import 'package:unwind_app/services/answer-service/answer_interpret.dart';
import 'package:unwind_app/services/answer-service/question_model_general.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class AnswerService {
  final ScreeningPartOneModel screeningPartOneModel;
  final ScreeningPartTwoSelectPart screeningPartTwoSelectPart;
  final ScreeningPartThreePostureModel screeningPartThreePostureModel;

  AnswerService({
    required this.screeningPartOneModel,
    required this.screeningPartTwoSelectPart,
    required this.screeningPartThreePostureModel,
  });

  static Map<int, String> TWO_CHOICES_ANSWER_MEANING = {
    1: 'ใช่',
    2: 'ไม่',
  };

  static Map<int, String> FOUR_CHOICES_ANSWER_MEANING = {
    1: 'ปวดหนึบๆ แน่นๆ ปวดตึงๆ',
    2: 'ปวดตื้อๆ เหมือนเป็นตะคริว',
    3: 'ปวดซ่าๆ ชาๆ จี๊ดๆ เหมือนโดนเข็มตำหรือผึ้งต่อย',
    4: 'ปวดไหม้แสบร้อน เจ็บแปล็บขึ้นทันทีทันใด',
  };

  static QuestionModelGeneral questionOf(ScreeningTestAnswerModel answer) {
    final questionPart = answer.questionPart;
    switch (questionPart) {
      case 1:
        return questionOfPartOne(answer);
      case 2:
        return questionOfPartTwo(answer);
      case 3:
        return questionOfPartThree(answer);
      case 4:
        // part 4 is actually posture questions of part 3
        return questionOfPartFour(answer);
      default:
        return QuestionModelGeneral(
          question: '',
          questionId: 0,
          questionPage: 0,
          questionPart: 0,
        );
    }
  }

  static QuestionModelGeneral questionOfPartFour(
      ScreeningTestAnswerModel answer) {
    // part 4 is actually posture questions of part 3
    final questionId = answer.questionId;
    final area = answer.area;
    final question =
        ScreeningPartThreePostureModel.getScreeningPartThreePostureModel()
            .where((element) => element.questionId == questionId)
            .firstOrNull;
    final areaThai = ScreeningDiagnoseService
        .toThai[ScreeningDiagnoseService.fromEngToScreeningTitle[area]];

    final assetPath =
        ScreeningPartThreePostureModel.getScreeningPartThreePostureModel()
            .where((element) => element.title == areaThai)
            .where((element) => element.questionId == questionId)
            .firstOrNull
            ?.assetPath;
    return QuestionModelGeneral(
      question: question?.question ?? '',
      questionId: question?.questionId ?? 0,
      questionPage: question?.questionPage ?? 0,
      questionPart: question?.questionPart ?? 0,
      questionSpecificAssetPath: assetPath ?? '',
      questionSpecificAssetName: question?.postureName ?? '',
    );
  }

  static QuestionModelGeneral questionOfPartThree(
      ScreeningTestAnswerModel answer) {
    final questionId = answer.questionId;
    final area = answer.area;
    final question =
        ScreeningPartThreeQuestionModel.getScreeningPartThreeQuestionModel()
            .where((element) => element.questionId == questionId)
            .firstOrNull;
    final areaThai = ScreeningDiagnoseService
        .toThai[ScreeningDiagnoseService.fromEngToScreeningTitle[area]];
    return QuestionModelGeneral(
      question: question?.question ?? '',
      questionId: question?.questionId ?? 0,
      questionPage: question?.questionPage ?? 0,
      questionPart: question?.questionPart ?? 0,
      area: area,
      areaThai: areaThai,
      // questionSpecificAssetName:
      //     ScreeningPartThreePostureModel.getScreeningPartThreePostureModel()
      //         .where((element) => element.title == areaThai)
      //         .where((element) => element.questionId == questionId)
      //         .firstOrNull
      //         ?.postureName,
      // questionSpecificAssetPath:
      //     ScreeningPartThreePostureModel.getScreeningPartThreePostureModel()
      //         .where((element) => element.title == areaThai)
      //         .where((element) => element.questionId == questionId)
      //         .firstOrNull
      //         ?.assetPath,
    );
  }

  static QuestionModelGeneral questionOfPartTwo(
      ScreeningTestAnswerModel answer) {
    // neck upperback and lowerback have posture on 4 uppon
    // Case of posture
    final area = answer.area;
    final areaThai = ScreeningDiagnoseService
        .toThai[ScreeningDiagnoseService.fromEngToScreeningTitle[area]];
    final questionId = answer.questionId;
    if (area == 'baa' || area == 'shoulder') {
      final question =
          ScreeningPartTwoQuestionModel.getScreeningPartTwoQuestionModel()
              .where((element) => element.questionId == questionId)
              .firstOrNull;
      return QuestionModelGeneral(
        question: question?.question ?? '',
        questionId: question?.questionId ?? 0,
        questionPage: question?.questionPage ?? 0,
        questionPart: question?.questionPart ?? 0,
        area: area,
        areaThai: areaThai,
        questionSpecificAssetPath:
            ScreeningPartTwoPostureModel.getScreeningPartTwoPostureModel()
                .where((element) => element.title == areaThai)
                .firstOrNull
                ?.assetPath,
        painTypeAssetPath: TypePainScreening.getData()
            .where((element) => element.type == areaThai)
            .firstOrNull
            ?.assetPath,
      );
    }

    // Non posture
    if (questionId == 1 || questionId == 2) {
      final question =
          ScreeningPartTwoQuestionModel.getScreeningPartTwoQuestionModel()
              .where((element) => element.questionId == questionId)
              .firstOrNull;
      return QuestionModelGeneral(
        question: question?.question ?? '',
        questionId: question?.questionId ?? 0,
        questionPage: question?.questionPage ?? 0,
        questionPart: question?.questionPart ?? 0,
        area: area,
        areaThai: areaThai,
        painTypeAssetPath: TypePainScreening.getData()
            .where((element) => element.type == areaThai)
            .firstOrNull
            ?.assetPath,
        // No question specific asset path
      );
    }

    // PostureQuestion
    final posture =
        ScreeningPartTwoPostureModel.getScreeningPartTwoPostureModel()
            .where((element) => element.questionId == questionId)
            .firstOrNull;
    return QuestionModelGeneral(
      question: posture?.question ?? '',
      questionId: posture?.questionId ?? 0,
      questionPage: posture?.questionPage ?? 0,
      questionPart: posture?.questionPart ?? 0,
      area: area,
      areaThai: areaThai,
      painTypeAssetPath: TypePainScreening.getData()
          .where((element) => element.type == areaThai)
          .firstOrNull
          ?.assetPath,
      questionSpecificAssetPath:
          ScreeningPartTwoPostureModel.getScreeningPartTwoPostureModel()
              .where((posture) => posture.title == areaThai)
              .where((posture) => posture.questionId == questionId)
              .firstOrNull
              ?.assetPath,
      questionSpecificAssetName:
          ScreeningPartTwoPostureModel.getScreeningPartTwoPostureModel()
              .where((posture) => posture.title == areaThai)
              .where((posture) => posture.questionId == questionId)
              .firstOrNull
              ?.postureName,
    );
  }

  static QuestionModelGeneral questionOfPartOne(
      ScreeningTestAnswerModel answer) {
    final question = ScreeningPartOneModel.getScreeningPartOneModel()
        .where((element) => element.questionId == answer.questionId)
        .firstOrNull;
    return QuestionModelGeneral(
      question: question?.question ?? '',
      questionId: question?.questionId ?? 0,
      questionPage: question?.questionPage ?? 0,
      questionPart: question?.questionPart ?? 0,
      // No question specific asset path
      // No pain type asset path
    );
  }

  static AnswerInterpret interpret(ScreeningTestAnswerModel answer) {
    final questionPart = answer.questionPart;
    final questionId = answer.questionId;
    final area = answer.area;
    switch (questionPart) {
      case 1:
        return AnswerInterpret(
          // answer: question?.question ?? '',
          answer: answer.answer,
          text: TWO_CHOICES_ANSWER_MEANING[answer.answer] ?? '',
        );
      case 2:
        if ((area == 'shoulder' || area == 'baa') && questionId == 4) {
          return AnswerInterpret(
            answer: answer.answer,
            text: FOUR_CHOICES_ANSWER_MEANING[answer.answer] ?? '',
          );
        }
        return AnswerInterpret(
          answer: answer.answer,
          text: TWO_CHOICES_ANSWER_MEANING[answer.answer] ?? '',
        );
      case 3:
        return AnswerInterpret(
          answer: answer.answer,
          text: TWO_CHOICES_ANSWER_MEANING[answer.answer] ?? '',
        );
      case 4: // Posture
        return AnswerInterpret(
          answer: answer.answer,
          text: TWO_CHOICES_ANSWER_MEANING[answer.answer] ?? '',
        );
      default:
        return AnswerInterpret(
          text: '',
        );
    }
  }
}
