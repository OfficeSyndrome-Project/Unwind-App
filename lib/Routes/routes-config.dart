// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/pages/alarm-feature/clock-page.dart';
import 'package:unwind_app/pages/history-feature/history-page.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/profile-feature/profile-page.dart';
import 'package:unwind_app/pages/history-feature/summary-page.dart';
import 'package:unwind_app/pages/workoutList-feature/workoutList-page.dart';
import '../data/timewatch-obj.dart';
import '../pages/alarm-feature/afterBreak-page.dart';
import '../pages/alarm-feature/contentAfterWork-page.dart';
import '../pages/alarm-feature/timeWatch-page.dart';
import '../pages/ergonomic-feature/ergonomic-page.dart';
import '../pages/ergonomic-feature/questionErgonomic-page.dart';
import '../pages/ergonomic-feature/resultErgonomic-page.dart';

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
