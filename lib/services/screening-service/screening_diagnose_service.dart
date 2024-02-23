import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

class Answer {
  final int questionPart;
  final String? area;
  final int questionId;
  final int answer;

  const Answer({
    required this.questionPart,
    required this.area,
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
      o.area == area &&
      o.questionId == questionId;

  @override
  operator ==(o) =>
      o is Answer &&
      o.questionPart == questionPart &&
      o.area == area &&
      o.questionId == questionId &&
      o.answer == answer;

  @override
  int get hashCode =>
      questionPart.hashCode ^
      area.hashCode ^
      questionId.hashCode ^
      answer.hashCode;

  @override
  String toString() {
    return 'Answer{QuestionPart: $questionPart, title: $area, questionID: $questionId, answer: $answer}';
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

  static List<PostureAnswer> updateAnswer(
      List<PostureAnswer> answers, PostureAnswer answer) {
    final index = answers.indexWhere((element) => element == answer);
    if (index == -1) {
      answers.add(answer);
      return answers;
    }
    answers[index] = answer;
    return answers;
  }

  @override
  operator ==(o) =>
      o is PostureAnswer && o.title == title && o.questionId == questionId;

  @override
  int get hashCode => title.hashCode ^ questionId.hashCode;

  @override
  String toString() =>
      'PostureAnswer{title: $title, questionId: $questionId, answer: $answer}';
}

class ShowGoToDoctorPageService {
  static final Set<Answer> shouldSeeDoctor = {
    //yes = 1 , no = 2
    //part 1
    Answer(questionPart: 1, area: null, questionId: 1, answer: 2),
    Answer(questionPart: 1, area: null, questionId: 2, answer: 1),
    Answer(questionPart: 1, area: null, questionId: 3, answer: 1),
    Answer(questionPart: 1, area: null, questionId: 4, answer: 1),
    //part 2
    Answer(questionPart: 2, area: "คอ", questionId: 2, answer: 2),
    Answer(questionPart: 2, area: "คอ", questionId: 3, answer: 1),
    Answer(questionPart: 2, area: "คอ", questionId: 4, answer: 1),
    Answer(questionPart: 2, area: "คอ", questionId: 5, answer: 1),
    Answer(questionPart: 2, area: "คอ", questionId: 6, answer: 1),
    Answer(questionPart: 2, area: "บ่า", questionId: 2, answer: 2),
    Answer(questionPart: 2, area: "บ่า", questionId: 4, answer: 3),
    Answer(questionPart: 2, area: "บ่า", questionId: 4, answer: 3),
    Answer(questionPart: 2, area: "ไหล่", questionId: 2, answer: 2),
    Answer(questionPart: 2, area: "ไหล่", questionId: 4, answer: 3),
    Answer(questionPart: 2, area: "ไหล่", questionId: 4, answer: 3),
    Answer(questionPart: 2, area: "หลังส่วนบน", questionId: 2, answer: 2),
    Answer(questionPart: 2, area: "หลังส่วนบน", questionId: 3, answer: 1),
    Answer(questionPart: 2, area: "หลังส่วนล่าง", questionId: 2, answer: 2),
    Answer(questionPart: 2, area: "หลังส่วนล่าง", questionId: 3, answer: 1),
    //part 3
    Answer(questionPart: 3, area: "คอ", questionId: 2, answer: 1),
    Answer(questionPart: 3, area: "คอ", questionId: 3, answer: 1),
    Answer(questionPart: 3, area: "คอ", questionId: 4, answer: 2),
    Answer(questionPart: 3, area: "บ่า", questionId: 2, answer: 1),
    Answer(questionPart: 3, area: "บ่า", questionId: 3, answer: 1),
    Answer(questionPart: 3, area: "บ่า", questionId: 4, answer: 2),
    Answer(questionPart: 3, area: "หลังส่วนล่าง", questionId: 2, answer: 1),
    Answer(questionPart: 3, area: "หลังส่วนล่าง", questionId: 3, answer: 1),
    Answer(questionPart: 3, area: "หลังส่วนล่าง", questionId: 4, answer: 2),
  };

  static bool showGoToDoctorPage(
      int questionPart, String? title, int questionID, int answer) {
    return shouldSeeDoctor.contains(Answer(
        questionPart: questionPart,
        area: title,
        questionId: questionID,
        answer: answer));
  }

  static bool showGoToDoctorPageByAnswer(Answer answer) {
    return shouldSeeDoctor.contains(answer);
  }
}

enum ScreeningTitle { neck, baa, shoulder, lowerback, upperback }

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
        .where((element) => focusParts.contains(element.area))
        .toList(); // [Answer] ที่ title อยู่ใน focusParts

    for (var answer in answers) {
      if (shouldSeeDoctorAnswers.contains(answer)) {
        return true;
      }
    }
    return false;
  }

  static Future<List<WorkoutListData>> diagnose(
      List<Answer> answers, Map<ScreeningTitle, int?> nrs) async {
    nrs.removeWhere((key, value) => value == null);
    Map<ScreeningTitle, int> nrsFiltered = {
      for (var entry in nrs.entries) entry.key: entry.value!
    };
    if (isNeckSetToDoctor(answers, nrsFiltered)) {
      nrsFiltered.remove(ScreeningTitle.neck);
      nrsFiltered.remove(ScreeningTitle.baa);
      nrsFiltered.remove(ScreeningTitle.shoulder);
    }
    if (isBackSetToDoctor(answers, nrsFiltered)) {
      nrsFiltered.remove(ScreeningTitle.upperback);
      nrsFiltered.remove(ScreeningTitle.lowerback);
    }

    final workouts = nrsFiltered.entries
        .expand((entry) => workoutFromScreeningTitle(entry.key))
        .toSet()
        .toList();

    // final uniqueWorkoutListTitles = workoutListTitles.toSet().toList();
    // Insert workout list to database, if there is workoutlist then skip
    // final workout_days = GenerateWorkoutListByTitle(workouts);
    await createWorkouts(workouts);

    // WorkoutListDB wl_db = serviceLocator<WorkoutListDB>();
    // for (var workoutlist_title in workout_days.entries) {
    //   final there_is_workoutlist = await wl_db
    //       .checkIfThereIsWorkoutListTitles(workoutlist_title.key.name);
    //   // if there is workoutlist then skip
    //   if (there_is_workoutlist) {
    //     continue;
    //   }
    //   for (var workout in workoutlist_title.value) {
    //     wl_db.insertWorkoutList(workout);
    //   }
    // }
    // Get workout list data
    List<WorkoutListData> acquiredWorkoutList = workouts
        .map((title) => WorkoutListData.workoutListFromTitle[title]!)
        .toList();
    return acquiredWorkoutList;
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
          WorkoutlistTitle.shoulder_ch,
          WorkoutlistTitle.shoulder_th,
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
  static Map<WorkoutlistTitle, List<WorkoutListModel>>
      GenerateWorkoutListByTitle(List<WorkoutlistTitle> workoutList) {
    Map<WorkoutlistTitle, List<WorkoutListModel>> result = {};
    final DateTime now = DateTime.now();

    if (workoutList.contains(WorkoutlistTitle.neckbaa_ch)) {
      result[WorkoutlistTitle.neckbaa_ch] = GiveNeckBaaChWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.neckbaa_th)) {
      result[WorkoutlistTitle.neckbaa_th] = GiveNeckBaaThWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.shoulder_ch)) {
      result[WorkoutlistTitle.shoulder_ch] = GiveShoulderChWorkoutlist(now);
    }
    if (workoutList.contains(WorkoutlistTitle.shoulder_th)) {
      result[WorkoutlistTitle.shoulder_th] = GiveShoulderThWorkoutlist(now);
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
            id: null,
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
                    remaining_times: 1,
                    total_times: 1,
                    id: null,
                    NRS_before: null,
                    NRS_after: null)
              ]
            : <WorkoutListModel>[])
        .toList();
  }

  static List<WorkoutListModel> GiveShoulderChWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .map(
          (days_from_now) => WorkoutListModel(
              date: now.add(Duration(days: days_from_now)),
              WOL_title: WorkoutlistTitle.shoulder_ch.name,
              remaining_times: 3,
              total_times: 3,
              id: null,
              NRS_before: null,
              NRS_after: null),
        )
        .toList();
  }

  static List<WorkoutListModel> GiveShoulderThWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .expand((days_from_now) => (days_from_now % 2 == 0)
            ? [
                WorkoutListModel(
                    date: now.add(Duration(days: days_from_now)),
                    WOL_title: WorkoutlistTitle.shoulder_th.name,
                    remaining_times: 1,
                    total_times: 1,
                    id: null,
                    NRS_before: null,
                    NRS_after: null)
              ]
            : <WorkoutListModel>[])
        .toList();
  }

  static List<WorkoutListModel> GiveBackChWorkoutlist(DateTime now) {
    return List<int>.generate(days_in_four_weeks, (index) => index)
        .map(
          (days_from_now) => WorkoutListModel(
              date: now.add(Duration(days: days_from_now)),
              WOL_title: WorkoutlistTitle.back_ch.name,
              remaining_times: 6,
              total_times: 6,
              id: null,
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
                    remaining_times: 1,
                    total_times: 1,
                    id: null,
                    NRS_before: null,
                    NRS_after: null)
              ]
            : <WorkoutListModel>[])
        .toList();
  }

  static bool isNeckSetToDoctor(
      List<Answer> answers, Map<ScreeningTitle, int>? nrs) {
    final isDoctoringOnNeckOrBaaOrShoulder =
        ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
      ScreeningTitle.neck,
      ScreeningTitle.baa,
      ScreeningTitle.shoulder,
    ]);
    final isNrsExceedingOnNeckOrBaaOrShoulder =
        ScreeningDiagnoseService.nrsExceedOf([
      ScreeningTitle.neck,
      ScreeningTitle.baa,
      ScreeningTitle.shoulder,
    ], nrs ?? {});

    return isDoctoringOnNeckOrBaaOrShoulder ||
        isNrsExceedingOnNeckOrBaaOrShoulder;
  }

  static bool isBackSetToDoctor(
      List<Answer> answers, Map<ScreeningTitle, int>? nrs) {
    final isDoctoringOnUpperBackOrLowerBack =
        ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
      ScreeningTitle.upperback,
      ScreeningTitle.lowerback,
    ]);
    final isNrsExceedingOnUpperBackOrLowerBack =
        ScreeningDiagnoseService.nrsExceedOf([
      ScreeningTitle.upperback,
      ScreeningTitle.lowerback,
    ], nrs ?? {});
    return isDoctoringOnUpperBackOrLowerBack ||
        isNrsExceedingOnUpperBackOrLowerBack;
  }

  static Future<void> createAllWorkoutList() async {
    final List<WorkoutlistTitle> workoutListTitles = [
      WorkoutlistTitle.neckbaa_ch,
      WorkoutlistTitle.neckbaa_th,
      WorkoutlistTitle.shoulder_ch,
      WorkoutlistTitle.shoulder_th,
      WorkoutlistTitle.back_ch,
      WorkoutlistTitle.back_th
    ];
    createWorkouts(workoutListTitles);
    // final workout_days = GenerateWorkoutListByTitle(workoutListTitles);
    // WorkoutListDB wl_db = WorkoutListDB(serviceLocator());
    // for (var workoutlist_title in workout_days.entries) {
    //   final there_is_workoutlist = await wl_db
    //       .checkIfThereIsWorkoutListTitles(workoutlist_title.key.name);
    //   // if there is workoutlist then skip
    //   if (there_is_workoutlist) {
    //     continue;
    //   }
    //   for (var workout in workoutlist_title.value) {
    //     wl_db.insertWorkoutList(workout);
    //   }
    // }
  }

  static Future<void> createWorkouts(List<WorkoutlistTitle> workouts) async {
    final workout_days = GenerateWorkoutListByTitle(workouts);

    WorkoutListDB wl_db = serviceLocator<WorkoutListDB>();
    for (var entry in workout_days.entries) {
      final there_is_workoutlist =
          await wl_db.checkIfThereIsWorkoutListTitles(entry.key.name);
      // if there is workoutlist then skip
      if (there_is_workoutlist) {
        continue;
      }
      /**
       * Change this, insert all workoutlist at once
       * with batch insert, and create the joint table
       * for WorkoutList and ScreeningTestAnswer
       */
      final workoutModels = entry.value;
      await Future.wait(
          workoutModels.map((workout) => wl_db.insertWorkoutList(workout)));
      // for (var workout in entry.value) {
      //   wl_db.insertWorkoutList(workout);
      // }
    }
  }

  static List<WorkoutlistTitle> workoutFromScreeningTitle(ScreeningTitle key) {
    switch (key) {
      case ScreeningTitle.neck:
        return [WorkoutlistTitle.neckbaa_ch, WorkoutlistTitle.neckbaa_th];
      case ScreeningTitle.baa:
        return [WorkoutlistTitle.neckbaa_ch, WorkoutlistTitle.neckbaa_th];
      case ScreeningTitle.shoulder:
        return [WorkoutlistTitle.shoulder_ch, WorkoutlistTitle.shoulder_th];
      case ScreeningTitle.lowerback:
        return [WorkoutlistTitle.back_ch, WorkoutlistTitle.back_th];
      case ScreeningTitle.upperback:
        return [WorkoutlistTitle.back_ch, WorkoutlistTitle.back_th];
    }
  }
}
