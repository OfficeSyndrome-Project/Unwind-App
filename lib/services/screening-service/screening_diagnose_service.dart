import 'package:fpdart/fpdart.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/screeningtestanswer_db.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/failure/failure.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_service.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';
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

class DiagnoseResult {
  final List<WorkoutListData> workoutList;
  final List<WorkoutListModel> workoutModels;
  DiagnoseResult({required this.workoutList, required this.workoutModels});
}

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

  static Map<String, ScreeningTitle> fromEngToScreeningTitle = {
    "shoulder": ScreeningTitle.shoulder,
    "neck": ScreeningTitle.neck,
    "baa": ScreeningTitle.baa,
    "upperback": ScreeningTitle.upperback,
    "lowerback": ScreeningTitle.lowerback,
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

  static Future<DiagnoseResult> diagnose(List<Answer> answers,
      Map<ScreeningTitle, int?> nrs, List<PostureAnswer> postureAnswer) async {
    final originalNrs = Map<ScreeningTitle, int?>.from(nrs);
    final originalNrsNotNull = Map<ScreeningTitle, int>.fromEntries(
        originalNrs.entries.where((entry) => entry.value != null).map(
            (entry) => MapEntry<ScreeningTitle, int>(entry.key, entry.value!)));
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

    // Convert answer to ScreeningTestAnswerModel
    // final screeningTestAnswerModels = answers
    //     .map((answer) => ScreeningTestAnswerModel.fromAnswer(answer))
    //     .toList();

    // Insert ScreeningTestAnswerModel to database
    // final screeningTestAnswerDB = serviceLocator<ScreeningTestAnswerDB>();
    // final insertedScreeningTestAnswerModels =
    //     await screeningTestAnswerDB.insertAll(screeningTestAnswerModels);

    // Insert and get workout list, we need to insert the joint table for ScreeningTestAnswer and WorkoutList
    final acquiredWorkoutList = await createWorkouts(workouts);

    // Insert the joint table for ScreeningTestAnswer and WorkoutList
    // final screeningTestAnswerWorkoutListService =
    //     serviceLocator<ScreeningTestAnswerWorkoutListService>();

    // Convert postureAnswer to ScreeningTestAnswerModel,

    // Store nrs score in answer table

    final eitherAnswerStored = await storeAnswer(
        answers, postureAnswer, acquiredWorkoutList, originalNrsNotNull);
    eitherAnswerStored.fold(
      (failure) => print(failure),
      (stored) => print(stored),
    );

    // await screeningTestAnswerWorkoutListService.insertAll(
    //   acquiredWorkoutList
    //       .map((workout) => insertedScreeningTestAnswerModels
    //           .whereType<ScreeningTestAnswerModel>()
    //           .map((answer) => (answer.id == null || workout.id == null)
    //               ? null
    //               : ScreeningTestAnswerWorkoutListModel(
    //                   screeningTestAnswerId: answer.id!,
    //                   workoutListId: workout.id!,
    //                 ))
    //           .toList())
    //       .expand((element) => element)
    //       .whereType<ScreeningTestAnswerWorkoutListModel>()
    //       .toList(),
    // );
    final workoutListDatas = workouts
        .map(
            (workout) => WorkoutListData.workoutListFromTitleCode[workout.name])
        .whereType<WorkoutListData>()
        .toList();

    return DiagnoseResult(
        workoutList: workoutListDatas, workoutModels: acquiredWorkoutList);
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
    // List<WorkoutListData> acquiredWorkoutList = workouts
    //     .map((title) => WorkoutListData.workoutListFromTitle[title]!)
    //     .toList();
    // return acquiredWorkoutList;
  }

  static Future<Either<Failure, int>> storeAnswer(
    List<Answer> answers,
    List<PostureAnswer> postureAnswer,
    List<WorkoutListModel> workouts,
    Map<ScreeningTitle, int> nrs,
  ) async {
    final screeningTestAnswerWorkoutListService =
        serviceLocator<ScreeningTestAnswerWorkoutListService>();
    final screeningTestAnswerDB = serviceLocator<ScreeningTestAnswerDB>();

    // Convert answer to ScreeningTestAnswerModel, in order to store to database
    final screeningTestAnswerModels = answers
        .map((answer) => ScreeningTestAnswerModel.fromAnswer(answer))
        .toList();
    // Convert postureAnswer to ScreeningTestAnswerModel, with the questionPart = 4
    final postureAnswerModels = postureAnswer
        .map((answer) => ScreeningTestAnswerModel.fromPostureAnswer(answer))
        .toList();

    // Convert nrs score to ScreeningTestAnswerModel
    final nrsScoreAnswerModels = nrs.entries
        .map((entry) => ScreeningTestAnswerModel.fromNrs(entry))
        .toList();

    // Store answers to database
    final insertedScreeningTestAnswerModels =
        await screeningTestAnswerDB.insertAll(screeningTestAnswerModels +
            postureAnswerModels +
            nrsScoreAnswerModels);

    // Insert the joint table for ScreeningTestAnswer and WorkoutList
    final associations =
        await screeningTestAnswerWorkoutListService.insertAllAssociations(
            insertedScreeningTestAnswerModels.toList(), workouts);
    return Right(associations.length);
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
      GenerateWorkoutListByTitle(
          List<WorkoutlistTitle> workoutList, DateTime startingFrom) {
    Map<WorkoutlistTitle, List<WorkoutListModel>> result = {};

    if (workoutList.contains(WorkoutlistTitle.neckbaa_ch)) {
      result[WorkoutlistTitle.neckbaa_ch] =
          GiveNeckBaaChWorkoutlist(startingFrom);
    }
    if (workoutList.contains(WorkoutlistTitle.neckbaa_th)) {
      result[WorkoutlistTitle.neckbaa_th] =
          GiveNeckBaaThWorkoutlist(startingFrom);
    }
    if (workoutList.contains(WorkoutlistTitle.shoulder_ch)) {
      result[WorkoutlistTitle.shoulder_ch] =
          GiveShoulderChWorkoutlist(startingFrom);
    }
    if (workoutList.contains(WorkoutlistTitle.shoulder_th)) {
      result[WorkoutlistTitle.shoulder_th] =
          GiveShoulderThWorkoutlist(startingFrom);
    }
    if (workoutList.contains(WorkoutlistTitle.back_ch)) {
      result[WorkoutlistTitle.back_ch] = GiveBackChWorkoutlist(startingFrom);
    }
    if (workoutList.contains(WorkoutlistTitle.back_th)) {
      result[WorkoutlistTitle.back_th] = GiveBackThWorkoutlist(startingFrom);
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

  static Future<List<WorkoutListModel>> createWorkouts(
      List<WorkoutlistTitle> workouts,
      {DateTime? startingFrom}) async {
    if (startingFrom == null) {
      startingFrom = DateTime.now();
    }
    WorkoutListDB wl_db = serviceLocator<WorkoutListDB>();
    final workout_days = GenerateWorkoutListByTitle(workouts, startingFrom);
    final workoutTitles = workout_days.entries
        .map<WorkoutlistTitle>((entry) => entry.key)
        .toSet();
    final existsWorkoutTitles = await Future.wait(workoutTitles.map((title) =>
            wl_db
                .checkIfThereIsWorkoutListTitles(title.name)
                .then((value) => value ? title : null)))
        .then((value) => value.toList());
    workoutTitles.removeAll(existsWorkoutTitles);
    final futureInsertedWorkouts = workoutTitles
        .map((title) => workout_days.entries
            .where((entry) => entry.key == title)
            .expand((entry) => entry.value))
        .map((workoutModels) =>
            workoutModels.map((workout) => wl_db.insertWorkoutList(workout)))
        .expand((element) => element);
    final insertWorkoutLists = await Future.wait(futureInsertedWorkouts);
    return insertWorkoutLists;
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
