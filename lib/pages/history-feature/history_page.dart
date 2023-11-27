import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/history_boxworkoutlist_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

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
