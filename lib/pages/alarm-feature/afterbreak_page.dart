import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import '../../Widgets/responsive_check_widget.dart';

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
        RatioImageoneToOne(assetName: 'lib/assets/images/working-rafiki.png'),
        Container(
          margin: EdgeInsets.only(top: 24, bottom: 48),
          child: Text(
            'ตอนนี้คุณได้พักครบตามเวลาที่ได้ตั้งไว้\nคุณสนใจที่จะทำงานต่อหรือหยุดเพียงเท่านี้',
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  )
                : Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonWithoutIconWidget(
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
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3b67cd),
                      )
                    : Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              width: 8,
            ),
            ButtonWithoutIconWidget(
                onTap: () {
                  navigatorBack(true, context);
                },
                text: "ทำงานต่อ",
                radius: 8,
                width: 107,
                height: 50,
                color: Theme.of(context).colorScheme.primary,
                borderSide: BorderSide.none,
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF),
                      )
                    : Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ],
    );
  }
}
