import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/screening_question_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';
import '../../Widgets/button_withouticon_widget.dart';

class ScreeningPartOneQuestion extends StatefulWidget {
  const ScreeningPartOneQuestion({super.key});

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
    List<Widget> questionsWidgets =
        ScreeningQuestionService.getAllQuestionPage()
            .map((questionPage) => ScreeningQuestionBoxWidget(
                  assetPath: questionPage.assetPath,
                  questions: ScreeningQuestionService.getQuestionsByPage(
                      questionPage.questionPage),
                  currentPage: currentPage,
                  pageRoutes: pageRoutes,
                  controller: _controller,
                ))
            .toList();

    return AppscreenTheme(
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
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Container for PageView (not hug the content yet)
          ResponsiveCheckWidget.isSmallMobile(context)
              ? Expanded(
                  child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 24),
                        height: MediaQuery.of(context).size.height - 100,
                        child: PageView(
                          controller: _controller,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          children: [
                            ...questionsWidgets,
                          ],
                        ),
                      ),
                      ButtonWithoutIconWidget(
                          onTap: () {
                            currentPage < questionsWidgets.length - 1
                                ? _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut)
                                : Navigator.push(
                                    context,
                                    pageRoutes.screening
                                        .introscreeningpageparttwo()
                                        .route(context));
                          },
                          text: "ถัดไป",
                          radius: 32,
                          width: double.infinity,
                          height: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 48
                              : 52,
                          color: Theme.of(context).colorScheme.primary,
                          borderSide: BorderSide.none,
                          style: ResponsiveCheckWidget.isSmallMobile(context)
                              ? TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF),
                                )
                              : Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ))
              : Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 24),
                      height: 500,
                      child: PageView(
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        children: [
                          ...questionsWidgets,
                        ],
                      ),
                    ),
                    ButtonWithoutIconWidget(
                        onTap: () {
                          currentPage < questionsWidgets.length - 1
                              ? _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut)
                              : Navigator.push(
                                  context,
                                  pageRoutes.screening
                                      .introscreeningpageparttwo()
                                      .route(context));
                        },
                        text: "ถัดไป",
                        radius: 32,
                        width: double.infinity,
                        height: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 48
                            : 52,
                        color: Theme.of(context).colorScheme.primary,
                        borderSide: BorderSide.none,
                        style: ResponsiveCheckWidget.isSmallMobile(context)
                            ? TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
                              )
                            : Theme.of(context).textTheme.headlineSmall)
                  ],
                )
        ]);
  }
}
