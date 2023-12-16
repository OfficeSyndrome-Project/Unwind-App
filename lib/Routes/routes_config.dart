import 'package:flutter/material.dart';
import 'package:unwind_app/pages/alarm-feature/clock_page.dart';
import 'package:unwind_app/pages/history-feature/history_page.dart';
import 'package:unwind_app/pages/history-feature/result_per_week_page.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';
import 'package:unwind_app/pages/screening-feature/intro_screening_page.dart';
import 'package:unwind_app/pages/screening-feature/screening_part_one_question.dart';
import 'package:unwind_app/pages/screening-feature/screening_part_two_question.dart';
import 'package:unwind_app/pages/workoutList-feature/workoutlist_page.dart';
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
}

class Screening {
  PathRoute introscreeningpage(int currentIndex) => PathRoute(
      title: "",
      widget: IntroScreeningPage(
        currentIndex: currentIndex,
      ));
  PathRoute screeningpartonequestion() =>
      PathRoute(title: "", widget: const ScreeningPartOneQuestion());
  PathRoute screeningparttwoquestion() =>
      PathRoute(title: "", widget: const ScreeningPartTwoQuestion());
}

class Home {
  PathRoute workoutlist() =>
      PathRoute(title: "ชุดท่าบริหาร", widget: const HomePage());
  PathRoute screenpage() =>
      PathRoute(title: "", widget: const WorkoutListPage());
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
}

class History {
  PathRoute historylist() => PathRoute(title: "ประวัติ", widget: HistoryPage());
  PathRoute summarypage() => PathRoute(title: "ประวัติ", widget: SummaryPage());
  PathRoute resultperweekpage(List<SummaryListObj> summaryArr) => PathRoute(
      title: "ประวัติ",
      widget: ResultPerWeekPage(
        summaryArr: summaryArr,
      ));
}

class Profile {
  PathRoute editpage() =>
      PathRoute(title: "แก้ไขโปรไฟล์", widget: const EditProfile());
}

class PathRoute {
  String title;
  Widget widget;

  PathRoute({required this.title, required this.widget});

  MaterialPageRoute route(BuildContext context,
      {List<TimeWatchObj>? timesArr}) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
