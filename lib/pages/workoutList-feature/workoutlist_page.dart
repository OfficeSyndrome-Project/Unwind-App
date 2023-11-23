import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppscreenTheme(
        textBar: "ชุดท่าบริหาร",
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: []);
  }
}
