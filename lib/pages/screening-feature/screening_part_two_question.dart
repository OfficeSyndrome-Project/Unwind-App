import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
// import 'package:unwind_app/services/screening-service/screening_service.dart';
// import 'package:unwind_app/Widgets/test_widget.dart';

//select point to check
class ScreeningPartTwoQuestion extends StatefulWidget {
  const ScreeningPartTwoQuestion({super.key});

  @override
  State<ScreeningPartTwoQuestion> createState() =>
      _ScreeningPartTwoQuestionState();
}

class _ScreeningPartTwoQuestionState extends State<ScreeningPartTwoQuestion> {
  PageRoutes pageRoutes = PageRoutes();

  int currentPage = 0;

  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    // List<Widget> questiosnWidgets =
    //     ScreeningQuestionPartTwoService.getAllChoice()
    //         .map((questionPage) => TestWidget(
    //               title: questionPage.title,
    //               assetPath: questionPage.assetPath,
    //               currentPage: currentPage,
    //               pageRoutes: pageRoutes,
    //               controller: _controller,
    //             ))
    //         .toList();
    //เอาคำถามออกมา
    // List<Widget> questiosnWidgets2 =
    //     ScreeningQuestionPartTwoService.getAllChoice()
    //         .map((questionPage) => TestWidget2(
    //               question: ScreeningQuestionPartTwoService.getQuestionsByTypeA(
    //                   questionPage.questionType),
    //             ))
    //         // .first();
    // //         .toList();
    // Widget questiosnWidgets2 = TestWidget2(
    //     question:
    //         ScreeningQuestionPartTwoService.getQuestionsBySelectedPart("คอ"));
    // print("คำถาม เยอะๆ");
    // print(ScreeningQuestionPartTwoService.getQuestionsBySelectedPart("บ่า"));

    return AppscreenTheme(
        iconButtonStart: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            // currentPage >= 1
            //           ? _controller.previousPage(
            //               duration: const Duration(milliseconds: 500),
            //               curve: Curves.easeOut)
            //           : Navigator.pop(context);
            Navigator.pop(context);
          },
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          color: Theme.of(context).colorScheme.primary,
        ),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              // width: double.infinity,
              // height: 448,
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
              // ...questiosnWidgets,
              // ...questiosnWidgets2
              Text("questions should appear here")
            ],
          )),
          ButtonWithoutIconWidget(
            onTap: () {
              // print("currentPage: $currentPage");
              // currentPage < questiosnWidgets.length - 1
              //     ? _controller.nextPage(
              //         duration: const Duration(milliseconds: 300),
              //         curve: Curves.easeOut,
              //       )
              //     : Navigator.push(
              //         context,
              //         pageRoutes.screening
              //             .introscreeningpageparttwo()
              //             .route(context));
            },
            text: "ถัดไป",
            radius: 32,
            width: 345,
            height: 52,
            color: Theme.of(context).colorScheme.primary,
            borderSide: BorderSide.none,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ]);
  }
}
