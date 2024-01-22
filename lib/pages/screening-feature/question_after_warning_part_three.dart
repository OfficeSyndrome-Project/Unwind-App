import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_nrs_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/part_three_question_box_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/posture_part_three_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

class QuestionAfterWarningPartThree extends StatefulWidget {
  final List<ScreeningPartTwoModel> selectPart;
  final List<Answer>? answers;
  const QuestionAfterWarningPartThree(
      {super.key, required this.selectPart, this.answers});

  @override
  State<QuestionAfterWarningPartThree> createState() =>
      _QuestionAfterWarningPartThreeState();
}

class _QuestionAfterWarningPartThreeState
    extends State<QuestionAfterWarningPartThree> {
  PageRoutes pageRoutes = PageRoutes();
  int currentPage = 0;
  List<Answer> answers = [];
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  late List<String> allPartTitle =
      ScreeningQuestionPartThreeService.getAllPartTitle;

  late List<ScreeningPartThreeModel> getPart =
      ScreeningQuestionPartThreeService.getScreeningPartThreeModelByListOfParts(
          allPartTitle
              .where((element) => !widget.selectPart
                  .any((select) => select.selectedPart.title == element))
              .toList());

  initState() {
    super.initState();
    answers.addAll(widget.answers ?? []);
    print(widget.answers);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> questionsWidgets_ = [];
    int pageAmount = 0;
    for (var part in getPart) {
      pageAmount += getPart.length + part.postures.length;
      List<int> pageNumberList =
          part.postures.map((e) => e.questionPage).toSet().toList();
      for (var pageNumber in pageNumberList) {
        var postureWidget = PosturePartThreeWidget(
            questions: ScreeningQuestionPartThreeService.getPostureByPage(
                part.postures, pageNumber),
            currentPage: currentPage,
            pageRoutes: pageRoutes,
            controller: _controller);
        questionsWidgets_.add(postureWidget);
      }
      var questionWidget = Container(
          child: ListView(
        padding: EdgeInsets.all(2),
        physics: ClampingScrollPhysics(),
        children: [
          PartThreeQuestionBoxWidget(
            questions: part.questions,
            currentPage: currentPage,
            pageRoutes: pageRoutes,
            controller: _controller,
          )
        ],
      ));

      questionsWidgets_.add(questionWidget);
      //nrs here
      var nrsWidget = BoxNrsWidget();

      questionsWidgets_.add(nrsWidget);
    }

    // print('currentPage : ${currentPage}');
    // print('pageAmount : ${pageAmount}');
    return AppscreenTheme(
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            currentPage >= 1
                ? _controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut)
                : Navigator.pop(context);
          },
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
                children: [
                  ...questionsWidgets_,
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                bool show_go_to_doctor = false;
                answers
                    .where((element) => element.questionPart == 3)
                    .toList()
                    .forEach((element) {
                      print(element);
                  if (ShowGoToDoctorPageService.showGoToDoctorPage(
                      element.questionPart,
                      element.title,
                      element.questionId,
                      element.answer)) {
                    show_go_to_doctor = true;
                  }
                });
                if (show_go_to_doctor == true) {
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          //แก้ตรงนี้จ้า
                          .formafterscreening(answers)
                          .route(context));
                  // _controller.jumpToPage(pageAmount - 1);
                  return;
                }
                currentPage <
                        questionsWidgets_.length - 1
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .formafterscreening(answers)
                            .route(context));
              },
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
