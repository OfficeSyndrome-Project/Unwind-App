import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

/// If true, the button will be enabled even if not all questions are answered
/// Use for debugging
//TODO skip for screening
const bool alwaysUnlockButton = false;

enum ScreeningPart { one, two, three }

/// Check if all questions in the page are answered
bool isAllQuestionAnswered(
    ScreeningPart part, int currentPage, List<Answer> answers) {
  switch (part) {
    case ScreeningPart.one:
      return ScreeningQuestionPartOneService.getQuestionsByPage(currentPage + 1)
          .every((element) => answers
              .where((answer) => answer.questionId == element.questionId)
              .isNotEmpty);
    default:
      return true;
  }
}
