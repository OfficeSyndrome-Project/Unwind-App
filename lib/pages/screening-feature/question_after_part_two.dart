import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/box_nrs_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/part_two_question_box_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/posture_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/pages/screening-feature/exception_page.dart';
import 'package:unwind_app/pages/screening-feature/question_button_state_service.dart';
import 'package:unwind_app/pages/screening-feature/results_workout_page.dart';
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
  bool isButtonEnable = false;

  /// Pages that has been completly answered
  Set<int> pagesCompleted = {};

  initState() {
    super.initState();
    answers.addAll(widget.answers ?? []);
    print(widget.answers);
  }

  List<Answer> answers = [];
  void handleCurrentAnswerChanged(Answer answer) {
    setState(() {
      answers = Answer.updateAnswer(answers, answer);
      // isButtonEnable = isAllQuestionAnswered(ScreeningPart.two,currentPage, answers);
    });
  }

  // This map will store the nrs value of each part
  Map<ScreeningTitle, int> nrs = {};

  // This function returns the closure function that will be called when the slider is changed, which will update the nrs map of the corresponding title
  Function(double) handleNrsSliderChangedOfPart(String title) {
    final screeningTitle = ScreeningDiagnoseService.fromThai[title];
    if (screeningTitle == null) {
      return (double value) => setState(() {});
    }
    return (double value) => setState(() {
          nrs[screeningTitle] = int.tryParse(value.toStringAsFixed(0)) ?? 0;

          // Update the state of the button, if the nrs score is zero, the button will be disabled
          isButtonEnable = value != 0;

          // if the nrs score is zero, remove the page from pagesCompleted
          if (value == 0) {
            if (pagesCompleted.contains(currentPage))
              pagesCompleted.remove(currentPage);
            return;
          }
          pagesCompleted.add(currentPage);
          print(pagesCompleted);
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

    /// Use for skip to backs section
    List<int> first_page_of_back_or_empty = [];
    List<int> page_for_four_choices = [];
    for (var part in selectedParts) {
      //ใส่หน้าแรกของ upper back และ/หรือ lower back
      if (part.selectedPart.title == 'หลังส่วนบน' ||
          part.selectedPart.title == 'หลังส่วนล่าง') {
        first_page_of_back_or_empty.add(pageAmount);
      }
      if (part.selectedPart.title == 'ไหล่' ||
          part.selectedPart.title == 'บ่า') {
        page_for_four_choices.add(pageAmount + 2);
      }
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
                page_for_four_choices: page_for_four_choices,
                onCompleted: (isCompleted) => setState(() {
                      isButtonEnable = isCompleted;
                      pagesCompleted.add(pageNumber);
                    }))
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
          onCompleted: (isCompleted) {
            setState(() {
              isButtonEnable = isCompleted;
              pagesCompleted.add(pageNumber);
            });
          },
        );
        questionsWidgets_.add(postureWidget);
      }
      var nrsWidget = BoxNrsWidget(
          onChanged: handleNrsSliderChangedOfPart(part.selectedPart.title));
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

                  // Update the state of the button
                  isButtonEnable = pagesCompleted.contains(currentPage);
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
              onTap: () async {
                print('nrs : $nrs');
                print(answers);
                print('current page :$currentPage');

                if (!isButtonEnable && !alwaysUnlockButton) return;

                final isDoctoringOnNeckOrBaaOrShoulder =
                    ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
                  ScreeningTitle.neck,
                  ScreeningTitle.baa,
                  ScreeningTitle.shoulder,
                ]);
                final isNrsExceedingOnNeckOrBaaOrShoulder =
                    ScreeningDiagnoseService.nrsExceedOf([
                  ScreeningTitle.neck,
                  ScreeningTitle.baa,
                  ScreeningTitle.shoulder,
                ], nrs);
                if (isDoctoringOnNeckOrBaaOrShoulder ||
                    isNrsExceedingOnNeckOrBaaOrShoulder) {
                  // Case 1: ไม่มีการเลือกหลังส่วนบน และ/หรือ หลังส่วนล่าง แต่เลือกคอ บ่า ไหล่
                  if (first_page_of_back_or_empty.isEmpty) {
                    // Show go to doctor here, and skip to part 3
                    if (isDoctoringOnNeckOrBaaOrShoulder) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExceptionPage(exceptionPart: 1)));
                    }

                    if (isNrsExceedingOnNeckOrBaaOrShoulder) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExceptionPage(exceptionPart: 2)));
                    }
                    // go to part 3
                    Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpage(2, selectedParts, answers, nrs)
                            .route(context));
                  }

                  // Case 2: มีการเลือกหลังส่วนบน และ/หรือ หลังส่วนล่าง
                  if (first_page_of_back_or_empty.isNotEmpty) {
                    // go to first page of upper back or lower back
                    if (currentPage < first_page_of_back_or_empty.first) {
                      if (isDoctoringOnNeckOrBaaOrShoulder) {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExceptionPage(exceptionPart: 1)));
                      }

                      if (isNrsExceedingOnNeckOrBaaOrShoulder) {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExceptionPage(exceptionPart: 2)));
                      }

                      _controller
                          .jumpToPage(first_page_of_back_or_empty.first - 1);
                    }
                  }
                }

                final isDoctoringOnUpperBackOrLowerBack =
                    ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
                  ScreeningTitle.upperback,
                  ScreeningTitle.lowerback,
                ]);
                final isNrsExceedingOnUpperBackOrLowerBack =
                    ScreeningDiagnoseService.nrsExceedOf([
                  ScreeningTitle.upperback,
                  ScreeningTitle.lowerback,
                ], nrs);
                // Check if should go to doctor on upper back or lower back
                if (isDoctoringOnUpperBackOrLowerBack ||
                    isNrsExceedingOnUpperBackOrLowerBack) {
                  if (isDoctoringOnUpperBackOrLowerBack) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ExceptionPage(exceptionPart: 1)));
                  }

                  if (isNrsExceedingOnUpperBackOrLowerBack) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ExceptionPage(exceptionPart: 3)));
                  }
                  // กรณี ไปหาหมอหรือ nrs เกินกำหนด ในส่วนของ (คอ, บ่า, ไหล่ ) && (หลังส่วนบน, หลังส่วนล่าง) (หาหมอ)
                  final neckSetToDoctor = isDoctoringOnNeckOrBaaOrShoulder ||
                      isNrsExceedingOnNeckOrBaaOrShoulder;
                  final backSetToDoctor = isDoctoringOnUpperBackOrLowerBack ||
                      isNrsExceedingOnUpperBackOrLowerBack;
                  if (neckSetToDoctor && backSetToDoctor) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsWorkoutPage(
                                  workoutLists: [],
                                  resultText:
                                      "คุณมีอาการที่ไม่ใช่ออฟฟิศซินโดรม ควรพบแพทย์เพื่อได้รับการรักษาที่ถูกต้อง",
                                )));
                    return;
                  }
                  // go to part 3
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .introscreeningpage(2, selectedParts, answers, nrs)
                          .route(context));
                }

                //กรณีเลือกทั้งหมด จะไม่ไปต่อที่ part 3
                if ((selectedParts.length == 5) &&
                    (currentPage == pageAmount - 1)) {
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .formafterscreening(AnswerContext(
                            selectedPart: selectedParts,
                            answers: answers,
                            nrs: nrs,
                          ))
                          .route(context));
                  return;
                }
                //กรณีเลือก คอ บ่า หลังส่วนล่าง จะไปต่อที่ form ทันที ไม่ต้องทำ part 3 (ไม่หาหมอ)
                final selectedPartsTitle =
                    selectedParts.map((e) => e.selectedPart.title);
                if ((selectedPartsTitle.contains('คอ')) &&
                    (selectedPartsTitle.contains('บ่า')) &&
                    (selectedPartsTitle.contains('หลังส่วนล่าง')) &&
                    (currentPage == pageAmount - 1)) {
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .formafterscreening(AnswerContext(
                            selectedPart: selectedParts,
                            answers: answers,
                            nrs: nrs,
                          ))
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
                            .introscreeningpage(2, selectedParts, answers, nrs)
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

  // bool nrsGreaterOrEqualThanEightOf(
  //     List<ScreeningTitle> concernedTitles, Map<ScreeningTitle, int> nrs) {
  //   final List<int> nrses =
  //       concernedTitles.map((title) => nrs[title] ?? 0).toList();
  //   return nrses.any((score) =>
  //       ScreeningDiagnoseService.nrs_greater_or_equal_to_eight(score));
  // }
}

class DoctorPageDummy extends StatelessWidget {
  final String? text;
  const DoctorPageDummy({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text ?? 'Doctor page'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Continue'))
            ]),
      ),
    );
  }
}
