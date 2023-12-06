import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/screening-widget/intro_screening_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';

//intro to part one
class IntroScreeningPartOne extends StatefulWidget {
  const IntroScreeningPartOne({super.key});
  @override
  State<IntroScreeningPartOne> createState() => _IntroScreeningPartOneState();
}

class _IntroScreeningPartOneState extends State<IntroScreeningPartOne> {
  PageRoutes pageRoutes = PageRoutes();

  int currentPage = 0;

  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
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
          const ScreeningIntroToQuestionWidget(
              assetPath: 'lib/assets/images/screeningPart/scr_part_one_1.png',
              titleLabel: 'แบบประเมินส่วนที่ 1',
              descriptionLabel:
                  'คำถามชุดนี้จะเป็นการประเมินเพื่อคัดแยกโรค\nที่ไม่ใช่อาการของออฟฟิศซินโดรม'),
          const SizedBox(
            height: 32,
          ),
          ButtonTapTheme(
              onTap: () {
                Navigator.push(
                    context,
                    pageRoutes.screening
                        .screeningpartonequestion()
                        .route(context));
              },
              text: 'ถัดไป',
              radius: 32,
              width: 345,
              height: 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: Theme.of(context).textTheme.displayMedium)
        ]);
  }
}

//intro to part two
class IntroScreeningPartTwo extends StatefulWidget {
  const IntroScreeningPartTwo({super.key});
  @override
  State<IntroScreeningPartTwo> createState() => _IntroScreeningPartTwoState();
}

class _IntroScreeningPartTwoState extends State<IntroScreeningPartTwo> {
  PageRoutes pageRoutes = PageRoutes();

  int currentPage = 0;

  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
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
          const ScreeningIntroToQuestionWidget(
              assetPath: 'lib/assets/images/screeningPart/scr_part_two_1.png',
              titleLabel: 'แบบประเมินส่วนที่ 2',
              descriptionLabel:
                  'คำถามชุดนี้จะเป็นการประเมินอาการความเจ็บปวด ทางระบบกระดูกและกล้ามเนื้อตามบริเวณที่ได้เลือก'),
          const SizedBox(
            height: 32,
          ),
          ButtonTapTheme(
              onTap: () {
                Navigator.push(
                    context,
                    pageRoutes.screening
                        .screeningparttwoquestion()
                        .route(context));
              },
              text: 'ถัดไป',
              radius: 32,
              width: 345,
              height: 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: Theme.of(context).textTheme.displayMedium)
        ]);
  }
}
