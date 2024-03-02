import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/box_have_img.dart';
import 'package:unwind_app/Widgets/history-widget/box_only_q.dart';
import 'package:unwind_app/Widgets/history-widget/box_title_part_select.dart';

import 'package:unwind_app/Widgets/history-widget/header_box.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

import 'package:unwind_app/data/history-data/keep_score_and_date_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_service.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';
import 'package:unwind_app/services/answer-service/answer_filter.dart';
import 'package:unwind_app/services/answer-service/answer_service.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

class WorkoutAnswers {
  final List<ScreeningTestAnswerModel> answers;
  final List<WorkoutListModel> workouts;
  final WorkoutListData workoutListData;
  WorkoutAnswers({
    required this.answers,
    required this.workouts,
    required this.workoutListData,
  });
}

class ResultScreeningPage extends StatelessWidget {
  final WorkoutListData workoutListData;
  final List<KeepScoreAndDateModel> dateMockup;
  ResultScreeningPage({
    super.key,
    required this.dateMockup,
    required this.workoutListData,
  });

  final List<ScreeningPartOneModel> q1 =
      ScreeningPartOneModel.getScreeningPartOneModel();

  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        textBar: 'ประวัติ',
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(3),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: FutureBuilder(
                      future: () async {
                        final workouts = await serviceLocator<WorkoutListDB>()
                            .getWorkoutListByTitle(workoutListData.titleCode);
                        if (workouts.isEmpty) {
                          return [];
                        }
                        final answers = await serviceLocator<
                                ScreeningTestAnswerWorkoutListService>()
                            .getAllScreeningTestAnswerByWorkoutList(
                                workouts.first);
                        return WorkoutAnswers(
                          answers: answers,
                          workouts: workouts,
                          workoutListData: workoutListData,
                        );
                      }(),
                      builder: buildMainContent,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            pageRoutes.previewPdf
                                .pdfpreviewpage(workoutListData)
                                .route(context));
                      },
                      child: Icon(
                        Icons.ios_share_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }

  Widget buildMainContent(context, snapshot) {
    // if (snapshot.hasData)
    if (snapshot.hasData) {
      final data = snapshot.data as WorkoutAnswers;
      final workouts = data.workouts;
      if (workouts.isEmpty) {
        return Column(
          children: [],
        );
      }
      final firstDate = workouts.first.date;
      final lastDate = workouts.last.date;

      final answers = data.answers;
      // List<Widget> _partWidget = [];
      // List<Widget> resultWidget = [];
      answers;
      // Tools :
      // HeaderBox
      // BoxTitlePartSelect
      // BoxOnlyQ
      // BoxHaveImg
      final resultNrs = AnswerFilter(isNrsScore: true)
          .apply(answers)
          .map((answer) => Text.rich(TextSpan(
                  style:
                      TextStyle(color: Colors.redAccent), //apply style to all
                  children: [
                    TextSpan(
                      text:
                          'บริเวณ${AnswerService.questionOf(answer).areaThai ?? ''} ${AnswerService.interpret(answer).answer} คะแนน',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF484D56),
                      ),
                    )
                  ])))
          .toList();
      final answersInPartOne =
          answers.where((element) => element.questionPart == 1).toList();
      final answersInPartTwo =
          answers.where((element) => element.questionPart == 2).toList();
      final answersInPartThree = answers
          .where(
              (answer) => answer.questionPart == 3 || answer.questionPart == 4)
          .toList();

      // we must sort the answersInPartThree because part 3 and part 4 are mixed
      // we will group answer area and question title
      final distinctAreasPartThree =
          answersInPartThree.map((answer) => answer.area).toSet().toList()
            ..sort(
              (a, b) => (screeningAreaCustomOrder[a] ?? 0)
                  .compareTo(screeningAreaCustomOrder[b] ?? 0),
            );

      final answersInPartThreeGroupByArea = distinctAreasPartThree
          .map(
            (area) => answersInPartThree
                .where((answer) => answer.area == area)
                .toList()
              ..sort((b, a) =>
                  a.questionPart?.compareTo(b.questionPart ?? 0) ?? 0),
          )
          .toList();

      final answersInPartThree_ =
          answersInPartThreeGroupByArea.expand((e) => e).toList();
      // final allAnswers = [
      //   answersInPartOne,
      //   answersInPartTwo,
      //   answersInPartThree_,
      // ];
      final resultWidgetPartOne = answersInPartOne
          .expand<Widget>(
            (answer) => [
              BoxOnlyQ(
                question: AnswerService.questionOf(answer).question,
                answer: AnswerService.interpret(answer).text,
              )
            ],
          )
          .toList();
      final distinctAreas =
          answersInPartTwo.map((answer) => answer.area).toSet();
      final answersInPartTwoGroupByArea = distinctAreas
          .map((area) =>
              answersInPartTwo.where((answer) => answer.area == area).toList())
          .toList();
      final resultWidgetPartTwo =
          answersInPartTwoGroupByArea.expand<Widget>((answers) {
        final areaThai = ScreeningDiagnoseService.toThai[
            ScreeningDiagnoseService.fromEngToScreeningTitle[
                AnswerService.questionOf(answers.first).area]];
        return <Widget>[
          BoxTitlePartSelect(
              partSelect: (areaThai != null) ? 'บริเวณ${areaThai}' : ''),
          ...answers
              .expand<Widget>(
                (answer) => [
                  (AnswerService.questionOf(answer).questionSpecificAssetPath ==
                          null)
                      ? BoxOnlyQ(
                          question: AnswerService.questionOf(answer).question,
                          // question:
                          //     'อาการปวดของท่านมีลักษณะใกล้เคียงกับข้อใดมากที่สุด?',
                          answer: AnswerService.interpret(answer).text,
                        )
                      : BoxHaveImg(
                          question: AnswerService.questionOf(answer).question,
                          answer: AnswerService.interpret(answer).text,
                          name: AnswerService.questionOf(answer)
                                  .questionSpecificAssetName ??
                              '',
                          assetPath: AnswerService.questionOf(answer)
                                  .questionSpecificAssetPath ??
                              AnswerService.questionOf(answer)
                                  .painTypeAssetPath,
                        ),
                  SizedBox(height: 16),
                ],
              )
              .toList(),
        ];
      }).toList();

      // <Widget>[
      //       BoxTitlePartSelect(partSelect: 'partSelect'),
      //     ] +

      // answersInPartTwo
      //     .expand<Widget>(
      //       (answer) => [
      //         BoxHaveImg(
      //           question: AnswerService.questionOf(answer).question,
      //           answer: AnswerService.interpret(answer).text,
      //           // name: AnswerService.questionOf(answer).area.toString(),
      //           name: AnswerService.questionOf(answer)
      //                   .questionSpecificAssetName ??
      //               '',
      //           assetPath: AnswerService.questionOf(answer)
      //                   .questionSpecificAssetPath ??
      //               AnswerService.questionOf(answer).painTypeAssetPath,
      //         ),
      //         SizedBox(height: 16),
      //         // BoxOnlyQ(
      //         //     question: AnswerService.questionOf(answer).question,
      //         //     answer: AnswerService.interpret(answer).text),
      //       ],
      //     )
      //     .toList();
      final resultWidgetPartThree = answersInPartThree_
          .expand<Widget>((answer) => [
                (AnswerService.questionOf(answer).questionSpecificAssetPath ==
                        null)
                    ? BoxOnlyQ(
                        question: AnswerService.questionOf(answer).question,
                        answer: AnswerService.interpret(answer).text,
                      )
                    : BoxHaveImg(
                        name: AnswerService.questionOf(answer)
                                .questionSpecificAssetName ??
                            '',
                        assetPath: AnswerService.questionOf(answer)
                            .questionSpecificAssetPath,
                        question: AnswerService.questionOf(answer).question,
                        answer: AnswerService.interpret(answer).text),
              ])
          .toList();
      // resultWidget.addAll(questionAndAnswerInPartOne);
      Widget sectionBuilder(List<Widget> resultWidget, String headingText) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBox(text: headingText),
              ...resultWidget,
            ],
          );
      // print('--- resultNrs.length: ${resultNrs.length}');
      final sections = [
        if (resultNrs.isNotEmpty)
          sectionBuilder(resultNrs, 'ค่าความเจ็บปวด (NRS pain score)'),
        if (resultWidgetPartOne.isNotEmpty)
          sectionBuilder(resultWidgetPartOne, 'แบบประเมินส่วนที่ 1'),
        if (resultWidgetPartTwo.isNotEmpty)
          sectionBuilder(resultWidgetPartTwo, 'แบบประเมินส่วนที่ 2'),
        if (resultWidgetPartThree.isNotEmpty)
          sectionBuilder(resultWidgetPartThree, 'แบบประเมินส่วนที่ 3'),
      ];

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'ผลการประเมินแบบทดสอบ',
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF484D56),
                    )
                  : Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Center(
            child: (firstDate == null || lastDate == null)
                ? Text('')
                : Text(
                    '${formatDateTimeRangeToThai(firstDate, lastDate)}',
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF484D56),
                          )
                        : Theme.of(context).textTheme.titleLarge,
                  ),
          ),
          ...sections
        ],
      );
    }
    return Column(
      children: [], // A nothing
    );
    // return LoadingPage();
  }
}
