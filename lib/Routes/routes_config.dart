import 'package:flutter/material.dart';
import 'package:unwind_app/pages/alarm-feature/clock_page.dart';
import 'package:unwind_app/pages/history-feature/history_page.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/profile-feature/profile_page.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';
import 'package:unwind_app/pages/workoutList-feature/workoutlist_page.dart';
import '../data/timewatch_obj.dart';
import '../pages/alarm-feature/afterbreak_page.dart';
import '../pages/alarm-feature/content_afterwork_page.dart';
import '../pages/alarm-feature/time_watch_page.dart';
import '../pages/ergonomic-feature/ergonomic_page.dart';
import '../pages/ergonomic-feature/question_ergonomic_page.dart';
import '../pages/ergonomic-feature/result_ergonomic_page.dart';

class PageRoutes {
  Home home = Home();
  Menu menu = Menu();
  History history = History();
  Profile profile = Profile();
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
      title: "ปรับสภาพแวดล้อมการทำงาน", widget: ResultErgonomicPage());
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
}

class Profile {
  PathRoute editpage() =>
      PathRoute(title: "ชุดท่าบริหาร", widget: const ProfilePage());
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