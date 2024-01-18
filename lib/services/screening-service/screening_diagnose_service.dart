import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';

class Answer {
  final int QuestionPart;
  final String? title;
  final int questionID;
  final int answer;

  const Answer({
    required this.QuestionPart,
    required this.title,
    required this.questionID,
    required this.answer,
  });

  @override
  String toString() {
    return 'Answer{QuestionPart: $QuestionPart, title: $title, questionID: $questionID, answer: $answer}';
  }
}

class ShowGoToDoctorPageService {
  static final List<Answer> shouldSeeDoctor = [
    //yes = 1 , no = 2
    //part 1
    Answer(QuestionPart: 1, title: null, questionID: 1, answer: 2),
    Answer(QuestionPart: 1, title: null, questionID: 2, answer: 1),
    Answer(QuestionPart: 1, title: null, questionID: 3, answer: 1),
    Answer(QuestionPart: 1, title: null, questionID: 4, answer: 1),
    //part 2
    Answer(QuestionPart: 2, title: "คอ", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 3, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 4, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 5, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 6, answer: 1),
    Answer(QuestionPart: 2, title: "บ่า", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "บ่า", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "บ่า", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "ไหล่", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "ไหล่", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "ไหล่", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "หลังส่วนบน", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "หลังส่วนบน", questionID: 3, answer: 1),
    Answer(QuestionPart: 2, title: "หลังส่วนล่าง", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "หลังส่วนล่าง", questionID: 3, answer: 1),
    //part 3
    Answer(QuestionPart: 3, title: "คอ", questionID: 2, answer: 1),
    Answer(QuestionPart: 3, title: "คอ", questionID: 3, answer: 1),
    Answer(QuestionPart: 3, title: "คอ", questionID: 4, answer: 2),
    Answer(QuestionPart: 3, title: "บ่า", questionID: 2, answer: 1),
    Answer(QuestionPart: 3, title: "บ่า", questionID: 3, answer: 1),
    Answer(QuestionPart: 3, title: "บ่า", questionID: 4, answer: 2),
    Answer(QuestionPart: 3, title: "หลังส่วนบน", questionID: 2, answer: 1),
    Answer(QuestionPart: 3, title: "หลังส่วนบน", questionID: 3, answer: 1),
    Answer(QuestionPart: 3, title: "หลังส่วนบน", questionID: 4, answer: 2),
  ];

  static bool showGoToDoctorPage(
      int questionPart, String? title, int questionID, int answer) {
    return shouldSeeDoctor
        .where((element) => element.QuestionPart == questionPart)
        .where((element) => element.title == title)
        .where((element) => element.questionID == questionID)
        .where((element) => element.answer == answer)
        .isNotEmpty;
  }
}

enum ScreeningTitle { neck, baa, shoulder, lowerback, upperback }

enum WorkoutlistTitle { neckbaa_ch, neckbaa_th, shoulder, back_ch, back_th }

class ScreeningDiagnoseService {
  //static day for workoutlist
  static const days_in_four_weeks = 28;
  //function for check condition of nrs
  static bool nrs_less_than_eigth(int NRS) {
    return NRS.abs() < 8;
  }

  static Future<void> diagnose(
      List<Answer> answers, Map<ScreeningTitle, int?> nrs) async {
    //dictionary Title.part to thai string
    final toThai = {
      ScreeningTitle.neck: "คอ",
      ScreeningTitle.baa: "บ่า",
      ScreeningTitle.shoulder: "ไหล่",
      ScreeningTitle.lowerback: "หลังส่วนล่าง",
      ScreeningTitle.upperback: "หลังส่วนบน",
    };

    List<WorkoutlistTitle> workoutList = [];
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
          if (ShowGoToDoctorPageService.showGoToDoctorPage(element.QuestionPart,
              element.title, element.questionID, element.answer)) {
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
