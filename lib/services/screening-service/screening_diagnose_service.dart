import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

class Answer {
  final int questionPart;
  final String? title;
  final int questionId;
  final int answer;

  const Answer({
    required this.questionPart,
    required this.title,
    required this.questionId,
    required this.answer,
  });

  static List<Answer> updateAnswer(List<Answer> answers, Answer answer) {
    final index =
        answers.indexWhere((element) => element.isSameQuestion(answer));
    if (index == -1) {
      answers.add(answer);
      return answers;
    }
    answers[index] = answer;
    return answers;
  }

  isSameQuestion(Answer o) =>
      o.questionPart == questionPart &&
      o.title == title &&
      o.questionId == questionId;

  @override
  operator ==(o) =>
      o is Answer &&
      o.questionPart == questionPart &&
      o.title == title &&
      o.questionId == questionId &&
      o.answer == answer;

  @override
  int get hashCode =>
      questionPart.hashCode ^
      title.hashCode ^
      questionId.hashCode ^
      answer.hashCode;

  @override
  String toString() {
    return 'Answer{QuestionPart: $questionPart, title: $title, questionID: $questionId, answer: $answer}';
  }
}

class PostureAnswer {
  final String title;
  final int questionId;
  final int answer;
  PostureAnswer({
    required this.title,
    required this.questionId,
    required this.answer,
  });

  static List<PostureAnswer> updateAnswer(List<PostureAnswer> answers, PostureAnswer answer) {
    final index = answers.indexWhere((element) =>  element == answer);
    if (index == -1) {
      answers.add(answer);
      return answers;
    }
    answers[index] = answer;
    return answers;
  }

  @override
  operator ==(o) =>
      o is PostureAnswer&&
      o.title == title &&
      o.questionId == questionId ;

  @override
  int get hashCode =>
      title.hashCode ^
      questionId.hashCode;


  @override
  String toString() =>
      'PostureAnswer{title: $title, questionId: $questionId, answer: $answer}';

}

class ShowGoToDoctorPageService {
  static final Set<Answer> shouldSeeDoctor = {
    //yes = 1 , no = 2
    //part 1
    Answer(questionPart: 1, title: null, questionId: 1, answer: 2),
    Answer(questionPart: 1, title: null, questionId: 2, answer: 1),
    Answer(questionPart: 1, title: null, questionId: 3, answer: 1),
    Answer(questionPart: 1, title: null, questionId: 4, answer: 1),
    //part 2
    Answer(questionPart: 2, title: "คอ", questionId: 2, answer: 2),
    Answer(questionPart: 2, title: "คอ", questionId: 3, answer: 1),
    Answer(questionPart: 2, title: "คอ", questionId: 4, answer: 1),
    Answer(questionPart: 2, title: "คอ", questionId: 5, answer: 1),
    Answer(questionPart: 2, title: "คอ", questionId: 6, answer: 1),
    Answer(questionPart: 2, title: "บ่า", questionId: 2, answer: 2),
    Answer(questionPart: 2, title: "บ่า", questionId: 4, answer: 3),
    Answer(questionPart: 2, title: "บ่า", questionId: 4, answer: 3),
    Answer(questionPart: 2, title: "ไหล่", questionId: 2, answer: 2),
    Answer(questionPart: 2, title: "ไหล่", questionId: 4, answer: 3),
    Answer(questionPart: 2, title: "ไหล่", questionId: 4, answer: 3),
    Answer(questionPart: 2, title: "หลังส่วนบน", questionId: 2, answer: 2),
    Answer(questionPart: 2, title: "หลังส่วนบน", questionId: 3, answer: 1),
    Answer(questionPart: 2, title: "หลังส่วนล่าง", questionId: 2, answer: 2),
    Answer(questionPart: 2, title: "หลังส่วนล่าง", questionId: 3, answer: 1),
    //part 3
    Answer(questionPart: 3, title: "คอ", questionId: 2, answer: 1),
    Answer(questionPart: 3, title: "คอ", questionId: 3, answer: 1),
    Answer(questionPart: 3, title: "คอ", questionId: 4, answer: 2),
    Answer(questionPart: 3, title: "บ่า", questionId: 2, answer: 1),
    Answer(questionPart: 3, title: "บ่า", questionId: 3, answer: 1),
    Answer(questionPart: 3, title: "บ่า", questionId: 4, answer: 2),
    Answer(questionPart: 3, title: "หลังส่วนบน", questionId: 2, answer: 1),
    Answer(questionPart: 3, title: "หลังส่วนบน", questionId: 3, answer: 1),
    Answer(questionPart: 3, title: "หลังส่วนบน", questionId: 4, answer: 2),
  };

