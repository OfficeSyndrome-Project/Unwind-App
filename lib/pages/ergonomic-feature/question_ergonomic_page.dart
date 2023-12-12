import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/question_service.dart';
import 'package:unwind_app/services/storedoptions_service.dart';
import '../../Widgets/ergonomic-widget/erg_rowsquestion_widget.dart';

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
              controller: _controller,
              currentPage: currentPage,
              pageRoutes: pageRoutes,
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
