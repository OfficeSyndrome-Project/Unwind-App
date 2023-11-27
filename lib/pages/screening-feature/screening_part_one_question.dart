import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ScreeningPartOneQuestion extends StatefulWidget {
  @override
  State<ScreeningPartOneQuestion> createState() =>
      _ScreeningPartOneQuestionState();
}

class _ScreeningPartOneQuestionState extends State<ScreeningPartOneQuestion> {
  PageRoutes pageRoutes = PageRoutes();

  int currentPage = 0;

  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          color: Theme.of(context).colorScheme.primary,
        ),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ScreeningQuestionBoxWidget(),
          
        ]);
  }
}
