import 'package:fpdart/fpdart.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';

class AnswerFilter {
  final bool? isNrsScore;

  const AnswerFilter({this.isNrsScore});

  List<ScreeningTestAnswerModel> apply(List<ScreeningTestAnswerModel> answers) {
    return answers.where(nrsIs(isNrsScore)).toList();
  }

  Option<ScreeningTestAnswerModel> applyOne(ScreeningTestAnswerModel answer) {
    final Option<ScreeningTestAnswerModel> result = apply([answer]).firstOption;
    return result;
  }

  bool Function(ScreeningTestAnswerModel) nrsIs(bool? isNrsScore) {
    if (isNrsScore == null) {
      // If the filter is null, return true for all answers
      return (answer) => true;
    }

    if (isNrsScore == true) {
      // If the filter is true, return true for all answers that are NRS scores
      return (answer) => answer.isNrsScore == true;
    }

    // Otherwise return true for all answers that are not NRS scores (false and null)
    return (answer) => answer.isNrsScore == false || answer.isNrsScore == null;
  }
}
