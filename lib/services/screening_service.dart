import 'package:unwind_app/data/screening-data/screening_q_page.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';

class ScreeningQuestionService {
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

    //get type of question
  }
}
