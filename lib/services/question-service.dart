import '../data/ergonomic-model.dart';

class QuestionService {
  //all of question etc get or something
  static List<ErgonomicModel> questions = ErgonomicModel.getQuestion();
  static List<ErgonomicModel> getQuestionsbyIdCategory(int idCategory) {
    return questions
        .where((question) => question.idCategory == idCategory)
        .toList();
  }

  static int getLenghtByIdCategory(int idCategory) {
    return getQuestionsbyIdCategory(idCategory).length;
  }
}
