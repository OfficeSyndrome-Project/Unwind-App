import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';
import 'package:unwind_app/globals/theme/buttomtap-theme.dart';

class AfterBreakPage extends StatelessWidget {
  const AfterBreakPage({Key? key}) : super(key: key);

  void navigatorBack(bool isWorking, BuildContext context) {
    Navigator.pop(context, isWorking);
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      textBar: "นาฬิกาจับเวลา",
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          height: 250,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/working-rafiki.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'ตอนนี้คุณได้พักครบตามเวลาที่ได้ตั้งไว้\nคุณสนใจที่จะทำงานต่อหรือหยุดเพียงเท่านี้',
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                navigatorBack(false, context);
              },
              child: ButtomTapTheme(
                  "หยุดการทำงาน",
                  8,
                  137,
                  50,
                  Theme.of(context).colorScheme.background,
                  BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                  Theme.of(context).textTheme.headlineMedium),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
                onTap: () {
                  navigatorBack(true, context);
                },
                child: ButtomTapTheme(
                    "ทำงานต่อ",
                    8,
                    107,
                    50,
                    Theme.of(context).colorScheme.primary,
                    BorderSide.none,
                    Theme.of(context).textTheme.headlineSmall)),
          ],
        ),
      ],
    );
  }
}
