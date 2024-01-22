import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_nrs_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/part_two_question_box_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/posture_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

class QuestionAfterPartTwo extends StatefulWidget {
  final Map<String, bool> onSelectMap;
  final List<Answer>? answers;
  const QuestionAfterPartTwo(
      {super.key, required this.onSelectMap, this.answers});

  @override
  State<QuestionAfterPartTwo> createState() => _QuestionAfterPartTwoState();
}

class _QuestionAfterPartTwoState extends State<QuestionAfterPartTwo> {
  initState() {
    super.initState();
    answers.addAll(widget.answers ?? []);
    print(widget.answers);
  }

  List<Answer> answers = [];
  void handleCurrentAnswerChanged(Answer answer) {
    setState(() {
      answers = Answer.updateAnswer(answers, answer);
    });
  }

  PageRoutes pageRoutes = PageRoutes();
  int currentPage = 0;
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  double oncurrentNRS = 0;
  late List<MapEntry<String, bool>> typeList = widget.onSelectMap.entries
      .where((element) => element.value == true)
      .toList();

  late List<ScreeningPartTwoModel> selectedParts =
      ScreeningQuestionPartTwoService.getScreeningPartTwoModelByListOfParts(
          typeList.map((part) => part.key).toList());

  @override
  Widget build(BuildContext context) {
    List<Widget> questionsWidgets_ = [];
    int pageAmount = 0;
    ScreeningPartTwoModel.sortByPartOrder(selectedParts);

    for (var part in selectedParts) {
      pageAmount += part.selectedPart.questionPage.length;
      var pageAmountOfQuestion =
          part.questions.map((e) => e.questionPage).toSet().length;

      for (int pageNumber = 0;
          pageNumber < pageAmountOfQuestion;
          pageNumber++) {
        var questionWidget = Container(
            child: ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.all(2),
          children: [
            PartTwoQuestionBoxWidget(
              title: part.selectedPart.title,
              assetPath: part.selectedPart.assetPath,
              questions: ScreeningQuestionPartTwoService.getQuestionsByPage(
                  part.questions, pageNumber),
              currentPage: currentPage,
              pageRoutes: pageRoutes,
              controller: _controller,
              questionID: part.questions.map((e) => e.questionId).toList(),
              onChanged: handleCurrentAnswerChanged,
            )
          ],
        ));

        questionsWidgets_.add(questionWidget);
      }

      var pageAmountOfPosture =
          part.postures.map((e) => e.questionPage).toSet().length;

      for (int pageNumber = 0; pageNumber < pageAmountOfPosture; pageNumber++) {
        var postureWidget = PostuerWidget(
          questions: ScreeningQuestionPartTwoService.getPostureByPage(
              part.postures, pageNumber),
          currentPage: currentPage,
          pageRoutes: pageRoutes,
          controller: _controller,
          onChanged: handleCurrentAnswerChanged,
        );
        questionsWidgets_.add(postureWidget);
      }
      var nrsWidget = BoxNrsWidget();
      questionsWidgets_.add(nrsWidget);
      pageAmount += 1;
    }
    return AppscreenTheme(
        vertical: ResponsiveCheckWidget.isSmallMobile(context) ? 0 : 16,
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
              clipBehavior: Clip.none,
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
          )),
          SizedBox(
            height: 16,
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                print(answers);
                bool show_go_to_doctor = false;
                //TODO
                answers
                    .where((element) => element.questionPart == 2)
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
                  _controller.jumpToPage(pageAmount - 1);
                }
                //กรณีเลือกทั้งหมด จะไม่ไปต่อที่ part 3
                if ((selectedParts.length == 5) &&
                    (currentPage == pageAmount - 1)) {
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .formafterscreening(answers)
                          .route(context));
                  return;
                }
                //กรณีเลือก คอ บ่า หลังส่วนล่าง จะไปต่อที่ form ทันที ไม่ต้องทำ part 3
                final selectedPartsTitle =
                    selectedParts.map((e) => e.selectedPart.title);
                if ((selectedPartsTitle.contains('คอ')) &&
                    (selectedPartsTitle.contains('บ่า')) &&
                    (selectedPartsTitle.contains('หลังส่วนล่าง')) &&
                    (currentPage == pageAmount - 1)) {
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .formafterscreening(answers)
                          .route(context));
                  return;
                }
                currentPage < pageAmount - 1
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpage(2, selectedParts, answers)
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
