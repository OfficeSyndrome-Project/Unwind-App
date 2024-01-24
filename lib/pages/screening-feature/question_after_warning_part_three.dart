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
  final Map<ScreeningTitle, int>? nrs;
  const QuestionAfterWarningPartThree({
    super.key,
    required this.selectPart,
    this.answers,
    this.nrs,
  });

  @override
  State<QuestionAfterWarningPartThree> createState() =>
      _QuestionAfterWarningPartThreeState();
}

class _QuestionAfterWarningPartThreeState
    extends State<QuestionAfterWarningPartThree> {
  PageRoutes pageRoutes = PageRoutes();
  int currentPage = 0;
  List<Answer> answers = [];
  List<PostureAnswer> postureAnswers = [];
  Map<ScreeningTitle, int>? nrs;
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

  late List<ScreeningPartThreeModel> availableParts;

  // List<ScreeningPartThreeModel> getAvailableParts() => ScreeningQuestionPartThreeService.getScreeningPartThreeModelByListOfParts(
  //         allPartTitle
  //             .where((element) => !widget.selectPart
  //                 .any((select) => select.selectedPart.title == element))
  //             .toList());

  Function(double) nrsOnChangeHandler(String title) {
    final screeningTitle = ScreeningDiagnoseService.fromThai[title];
    if (screeningTitle == null) {
      return (double value) => setState(() {});
    }
    return (double value) => setState(() {
          if (nrs == null) {
            nrs = {
              screeningTitle: value.toInt(),
            };
            return;
          }
          nrs![screeningTitle] = value.toInt();
        });
  }

  void handleAnswerChanged(Answer answer) {
    setState(() {
      answers = Answer.updateAnswer(answers, answer);
    });
  }

  void Function(int) Function(int) handlerPostureAnswer(String title) =>
      (int questionId) => (int value) => setState(() {
            postureAnswers = PostureAnswer.updateAnswer(
                postureAnswers,
                PostureAnswer(
                  questionId: questionId,
                  answer: value,
                  title: title,
                ));
          });

  initState() {
    super.initState();
    answers.addAll(widget.answers ?? []);
    nrs = widget.nrs;
    print(widget.answers);

    availableParts = getPart; // remove parts that are exposed to doctor
    if (isNeckSetToDoctor(answers, nrs)) {
      availableParts.removeWhere((part) => part.postures
          .any((element) => element.title == "คอ" || element.title == "บ่า"));
    }
    if (isBackSetToDoctor(answers, nrs)) {
      availableParts.removeWhere((part) =>
          part.postures.any((element) => element.title == "หลังส่วนล่าง"));
    }
  }

  void Function(List<PostureAnswer>) Function(
      Map<String, int>, int, PageController) skipPostureIfShould(
          String title) =>
      (Map<String, int> moreIntenseQuestionsPages, int currentPage,
              PageController pageController) =>
          (List<PostureAnswer> postureAnswers) {
            if (!moreIntenseQuestionsPages.containsKey(title)) {
              return;
            }
            final currentPosturePage = moreIntenseQuestionsPages[title]!;
            if (currentPage >= currentPosturePage) {
              return;
            }
            if (postureAnswers
                .where((element) => element.title == title)
                .any((element) => element.answer == 1)) {
              pageController.jumpToPage(currentPosturePage - 1);
              return;
            }
          };

  @override
  Widget build(BuildContext context) {
    List<Widget> questionsWidgets_ = [];
    int pageAmount = 0;
    Map<String, int> moreIntenseQuestionsPages = {};
    List<int> lowerBackPage = [];

    // final availableParts = getPart; // remove parts that are exposed to doctor
    // if (isNeckSetToDoctor(answers, nrs)) {
    //   availableParts.removeWhere((part) => part.postures
    //       .any((element) => element.title == "คอ" || element.title == "บ่า"));
    // }
    // if (isBackSetToDoctor(answers, nrs)) {
    //   availableParts.removeWhere((part) =>
    //       part.postures.any((element) => element.title == "หลังส่วนล่าง"));
    // }

    for (var part in availableParts) {
      if (part.postures.first.title == "หลังส่วนล่าง") {
        lowerBackPage.add(pageAmount);
      }
      List<int> pageNumberList =
          part.postures.map((e) => e.questionPage).toSet().toList();
      for (var pageNumber in pageNumberList) {
        var postureWidget = PosturePartThreeWidget(
          questions: ScreeningQuestionPartThreeService.getPostureByPage(
              part.postures, pageNumber),
          currentPage: currentPage,
          pageRoutes: pageRoutes,
          controller: _controller,
          onChanged: handlerPostureAnswer(part.postures.first.title),
        );
        questionsWidgets_.add(postureWidget);
      }
      // pageAmount += part.postures.length;
      pageAmount += pageNumberList.length;

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
            title: part.postures.first.title,
            onChanged: handleAnswerChanged,
          )
        ],
      ));
      moreIntenseQuestionsPages[part.postures.first.title] =
          questionsWidgets_.length;

      questionsWidgets_.add(questionWidget);
      pageAmount += 1;
      //nrs here
      var nrsWidget = BoxNrsWidget(
        onChanged: nrsOnChangeHandler(part.postures.first.title),
      );

      questionsWidgets_.add(nrsWidget);
      pageAmount += 1;
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
              onTap: () async {
                print('answers : ${answers.join('\n')}');
                print('nrs : ${nrs}');
                print('postureAnswer :${postureAnswers.join('\n')}');
                print(
                    'currentPage : ${currentPage} lowerbackpage: ${lowerBackPage}');

                final isDoctoringOnNeckOrBaaOrShoulder =
                    ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
                  ScreeningTitle.neck,
                  ScreeningTitle.baa,
                  ScreeningTitle.shoulder,
                ]);
                if (isDoctoringOnNeckOrBaaOrShoulder) {
                  // Show doctor page
                  print('showing doctor page');
                  // Jump to lower back if exists
                  if (lowerBackPage.isNotEmpty) {
                    print('=== $currentPage, ${lowerBackPage.first}');
                    if (currentPage < lowerBackPage.first) {
                      _controller.jumpToPage(lowerBackPage.first);
                      print('jumped to $currentPage');
                      return;
                    }
                  }
                }

                final isNrsExceedingOnNeckOrBaaOrShoulder =
                    ScreeningDiagnoseService.nrsExceedOf([
                  ScreeningTitle.neck,
                  ScreeningTitle.baa,
                  ScreeningTitle.shoulder,
                ], nrs ?? {});
                if (isNrsExceedingOnNeckOrBaaOrShoulder) {
                  // Show doctor page, because nrs exceed
                  print('showing doctor page');
                  // Jump to lower back if exists
                  if (lowerBackPage.isNotEmpty) {
                    if (currentPage < lowerBackPage.first) {
                      _controller.jumpToPage(lowerBackPage.first);
                      return;
                    }
                  }
                }

                final isDoctoringOnUpperBackOrLowerBack =
                    ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
                  ScreeningTitle.upperback,
                  ScreeningTitle.lowerback,
                ]);
                if (isDoctoringOnUpperBackOrLowerBack) {
                  // Show doctor page
                  print('showing doctor page');
                  // Jump to form
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .formafterscreening(answers)
                          .route(context));
                }
                final isNrsExceedingOnUpperBackOrLowerBack =
                    ScreeningDiagnoseService.nrsExceedOf([
                  ScreeningTitle.upperback,
                  ScreeningTitle.lowerback,
                ], nrs ?? {});
                if (isNrsExceedingOnUpperBackOrLowerBack) {
                  // Show doctor page, because nrs exceed
                  print('showing doctor page');
                  // Jump to form, but not necessary because this is the last page
                }

                // Posture Skipper
                // if PostureSkipper of neck => skip to more intense question page which is the greater closest page
                skipPostureIfShould('คอ')(moreIntenseQuestionsPages,
                    currentPage, _controller)(postureAnswers);
                skipPostureIfShould('บ่า')(moreIntenseQuestionsPages,
                    currentPage, _controller)(postureAnswers);
                skipPostureIfShould('หลังส่วนล่าง')(moreIntenseQuestionsPages,
                    currentPage, _controller)(postureAnswers);

                skipQuestionsAndNrsIfShould('คอ')(moreIntenseQuestionsPages,
                    currentPage, _controller)(postureAnswers);
                skipQuestionsAndNrsIfShould('บ่า')(moreIntenseQuestionsPages,
                    currentPage, _controller)(postureAnswers);
                skipQuestionsAndNrsIfShould('หลังส่วนล่าง')(
                    moreIntenseQuestionsPages,
                    currentPage,
                    _controller)(postureAnswers);

                // bool show_go_to_doctor = false;
                // answers
                //     .where((element) => element.questionPart == 3)
                //     .toList()
                //     .forEach((element) {
                //   print(element);
                //   if (ShowGoToDoctorPageService.showGoToDoctorPage(
                //       element.questionPart,
                //       element.title,
                //       element.questionId,
                //       element.answer)) {
                //     show_go_to_doctor = true;
                //   }
                // });
                // if (show_go_to_doctor == true) {
                //   Navigator.push(
                //       context,
                //       pageRoutes.screening
                //           //แก้ตรงนี้จ้า
                //           .formafterscreening(answers)
                //           .route(context));
                //   // _controller.jumpToPage(pageAmount - 1);
                //   return;
                // }
                currentPage < questionsWidgets_.length - 1
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

  bool isNeckSetToDoctor(List<Answer> answers, Map<ScreeningTitle, int>? nrs) {
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
    ], nrs ?? {});

    return isDoctoringOnNeckOrBaaOrShoulder ||
        isNrsExceedingOnNeckOrBaaOrShoulder;
  }

  bool isBackSetToDoctor(List<Answer> answers, Map<ScreeningTitle, int>? nrs) {
    final isDoctoringOnUpperBackOrLowerBack =
        ScreeningDiagnoseService.shouldGoToDoctorByParts(answers, [
      ScreeningTitle.upperback,
      ScreeningTitle.lowerback,
    ]);
    final isNrsExceedingOnUpperBackOrLowerBack =
        ScreeningDiagnoseService.nrsExceedOf([
      ScreeningTitle.upperback,
      ScreeningTitle.lowerback,
    ], nrs ?? {});
    return isDoctoringOnUpperBackOrLowerBack ||
        isNrsExceedingOnUpperBackOrLowerBack;
  }

  void Function(List<PostureAnswer>) Function(
      Map<String, int>, int, PageController) skipQuestionsAndNrsIfShould(
          String title) =>
      (Map<String, int> moreIntenseQuestionsPages, int currentPage,
              PageController pageController) =>
          (List<PostureAnswer> postureAnswers) {
            if (!moreIntenseQuestionsPages.containsKey(title)) {
              return;
            }
            if (currentPage >= moreIntenseQuestionsPages[title]!) {
              return;
            }

            final filteredAnswers = postureAnswers
                .where((element) => element.title == title)
                .toList();

            final expectedAnswerLength = ScreeningPartThreePostureModel
                    .getScreeningPartThreePostureModel()
                .where((element) => element.title == title)
                .length;

            if (filteredAnswers.length != expectedAnswerLength) {
              return;
            }

            // if every answer is No, then skip
            if (filteredAnswers.every((element) => element.answer == 2)) {
              final pageToJump = currentPage + 2;
              return pageController.jumpToPage(pageToJump);
            }
          };
}
