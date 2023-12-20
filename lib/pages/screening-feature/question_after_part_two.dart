import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/part_two_question_box_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/posture_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

class QuestionAfterPartTwo extends StatefulWidget {
  final Map<String, bool> onSelectMap;
  const QuestionAfterPartTwo({super.key, required this.onSelectMap});

  @override
  State<QuestionAfterPartTwo> createState() => _QuestionAfterPartTwoState();
}

class _QuestionAfterPartTwoState extends State<QuestionAfterPartTwo> {
  PageRoutes pageRoutes = PageRoutes();
  int currentPage = 0;
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  late List<String> titleList;

  double oncurrentNRS = 0;
  late List<MapEntry<String, bool>> typeList = widget.onSelectMap.entries
      .where((element) => element.value == true)
      .toList();
  // late ScreeningPartTwoModel servicePart =
  //     ScreeningQuestionPartTwoService.getScreeningPartTwoModelBySelectedPart(
  //         typeList.map((part) => part.key).first);

  //new
  late List<ScreeningPartTwoModel> selectedParts =
      ScreeningQuestionPartTwoService.getScreeningPartTwoModelByListOfParts(
          typeList.map((part) => part.key).toList());

  @override
  Widget build(BuildContext context) {
    // Planning questions widgets that should be presented on each pages, multiple parts

    List<Widget> questionsWidgets_ = [];
    int pageAmount = 0;
    ScreeningPartTwoModel.sortByPartOrder(selectedParts);
    // print('selectedParts.length : ${selectedParts.length}');
    // selectedParts.forEach((element) => print(element.selectedPart.partOrder));
    for (var part in selectedParts) {
      pageAmount += part.selectedPart.questionPage.length;
      // Append each designated questions on the available pages
      var pageAmountOfQuestion =
          part.questions.map((e) => e.questionPage).toSet().length;

      for (int pageNumber = 0;
          pageNumber < pageAmountOfQuestion;
          pageNumber++) {
        var questionWidget = PartTwoQuestionBoxWidget(
          typePain: part.selectedPart.title,
          assetPath: part.selectedPart.assetPath,
          questions: ScreeningQuestionPartTwoService.getQuestionsByPage(
              part.questions, pageNumber),
          currentPage: currentPage,
          pageRoutes: pageRoutes,
          controller: _controller,
          questionID: part.questions.map((e) => e.questionId).toList(),
        );
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
        );
        questionsWidgets_.add(postureWidget);
      }
    }
    // List<Widget> questionsWidgets = servicePart.questions
    //     .map(
    //       (data) => PartTwoQuestionBoxWidget(
    //         typePain: servicePart.selectedPart.title,
    //         assetPath: servicePart.selectedPart.assetPath,
    //         questions: ScreeningQuestionPartTwoService.getQuestionsByPage(
    //             servicePart.questions, currentPage),
    //         currentPage: currentPage,
    //         pageRoutes: pageRoutes,
    //         controller: _controller,
    //         questionID: servicePart.questions.map((e) => e.questionId).toList(),
    //       ),
    //     )
    //     .toList();
    // List<Widget> postureWidget = servicePart.postures
    //     .map((data) => PostuerWidget(
    //           questions: ScreeningQuestionPartTwoService.getPostureByPage(
    //               servicePart.postures, currentPage),
    //           currentPage: currentPage,
    //           pageRoutes: pageRoutes,
    //           controller: _controller,
    //         ))
    //     .toList();

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
                    print('currentPage ${value}');
                  });
                },
                children: [
                  // ...questionsWidgetsTest,
                  // ...questionsWidgets,
                  // ...postureWidget,
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
                currentPage < pageAmount - 1
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpage(1)
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
