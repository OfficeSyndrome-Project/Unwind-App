import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/screening_question_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/pages/screening-feature/exception_page.dart';
import 'package:unwind_app/pages/screening-feature/question_button_state_service.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
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

  List<Answer> answers = [];

  /// State of weather all questions in the page are answered
  bool isButtonEnable = false;

  void handleCurrentOptionsChanged(int questionID, int value) {
    setState(() {
      answers = Answer.updateAnswer(
          answers,
          Answer(
            questionId: questionID,
            answer: value,
            questionPart: 1,
            area: null,
          ));

      // Update the state of the button
      isButtonEnable =
          isAllQuestionAnswered(ScreeningPart.one, currentPage, answers);
    });
  }

  late List<Widget> questionsWidgets;

  @override
  void initState() {
    super.initState();
    questionsWidgets = ScreeningQuestionPartOneService.getAllQuestionPage()
        .map((questionPage) => ScreeningQuestionBoxWidget(
              assetPath: questionPage.assetPath,
              questions: ScreeningQuestionPartOneService.getQuestionsByPage(
                  questionPage.questionPage),
              currentPage: currentPage,
              pageRoutes: pageRoutes,
              controller: _controller,
              onChanged: handleCurrentOptionsChanged,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            currentPage >= 1
                ? _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut)
                : Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
        ),
        iconButtonEnd: IconButton(
            onPressed: () {
              Navigator.push(context,
                  pageRoutes.screening.infomationpage().route(context));
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: Theme.of(context).colorScheme.primary,
            )),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              clipBehavior: Clip.none,
              pageSnapping: true,
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                  isButtonEnable = isAllQuestionAnswered(
                      ScreeningPart.one, currentPage, answers);
                });
              },
              children: [
                ...questionsWidgets,
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ButtonWithoutIconWidget(
              onTap: () async {
                // If the button is not enabled, do nothing
                if (!isButtonEnable && !alwaysUnlockButton) return;

                bool show_go_to_doctor = false;
                answers
                    .where((element) => element.questionPart == 1)
                    .toList()
                    .forEach((element) {
                  if (ShowGoToDoctorPageService.showGoToDoctorPage(
                      element.questionPart,
                      element.area,
                      element.questionId,
                      element.answer)) {
                    show_go_to_doctor = true;
                  }
                });
                if (show_go_to_doctor == true) {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ExceptionPage(exceptionPart: 0)));
                  return;
                }

                currentPage < questionsWidgets.length - 1
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpage(1, [], answers, null)
                            .route(context));
              },
              text: "ถัดไป",
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: isButtonEnable
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFF9BA4B5),
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
