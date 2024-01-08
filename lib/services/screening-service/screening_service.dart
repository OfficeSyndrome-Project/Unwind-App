import 'package:unwind_app/data/screening-data/screening_q_page.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';

//screening part one
class ScreeningQuestionPartOneService {
  static List<ScreeningPartOneModel> questions =
      ScreeningPartOneModel.getScreeningPartOneModel();
  static List<ScreeningQPage> pages = ScreeningQPage.getScreeningQPage();

  //get all qId
  static List<int> getAllQuestionId() {
    return questions.map((question) => question.questionId).toSet().toList();
  }

  //get all qPage
  static List<ScreeningQPage> getAllQuestionPage() {
    return pages;
  }

  //map question to page
  static List<String> getQuestionsByPage(int questionPage) {
    var result = questions
        .where((question) => question.questionPage == questionPage)
        .map((question) => question.question)
        .toList();
    // .toString();
    // print(result);
    return result;
  }
}

///
///  วิธีเล่น
/// testServiceScreeningPartTwo();
/// void testServiceScreeningPartTwo() {
///   var selectedPart = "ไหล่";
///   ScreeningPartTwoModel result = ScreeningQuestionPartTwoService.getScreeningPartTwoModelBySelectedPart(selectedPart);
///   var selectPart = result.selectedPart;
///   var postures = result.postures;
///   var questions = result.questions;
///
///   print("---เลือกส่วนที่ต้องการตรวจ $selectedPart");
///   print("assetPath: ${selectPart.assetPath}");
///   print("questionPage: ${selectPart.questionPage}");
///   print("questionType: ${selectPart.questionType}");
///   print("title: ${selectPart.title}");
///
///   print("---มีคำถาม type a = ${questions.length} คำถาม");
///   for(var question in questions) {
///     print("  question: ${question.question}");
///     print("  questionId: ${question.questionId}");
///     print("  questionPage: ${question.questionPage}");
///     print("  questionType: ${question.questionType}");
///   }
///
///   print("---มีท่าเช็ค posture = ${postures.length} ท่า");
///   for(var posture in postures) {
///     print("  assetPath: ${posture.assetPath}");
///     print("  postureName: ${posture.postureName}");
///     print("  question: ${posture.question}");
///     print("  questionId: ${posture.questionId}");
///     print("  questionPage: ${posture.questionPage}");
///     print("  questionType: ${posture.questionType}");
///     print("  title: ${posture.title}");
///   }
//screening part two
class ScreeningQuestionPartTwoService {
  //all choice
  static List<ScreeningPartTwoSelectPart> choices =
      ScreeningPartTwoSelectPart.getTitleQPage();
  //question data model
  static List<ScreeningPartTwoQuestionModel> questions =
      ScreeningPartTwoQuestionModel.getScreeningPartTwoQuestionModel();
  //posture check data model
  static List<ScreeningPartTwoPostureModel> posture =
      ScreeningPartTwoPostureModel.getScreeningPartTwoPostureModel();

  //get list of ScreeningPartTwoModel
  static List<ScreeningPartTwoModel> getScreeningPartTwoModelByListOfParts(
      List<String> parts) {
    List<ScreeningPartTwoModel> result = [];
    for (var part in parts) {
      result.add(getScreeningPartTwoModelBySelectedPart(part));
    }
    return result;
  }

  //filter question by page
  static List<ScreeningPartTwoQuestionModel> getQuestionsByPage(
      List<ScreeningPartTwoQuestionModel> questions, int questionPage) {
    // print(
    //     'object : ${questions.where((question) => question.questionPage == questionPage).toList()}');
    return questions
        .where((question) => question.questionPage == questionPage)
        .toList();
  }

  static List<ScreeningPartTwoPostureModel> getPostureByPage(
      List<ScreeningPartTwoPostureModel> questions, int questionPage) {
    return questions
        .where((posture) => posture.questionPage == questionPage)
        .toList();
  }

  //get object
  static ScreeningPartTwoModel getScreeningPartTwoModelBySelectedPart(
      String selectedPart) {
    ScreeningPartTwoSelectPart selectedChoice =
        choices.where((choice) => choice.title == selectedPart).first;
    var questions =
        ScreeningPartTwoQuestionModel.getScreeningPartTwoQuestionModel()
            .where((q) => q.questionType == selectedChoice.questionType)
            .toList();
    var postures =
        ScreeningPartTwoPostureModel.getScreeningPartTwoPostureModel()
            .where((p) => p.title == selectedChoice.title)
            .toList();
    return ScreeningPartTwoModel(
        selectedPart: selectedChoice, questions: questions, postures: postures);
  }
}

//screening part three
class ScreeningQuestionPartThreeService {
  // //all choice
  // static List<ScreeningPartThreeSelectPart> choices =
  //     ScreeningPartTwoSelectPart.getTitleQPage();
  static List<ScreeningPartThreePostureModel> posture =
      ScreeningPartThreePostureModel.getScreeningPartThreePostureModel();
  static List<ScreeningPartThreeQuestionModel> question =
      ScreeningPartThreeQuestionModel.getScreeningPartThreeQuestionModel();

  static List<String> getAllPartTitle =
      posture.map((part) => part.title).toSet().toList();
  //get list of ScreeningPartThreeModel
  static List<ScreeningPartThreeModel> getScreeningPartThreeModelByListOfParts(
      List<String> parts) {
    List<ScreeningPartThreeModel> result = [];

    for (var part in parts) {
      result.add(getScreeningPartThreeModelBySelectedPart(part));
    }
    return result;
  }

  //filter posture,question by page
  static List<ScreeningPartThreeQuestionModel> getQuestionsByPage(
      List<ScreeningPartThreeQuestionModel> questions, int questionPage) {
    return questions
        .where((question) => question.questionPage == questionPage)
        .toList();
  }

  static List<ScreeningPartThreePostureModel> getPostureByPage(
      List<ScreeningPartThreePostureModel> postures, int questionPage) {
    return postures
        .where((posture) => posture.questionPage == questionPage)
        .toList();
  }

  //get object
  static ScreeningPartThreeModel getScreeningPartThreeModelBySelectedPart(
      String selectedPart) {
    ScreeningPartThreePostureModel selectedChoice =
        posture.where((choice) => choice.title == selectedPart).first;

    print('selectedPart : ${selectedPart}');
    var postures =
        ScreeningPartThreePostureModel.getScreeningPartThreePostureModel()
            .where((q) => q.title == selectedChoice.title)
            .toList();
    var questions =
        ScreeningPartThreeQuestionModel.getScreeningPartThreeQuestionModel()
            .where((p) => p.questionType == selectedChoice.questionType)
            .toList();
    return ScreeningPartThreeModel(questions: questions, postures: postures);
  }
}
