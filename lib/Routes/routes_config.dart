import 'package:flutter/material.dart';
import 'package:unwind_app/data/history-data/keep_score_and_date_model.dart';
import 'package:unwind_app/pages/alarm-feature/info_clock_page.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/history-feature/result_screening_page.dart';
import 'package:unwind_app/pages/pdf_preview_page.dart';
import 'package:unwind_app/pages/policy_page.dart';
import 'package:unwind_app/pages/screening-feature/infomation_page.dart';
import 'package:unwind_app/services/schedule-service/utils.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/pages/alarm-feature/clock_page.dart';

import 'package:unwind_app/pages/history-feature/history_page.dart';
import 'package:unwind_app/pages/history-feature/result_per_week_page.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';
import 'package:unwind_app/pages/profile-feature/profile_page.dart';
import 'package:unwind_app/pages/screening-feature/form_after_screening.dart';
import 'package:unwind_app/pages/screening-feature/intro_screening_page.dart';
import 'package:unwind_app/pages/screening-feature/question_after_part_two.dart';
import 'package:unwind_app/pages/screening-feature/question_after_warning_part_three.dart';
import 'package:unwind_app/pages/screening-feature/results_workout_page.dart';
import 'package:unwind_app/pages/screening-feature/screening_part_one_question.dart';
import 'package:unwind_app/pages/screening-feature/screening_part_two_question.dart';
import 'package:unwind_app/pages/screening-feature/warning_part_three_page.dart';
import 'package:unwind_app/pages/workoutList-feature/info_schedule_page.dart';
import 'package:unwind_app/pages/workoutList-feature/info_set_workout_page.dart';
import 'package:unwind_app/pages/workoutList-feature/nrs_after_and_before_page.dart';
import 'package:unwind_app/pages/workoutList-feature/info_of_list_workout_page.dart';
import 'package:unwind_app/pages/workoutList-feature/schedule_page.dart';
import 'package:unwind_app/pages/workoutList-feature/set_schedule_page.dart';
import 'package:unwind_app/pages/workoutList-feature/workout_page.dart';
import 'package:unwind_app/pages/workoutList-feature/report_workout_page.dart';
import 'package:unwind_app/pages/workoutList-feature/workoutlist_page.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import '../data/alarm-data/timewatch_obj.dart';
import '../data/history-data/summary_list_obj.dart';

import '../pages/alarm-feature/afterbreak_page.dart';
import '../pages/alarm-feature/content_afterwork_page.dart';
import '../pages/alarm-feature/time_watch_page.dart';
import '../pages/ergonomic-feature/ergonomic_page.dart';
import '../pages/ergonomic-feature/question_ergonomic_page.dart';
import '../pages/ergonomic-feature/result_ergonomic_page.dart';
import '../pages/profile-feature/edit_profile.dart';

class PageRoutes {
  Home home = Home();
  Menu menu = Menu();
  History history = History();
  Profile profile = Profile();
  Screening screening = Screening();
  Workout workout = Workout();
  PreviewPdf previewPdf = PreviewPdf();
}

class Screening {
  PathRoute introscreeningpage(
          int currentIndex,
          List<ScreeningPartTwoModel> selectPart,
          List<Answer>? answers,
          Map<ScreeningTitle, int>? nrs) =>
      PathRoute(
          title: "",
          widget: IntroScreeningPage(
            currentIndex: currentIndex,
            selectPart: selectPart,
            answers: answers,
            nrs: nrs,
          ));
  PathRoute screeningpartonequestion() =>
      PathRoute(title: "", widget: const ScreeningPartOneQuestion());
  PathRoute screeningparttwoquestion(List<Answer>? answers) =>
      PathRoute(title: "", widget: ScreeningPartTwoQuestion(answers: answers));
  PathRoute questionafterscreeningparttwo(
          Map<String, bool> onSelectMap, List<Answer>? answers) =>
      PathRoute(
          title: "",
          widget: QuestionAfterPartTwo(
            onSelectMap: onSelectMap,
            answers: answers,
          ));
  PathRoute warningpartthree(List<ScreeningPartTwoModel> selectPart,
          List<Answer>? answers, Map<ScreeningTitle, int>? nrs) =>
      PathRoute(
          title: "",
          widget: WarningPartThreePage(
            selectPart: selectPart,
            answers: answers,
            nrs: nrs,
          ));
  PathRoute afterwarningpartthree(List<ScreeningPartTwoModel> selectPart,
          List<Answer>? answers, Map<ScreeningTitle, int>? nrs) =>
      PathRoute(
          title: "",
          widget: QuestionAfterWarningPartThree(
            selectPart: selectPart,
            answers: answers,
            nrs: nrs,
          ));
  PathRoute formafterscreening(AnswerContext answerContext) => PathRoute(
      title: "",
      widget: FormAfterScreening(
        answerContext: answerContext,
      ));
  PathRoute resultsworkout(
          List<WorkoutListData> workoutList, String resultText) =>
      PathRoute(
          title: "",
          widget: ResultsWorkoutPage(
            workoutLists: workoutList,
            resultText: resultText,
          ));
  PathRoute infomationpage() =>
      PathRoute(title: "อาการปวดแต่ละรูปแบบ", widget: InformationPage());
  PathRoute policypage() =>
      PathRoute(title: "ข้อกำหนดและเงื่อนไข", widget: PolicyPage());
}

