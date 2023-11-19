// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes-config.dart';
import 'package:unwind_app/Widgets/history-workoutlist-widget.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: pageRoutes.history.historylist().title,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, pageRoutes.history.summarypage().route(context));
            },
            child: const HistoryWorkoutlistWidget(),
          )
        ]);
  }
}