  static bool showGoToDoctorPage(
      int questionPart, String? title, int questionID, int answer) {
    return shouldSeeDoctor.contains(Answer(
        questionPart: questionPart,
        title: title,
        questionId: questionID,
        answer: answer));
  }

  static bool showGoToDoctorPageByAnswer(Answer answer) {
    return shouldSeeDoctor.contains(answer);
  }
}

enum ScreeningTitle { neck, baa, shoulder, lowerback, upperback }

enum WorkoutlistTitle { neckbaa_ch, neckbaa_th, shoulder, back_ch, back_th }

class ScreeningDiagnoseService {
  static const nrsLimit = 8;

  //static day for workoutlist
  static const days_in_four_weeks = 28;
  //function for check condition of nrs
  static bool nrs_less_than_eigth(int NRS) {
    return NRS.abs() < nrsLimit;
  }

  static bool isExceedingNrsLimit(int NRS) {
    return NRS.abs() >= nrsLimit;
  }

  // nrsExceedOf checks if any of the concerned titles has an NRS score of 8 or more
  static bool nrsExceedOf(
      List<ScreeningTitle> concernedTitles, Map<ScreeningTitle, int> nrs) {
    final List<int> nrses =
        concernedTitles.map((title) => nrs[title] ?? 0).toList();
    return nrses
        .any((score) => ScreeningDiagnoseService.isExceedingNrsLimit(score));
  }

//dictionary Title.part to thai string
  static Map<ScreeningTitle, String> toThai = {
    ScreeningTitle.neck: "คอ",
    ScreeningTitle.baa: "บ่า",
    ScreeningTitle.shoulder: "ไหล่",
    ScreeningTitle.lowerback: "หลังส่วนล่าง",
    ScreeningTitle.upperback: "หลังส่วนบน",
  };
  static Map<String, ScreeningTitle> fromThai = {
    "คอ": ScreeningTitle.neck,
    "บ่า": ScreeningTitle.baa,
    "ไหล่": ScreeningTitle.shoulder,
    "หลังส่วนล่าง": ScreeningTitle.lowerback,
    "หลังส่วนบน": ScreeningTitle.upperback,
  };

//function for test list of answer and nrs
  static bool shouldGoToDoctorByParts(
      List<Answer> answers, List<ScreeningTitle> titles) {
    final focusParts = titles
        .map((element) => toThai[element])
        .toList(); // ['คอ', 'บ่า', 'ไหล่'];
    final shouldSeeDoctorAnswers = ShowGoToDoctorPageService.shouldSeeDoctor
        .where((element) => focusParts.contains(element.title))
        .toList(); // [Answer] ที่ title อยู่ใน focusParts

    for (var answer in answers) {
      if (shouldSeeDoctorAnswers.contains(answer)) {
        return true;
      }
    }
    return false;
  }

  static Future<List<WorkoutlistTitle>> diagnose(
      List<Answer> answers, Map<ScreeningTitle, int?> nrs) async {
    // filter answer ว่าเป็นคอบ่าไหล่ ที่ต้องหาหมอไหม
    List<ScreeningTitle> titleNeckBaaShoulder = [
      ScreeningTitle.neck,
      ScreeningTitle.baa,
      ScreeningTitle.shoulder
    ];
    if (shouldGoToDoctorByParts(answers, titleNeckBaaShoulder)) {
      nrs.remove(ScreeningTitle.neck);
      nrs.remove(ScreeningTitle.baa);
      nrs.remove(ScreeningTitle.shoulder);
    }

    // filter answer ว่าเป็นหลังส่วนบน หลังส่วนล่าง ที่ต้องหาหมอไหม
    List<ScreeningTitle> titleUpperbackLowerback = [
      ScreeningTitle.upperback,
      ScreeningTitle.lowerback
    ];
    if (shouldGoToDoctorByParts(answers, titleUpperbackLowerback)) {
      nrs.remove(ScreeningTitle.upperback);
      nrs.remove(ScreeningTitle.lowerback);
    }

    print(nrs);
    final List<WorkoutlistTitle> workoutList = [];
    //loop nrs ทีละอัน
    nrs.forEach((key, value) {
      //check if nrs is null then cancel this part
      if (value == null) {
        return;
      }
      //filter nrs by checkNRS (if nrs>=8 then cancel this part)
      if (nrs_less_than_eigth(value)) {
        print("key : $key , value : $value");
        //filter answers by title (which is nrs < 8)
        final ans_of_title =
            answers.where((element) => element.title == toThai[key]).toList();
        print(ans_of_title);

        ans_of_title.forEach((element) {
          //filter gotodoctor
          if (ShowGoToDoctorPageService.showGoToDoctorPage(element.questionPart,
              element.title, element.questionId, element.answer)) {
            print("key : $key , value : $value");
            print("element : $element");
            return;
          }
          //give workout list
          // workoutList.add(convertToWorkoutlistTittle(key));
          workoutList.addAll(workoutListsFromScreeningTitle(key));
        });
      }
      workoutList.toSet().toList();
    });

    //insert workoutlist to db
    final workout_days = Give_Workoutlist_Per_Day(workoutList);
    WorkoutListDB wl_db = WorkoutListDB(serviceLocator());
    for (var workoutlist_title in workout_days.entries) {
      final there_is_workoutlist = await wl_db
          .checkIfThereIsWorkoutListTitles(workoutlist_title.key.name);
      if (there_is_workoutlist) {
        continue;
      }
      for (var workout in workoutlist_title.value) {
        wl_db.insertWorkoutList(workout);
      }
    }

    return workoutList;
  }

