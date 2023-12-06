import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

//select point to check
class ScreeningPartTwoQuestion extends StatelessWidget {
  const ScreeningPartTwoQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      iconButtonStart: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          // currentPage >= 1
          //           ? _controller.previousPage(
          //               duration: const Duration(milliseconds: 500),
          //               curve: Curves.easeOut)
          //           : Navigator.pop(context);
          Navigator.pop(context);
        },
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(0),
        color: Theme.of(context).colorScheme.primary,
      ),
      colorBar: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [Text("ScreeningPartTwoQuestion")],
    );
  }
}
