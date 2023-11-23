import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/data/ergonomic_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';
import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/services/question_service.dart';
import 'package:unwind_app/services/storedoptions_service.dart';

import '../../Widgets/ergonomic-widget/erg_boxcategory_widget.dart';

// ignore: must_be_immutable
class ResultErgonomicPage extends StatefulWidget {
  const ResultErgonomicPage({super.key});

  @override
  State<ResultErgonomicPage> createState() => _ResultErgonomicPageState();
}

class _ResultErgonomicPageState extends State<ResultErgonomicPage> {
  final PageRoutes pageRoutes = PageRoutes();
  final int index = 0;

  final List<int> allIdCategory = QuestionService.getAllIdCategory();
  Map<int, Map<int, bool?>> allStoredOptions = {};

  @override
  void initState() {
    super.initState();
    initAllStoredOptions();
  }

  Future<void> initAllStoredOptions() async {
    Map<int, Map<int, bool?>> listOfStoredOptions = {};

    //loop
    for (var idCategory in allIdCategory) {
      listOfStoredOptions[idCategory] =
          await StoredOptionsService.readCurrntOptions(idCategory);
    }
    setState(() {
      allStoredOptions = listOfStoredOptions;
    });
  }

  List<ErgonomicModel> filteredOptionsQuestions(int idCategory) {
    var questions = QuestionService.getQuestionsByIdCategory(idCategory);
    var storedOption = allStoredOptions[idCategory];
    return questions
        .where((question) => storedOption![question.questionOrder] == false)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (allStoredOptions.isEmpty) {
      return const LoadingPage();
    }
    return AppscreenTheme(
        textBar: pageRoutes.menu.resultergonomic().title,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.receipt,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "ผลลัพธ์",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: ListView.separated(
                    itemBuilder: (context, index) => CategoryErgBoxWidget(
                          idCategory: allIdCategory[index],
                          type: QuestionService.getTypeByIdCategory(
                              allIdCategory[index]),
                          questions:
                              filteredOptionsQuestions(allIdCategory[index]),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                    itemCount: allIdCategory.length)),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              StoredOptionsService.clearStoredOptions();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: ButtomTapTheme(
                text: "กลับเมนู",
                radius: 32,
                width: double.infinity,
                height: 52,
                color: Theme.of(context).colorScheme.primary,
                borderSide: BorderSide.none,
                style: Theme.of(context).textTheme.headlineSmall),
          )
        ]);
  }
}
