import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/intro_screening_box_widget.dart';
import 'package:unwind_app/data/screening-data/intro_screening_data.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

import '../../Widgets/button_withouticon_widget.dart';

//intro to part one
class IntroScreeningPage extends StatefulWidget {
  final int currentIndex;
  final List<ScreeningPartTwoModel> selectPart;
  final List<Answer>? answers;
  final Map<ScreeningTitle, int>? nrs;
  const IntroScreeningPage({
    super.key,
    required this.currentIndex,
    required this.selectPart,
    this.answers,
    this.nrs,
  });
  @override
  State<IntroScreeningPage> createState() => _IntroScreeningPartOneState();
}

class _IntroScreeningPartOneState extends State<IntroScreeningPage> {
  PageRoutes pageRoutes = PageRoutes();

  static List<IntroScreeningData> introArr = IntroScreeningData.getData();

  PageRoute generateRouteScreen() {
    if (widget.currentIndex == 0) {
      return pageRoutes.screening.screeningpartonequestion().route(context);
    } else if (widget.currentIndex == 1) {
      return pageRoutes.screening
          .screeningparttwoquestion(widget.answers)
          .route(context);
    } else if (widget.currentIndex == 2) {
      return pageRoutes.screening
          .warningpartthree(widget.selectPart, widget.answers, widget.nrs)
          .route(context);
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) => LoadingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
        ),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ScreeningIntroToQuestionWidget(
                assetPath: introArr[widget.currentIndex].assetPath,
                titleLabel: introArr[widget.currentIndex].titleLabel,
                descriptionLabel:
                    introArr[widget.currentIndex].descriptionLabel),
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                Navigator.push(context, generateRouteScreen());
              },
              text: 'ถัดไป',
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    )
                  : Theme.of(context).textTheme.headlineSmall)
        ]);
  }
}
