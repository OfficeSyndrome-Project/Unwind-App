// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppscreenTheme(
        textBar: "ชุดท่าบริหาร",
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: []);
  }
}
