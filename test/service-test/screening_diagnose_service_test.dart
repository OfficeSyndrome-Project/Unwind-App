import 'package:flutter_test/flutter_test.dart';
// import 'package:unwind_app/data/screening-data/workout_data.dart';
// import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

void main() {
  group('Test ShowGoToDoctorPage Service', () {
    test('check true answers', () {
      expect(
        ShowGoToDoctorPageService.showGoToDoctorPage(1, null, 1, 2),
        true,
      );
      expect(
        ShowGoToDoctorPageService.showGoToDoctorPage(1, null, 1, 1),
        false,
      );
    });
    test('go to doctor page by answers', () {
      expect(
        ShowGoToDoctorPageService.showGoToDoctorPageByAnswer(
          Answer(questionPart: 1, area: null, questionId: 1, answer: 2),
        ),
        true,
      );
      expect(
        ShowGoToDoctorPageService.showGoToDoctorPageByAnswer(
          Answer(questionPart: 1, area: null, questionId: 1, answer: 1),
        ),
        false,
      );
    });
  });

  group('Test ScreeningDiagnose Service', () {
    test('isNeckSetToDoctor return true', () {
      final answers = [
        Answer(questionPart: 1, area: null, questionId: 1, answer: 2),
      ];
      final nrs = {
        ScreeningTitle.neck: 9,
      };
      expect(
        ScreeningDiagnoseService.isNeckSetToDoctor(answers, nrs),
        true,
      );
    });

    test('isNeckSetToDoctor return false', () {
      final answers = [
        Answer(questionPart: 1, area: null, questionId: 1, answer: 1),
      ];
      final nrs = {
        ScreeningTitle.neck: 5,
      };
      expect(
        ScreeningDiagnoseService.isNeckSetToDoctor(answers, nrs),
        false,
      );
    });

    test('isBackSetToDoctor return true', () {
      final answers = [
        Answer(questionPart: 1, area: null, questionId: 1, answer: 2),
      ];
      final nrs = {
        ScreeningTitle.upperback: 9,
      };
      expect(
        ScreeningDiagnoseService.isBackSetToDoctor(answers, nrs),
        true,
      );
    });

    test('isBackSetToDoctor return false', () {
      final answers = [
        Answer(questionPart: 1, area: null, questionId: 1, answer: 1),
      ];
      final nrs = {
        ScreeningTitle.upperback: 5,
      };
      expect(
        ScreeningDiagnoseService.isBackSetToDoctor(answers, nrs),
        false,
      );
    });
  });
}