  static workoutListsFromScreeningTitle(ScreeningTitle screeningTitle) {
    switch (screeningTitle) {
      case ScreeningTitle.neck:
        return [
          WorkoutlistTitle.neckbaa_ch,
          WorkoutlistTitle.neckbaa_th,
        ];
      case ScreeningTitle.baa:
        return [
          WorkoutlistTitle.neckbaa_ch,
          WorkoutlistTitle.neckbaa_th,
        ];
      case ScreeningTitle.shoulder:
        return [
          WorkoutlistTitle.shoulder,
        ];
      case ScreeningTitle.lowerback:
        return [
          WorkoutlistTitle.back_ch,
          WorkoutlistTitle.back_th,
        ];
      case ScreeningTitle.upperback:
        return [
          WorkoutlistTitle.back_ch,
          WorkoutlistTitle.back_th,
        ];
    }
  }

  //function give workoutlist per day
  static Map<WorkoutlistTitle, List<WorkoutListModel>> Give_Workoutlist_Per_Day(
      List<WorkoutlistTitle> workoutList) {
    Map<WorkoutlistTitle, List<WorkoutListModel>> result = {};
    final DateTime now = DateTime.now();

    if (workoutList.contains(WorkoutlistTitle.neckbaa_ch)) {
      result[WorkoutlistTitle.neckbaa_ch] = GiveNeckBaaChWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.neckbaa_th)) {
      result[WorkoutlistTitle.neckbaa_th] = GiveNeckBaaThWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.shoulder)) {
      result[WorkoutlistTitle.shoulder] = GiveShoulderWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.back_ch)) {
      result[WorkoutlistTitle.back_ch] = GiveBackChWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.back_th)) {
      result[WorkoutlistTitle.back_th] = GiveBackThWorkoutlist(now);
    }
    return result;
  }

  static List<WorkoutListModel> GiveNeckBaaChWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .map((days_from_now) => WorkoutListModel(
            date: now.add(Duration(days: days_from_now)),
            WOL_title: WorkoutlistTitle.neckbaa_ch.name,
            remaining_times: 3,
            total_times: 3,
            WOL_id: null,
            NRS_before: null,
            NRS_after: null))
        .toList();
  }

  static List<WorkoutListModel> GiveNeckBaaThWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .expand((days_from_now) => (days_from_now % 2 == 0)
            ? [
                WorkoutListModel(
                    date: now.add(Duration(days: days_from_now)),
                    WOL_title: WorkoutlistTitle.neckbaa_th.name,
                    remaining_times: 3,
                    total_times: 3,
                    WOL_id: null,
                    NRS_before: null,
                    NRS_after: null)
              ]
            : <WorkoutListModel>[])
        .toList();
  }

  static List<WorkoutListModel> GiveShoulderWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .map(
          (days_from_now) => WorkoutListModel(
              date: now.add(Duration(days: days_from_now)),
              WOL_title: WorkoutlistTitle.shoulder.name,
              remaining_times: 3,
              total_times: 3,
              WOL_id: null,
              NRS_before: null,
              NRS_after: null),
        )
        .toList();
  }

  static List<WorkoutListModel> GiveBackChWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .map(
          (days_from_now) => WorkoutListModel(
              date: now.add(Duration(days: days_from_now)),
              WOL_title: WorkoutlistTitle.back_ch.name,
              remaining_times: 3,
              total_times: 3,
              WOL_id: null,
              NRS_before: null,
              NRS_after: null),
        )
        .toList();
  }

  static List<WorkoutListModel> GiveBackThWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .expand((days_from_now) => (days_from_now % 2 == 0)
            ? [
                WorkoutListModel(
                    date: now.add(Duration(days: days_from_now)),
                    WOL_title: WorkoutlistTitle.back_th.name,
                    remaining_times: 3,
                    total_times: 3,
                    WOL_id: null,
                    NRS_before: null,
                    NRS_after: null)
              ]
            : <WorkoutListModel>[])
        .toList();
  }
}
