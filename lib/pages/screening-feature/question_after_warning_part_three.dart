import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class QuestionAfterWarningPartThree extends StatefulWidget {
  final List<MapEntry<String, bool>> typeList;
  const QuestionAfterWarningPartThree({super.key, required this.typeList});

  @override
  State<QuestionAfterWarningPartThree> createState() =>
      _QuestionAfterWarningPartThreeState();
}

class _QuestionAfterWarningPartThreeState
    extends State<QuestionAfterWarningPartThree> {
  PageRoutes pageRoutes = PageRoutes();
  int currentPage = 0;
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  // late List<ScreeningPartThreeModel> archivePart = ScreeningQuestionPartThreeService.getScreeningPartThreeModelBySelectedPart(widget.typeList.map((e) => e.key).toString());

  @override
  Widget build(BuildContext context) {
    print('selectPartInPartThree : ${widget.typeList}');

    // print('archivePart : ${archivePart}');

    return AppscreenTheme(
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            currentPage >= 1
                ? _controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut)
                : Navigator.pop(context);
          },
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          color: Theme.of(context).colorScheme.primary,
        ),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: [],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ButtonWithoutIconWidget(
              onTap: () {},
              text: "ถัดไป",
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
