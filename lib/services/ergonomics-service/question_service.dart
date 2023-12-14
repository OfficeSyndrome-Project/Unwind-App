import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';

class QuestionService {
  //all of question etc get or something
  static List<ErgonomicModel> questions = ErgonomicModel.getQuestion();
  static List<ErgonomicModel> getQuestionsByIdCategory(int idCategory) {
    return questions
        .where((question) => question.idCategory == idCategory)
        .toList();
  }

  static int getLenghtByIdCategory(int idCategory) {
    return getQuestionsByIdCategory(idCategory).length;
  }

  static List<int> getAllIdCategory() {
    return questions.map((question) => question.idCategory).toSet().toList();
  }

  static String getTypeByIdCategory(int idCategory) {
    return questions
        .where((question) => question.idCategory == idCategory)
        .map((question) => question.category)
        .toSet()
        .toList()
        .first;
  }
  // static List<ErgonomicModel> get
}