class AnswerContext {
  final List<ScreeningPartTwoModel>? selectedPart;
  final List<Answer>? answers;
  final Map<ScreeningTitle, int>? nrs;
  final List<PostureAnswer>? postureAnswers;
  const AnswerContext({
    this.selectedPart,
    this.answers,
    this.nrs,
    this.postureAnswers,
  });
}

class Home {
  PathRoute workoutlist() => PathRoute(
      title: "ชุดท่าบริหาร",
      name: PageName.HOME,
      widget: const HomePage(
        selectedIndex: 0,
      ));
  PathRoute screenpage() => PathRoute(title: "", widget: WorkoutListPage());
}

class Menu {
  PathRoute ergonomicpage() =>
      PathRoute(title: "ปรับสภาพแวดล้อมการทำงาน", widget: ErgonomicPage());
  PathRoute questionergonomic() => PathRoute(
      title: "ปรับสภาพแวดล้อมการทำงาน", widget: const QuestionErgonomicPage());
  PathRoute resultergonomic() => PathRoute(
      title: "ปรับสภาพแวดล้อมการทำงาน", widget: const ResultErgonomicPage());
  PathRoute clockpage() =>
      PathRoute(title: "นาฬิกาจับเวลา", widget: const ClockPage());
  PathRoute timewatchpage(List<TimeWatchObj> timesArr) => PathRoute(
      title: "ชุดท่าบริหาร",
      widget: TimeWatchPage(
        timesArr: timesArr,
      ));
  PathRoute contentafterworkpage() =>
      PathRoute(title: "ชุดท่าบริหาร", widget: const ContentAfterWorkPage());
  PathRoute afterbreakpage() =>
      PathRoute(title: "ชุดท่าบริหาร", widget: const AfterBreakPage());
  PathRoute infoclockpage() =>
      PathRoute(title: "นาฬิกาจับเวลา", widget: const InfoClockPage());
}

class History {
  PathRoute historylist() => PathRoute(title: "ประวัติ", widget: HistoryPage());
  PathRoute summarypage(WorkoutListData workoutList,
          List<WorkoutListModel> workoutListModel) =>
      PathRoute(
          title: "ประวัติ",
          widget: SummaryPage(
            workoutList: workoutList,
            workoutListModel: workoutListModel,
          ));
  PathRoute resultperweekpage(WeeklySummary weeklySummary) => PathRoute(
      title: "ประวัติ",
      widget: ResultPerWeekPage(
        weeklySummary: weeklySummary,
      ));
  PathRoute resultscreening(List<KeepScoreAndDateModel> dateMockup,
          WorkoutListData workoutListData) =>
      PathRoute(
          title: "ประวัติ",
          widget: ResultScreeningPage(
            dateMockup: dateMockup,
            workoutListData: workoutListData,
          ));
}

class Profile {
  PathRoute editpage({String? name}) => PathRoute(
        title: "แก้ไขโปรไฟล์",
        widget: EditProfile(),
      );
  PathRoute profilepage({String? name}) => PathRoute(
        title: "โปรไฟล์",
        widget: ProfilePage(),
      );
}

class Workout {
  PathRoute reportworkoutpage(WorkoutListData? workoutList) => PathRoute(
      title: "ชุดท่าบริหาร",
      name: PageName.REPORT_WORKOUT,
      widget: ReportWorkoutPage(
        workoutList: workoutList,
        workoutListDB: serviceLocator(),
      ));
  PathRoute infooflistworkout(WorkoutListData? workoutList) => PathRoute(
      title: "ชุดท่าบริหาร",
      widget: InfoOfListWorkoutPage(workoutList: workoutList));

  PathRoute infoofsetworkout(
          WorkoutData? workoutData, WorkoutListData workoutList) =>
      PathRoute(
          title: "คำอธิบายชุดท่า",
          widget: InfoSetWorkoutPage(
            workoutData: workoutData,
            workoutList: workoutList,
          ));
  PathRoute nrsafterandbeforeworkout(
          WorkoutListData workoutList, NrsType type) =>
      PathRoute(
          title: "ประเมินความเจ็บปวด",
          widget:
              NrsAfterAndBeforePage(workoutList: workoutList, nrsType: type));
  PathRoute preparebeforeworkout(WorkoutListData workoutList) => PathRoute(
      title: "เตรียมพร้อมก่อนเริ่มออกกำลังกาย",
      widget: WorkoutPage(
        workoutList: workoutList,
      ));
  PathRoute schdulepage() =>
      PathRoute(title: "การแจ้งเตือน", widget: SchedulePage());
  PathRoute infoschedulepage(
          int index, List<Event> value, DateTime selectedDay) =>
      PathRoute(
          title: "การแจ้งเตือน",
          widget: InfoSchedulePage(
            selectedDay: selectedDay,
            index: index,
            value: value,
          ));
  PathRoute setschedulepage() =>
      PathRoute(title: "ตั้งเวลาแจ้งเตือน", widget: SetSchedulePage());
}

class PreviewPdf {
  PathRoute pdfpreviewpage(WorkoutListData workoutListData) => PathRoute(
      title: "ผลทดสอบ",
      widget: PdfPreviewPage(workoutListData: workoutListData));
}

class PageName {
  static String REPORT_WORKOUT = "/report-workout";
  static String HOME = "/home";
}

class PathRoute {
  String title;
  Widget widget;
  Object? arguments;
  String name;

  PathRoute({
    required this.title,
    required this.widget,
    this.arguments,
    this.name = "",
  });

  MaterialPageRoute route(BuildContext context,
      {List<TimeWatchObj>? timesArr, List<SummaryListObj>? summaryArr}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: name, arguments: arguments),
    );
  }
}
