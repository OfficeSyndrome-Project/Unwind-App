// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/question_service.dart';
import 'package:unwind_app/services/storedoptions_service.dart';
import '../../Widgets/ergonomic-widget/erg_rowsquestion_widget.dart';
import '../../globals/theme/button_withouticon_theme.dart';

class QuestionErgonomicPage extends StatefulWidget {
  const QuestionErgonomicPage({super.key});

  @override
  _QuestionErgonomicPageState createState() => _QuestionErgonomicPageState();
}

class _QuestionErgonomicPageState extends State<QuestionErgonomicPage> {
  int currentPage = 0;
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);
  PageRoutes pageRoutes = PageRoutes();

  bool disable = true;
  void setDisable(bool value) {
    setState(() {
      disable = value;
    });
  }

  void handleBackWard(BuildContext context) {
    StoredOptionsService.clearStoredOptions();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> questionsPageWidgets = QuestionService.getAllIdCategory()
        .map((idCategory) => PageQuestionWidget(
              questions: QuestionService.getQuestionsByIdCategory(idCategory),
              idCategory: idCategory,
              widget: DetectorButtom(
                currentPage: currentPage,
                pageRoutes: pageRoutes,
                controller: _controller,
                disable: disable,
                updateDisable: setDisable,
              ),
              updateDisable: setDisable,
            ))
        .toList();

    return AppscreenTheme(
        textBar: "ปรับสภาพแวดล้อมการทำงาน",
        iconButtonStart: IconButton(
          onPressed: () {
            currentPage >= 1
                ? _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut)
                : handleBackWard(context);
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
  const DetectorButtom(
      {super.key,
      required this.currentPage,
      required this.pageRoutes,
      required PageController controller,
      required this.disable,
      required this.updateDisable})
      : _controller = controller;

  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController _controller;
  final bool disable;
  final Function(bool) updateDisable;

  void handleOnTap(BuildContext context) {
    currentPage == 5
        ? Navigator.push(
            context, pageRoutes.menu.resultergonomic().route(context))
        : _controller.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    updateDisable(true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disable) {
          handleOnTap(context);
        }
      },
      child: ButtomTapTheme(
          text: "ถัดไป",
          radius: 32,
          width: double.infinity,
          height: 52,
          color: Theme.of(context).colorScheme.primary,
          borderSide: BorderSide.none,
          style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
