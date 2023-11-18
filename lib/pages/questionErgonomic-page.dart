// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes-config.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';
import 'package:unwind_app/services/question-service.dart';

import '../Widgets/pageQuestion-widget.dart';
import '../globals/theme/buttomtap-theme.dart';

class QuestionErgonomicPage extends StatefulWidget {
  const QuestionErgonomicPage({Key? key}) : super(key: key);

  @override
  _QuestionErgonomicPageState createState() => _QuestionErgonomicPageState();
}

class _QuestionErgonomicPageState extends State<QuestionErgonomicPage> {
  // bool? currentOptions;

  int currentPage = 0;
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);
  PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    List<Widget> questionsPageWidgets = List.generate(
        6,
        (index) => PageQuestionWidget(
              questions: QuestionService.getQuestionsbyIdCategory(index + 1),
              idCategory: index + 1,
              widget: DetectorButtom(
                  currentPage: currentPage,
                  pageRoutes: pageRoutes,
                  controller: _controller),
            ));

    return AppscreenTheme(
        textBar: "ปรับสภาพแวดล้อมการทำงาน",
        iconButtonStart: IconButton(
          onPressed: () {
            currentPage >= 1
                ? _controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut)
                : Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
        ),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: questionsPageWidgets,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ]);
  }
}

//buttom---------------------------------------------------------------------------
class DetectorButtom extends StatelessWidget {
  const DetectorButtom({
    super.key,
    required this.currentPage,
    required this.pageRoutes,
    required PageController controller,
  }) : _controller = controller;

  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentPage == 5
            ? Navigator.push(
                context, pageRoutes.menu.resultergonomic().route(context))
            : _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
      },
      child: ButtomTapTheme(
          "ถัดไป",
          32,
          double.infinity,
          52,
          Theme.of(context).colorScheme.primary,
          BorderSide.none,
          Theme.of(context).textTheme.headlineSmall),
    );
  }
}
