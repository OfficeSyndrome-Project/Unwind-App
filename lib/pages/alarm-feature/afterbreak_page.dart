import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';

class AfterBreakPage extends StatelessWidget {
  const AfterBreakPage({super.key});

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
            ButtonTapTheme(
                onTap: () {
                  navigatorBack(false, context);
                },
                text: "หยุดการทำงาน",
                radius: 8,
                width: 137,
                height: 50,
                color: Theme.of(context).colorScheme.background,
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.primary),
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              width: 8,
            ),
            ButtonTapTheme(
                onTap: () {
                  navigatorBack(true, context);
                },
                text: "ทำงานต่อ",
                radius: 8,
                width: 107,
                height: 50,
                color: Theme.of(context).colorScheme.primary,
                borderSide: BorderSide.none,
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ],
    );
  }
}
