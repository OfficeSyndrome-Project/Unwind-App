// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/pages/afterBreak-page.dart';
import 'package:unwind_app/pages/clock-page.dart';
import 'package:unwind_app/pages/contentAfterWork-page.dart';
import 'package:unwind_app/pages/ergonomic-page.dart';
import 'package:unwind_app/pages/history-page.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/profile-page.dart';
import 'package:unwind_app/pages/questionErgonomic-page.dart';
import 'package:unwind_app/pages/resultErgonomic-page.dart';
import 'package:unwind_app/pages/summary-page.dart';
import 'package:unwind_app/pages/timeWatch-page.dart';
import 'package:unwind_app/pages/workoutList-page.dart';

import '../data/timewatch-obj.dart';

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
