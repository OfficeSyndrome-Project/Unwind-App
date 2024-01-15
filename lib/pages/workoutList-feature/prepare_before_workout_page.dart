import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class PrepareBeforeWorkoutPage extends StatelessWidget {
  PrepareBeforeWorkoutPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white),
        textBar: pageRoutes.workout.preparebeforeworkout().title,
        children: [
          Expanded(
              child: Column(
            children: [],
          ))
        ]);
  }
}
