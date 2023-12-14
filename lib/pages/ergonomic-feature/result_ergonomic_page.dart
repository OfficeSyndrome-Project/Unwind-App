import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/services/ergonomics-service/question_service.dart';
import 'package:unwind_app/services/ergonomics-service/storedoptions_service.dart';
import '../../Widgets/button_withouticon_widget.dart';
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

  bool isAllStoredOptionsTrue(List<int> allIdCategory) {
    for (var idCategory in allIdCategory) {
      var storedOption = allStoredOptions[idCategory];
      var listStoredOptions = storedOption!.values.toList();
      if (listStoredOptions.contains(false) ||
          listStoredOptions.contains(null)) {
        return false;
      }
    }
    return true;
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      )
                    : Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          isAllStoredOptionsTrue(allIdCategory)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.white,
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 4,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Text(
                        'ยินดีด้วยคุณไม่มีปัญหากับท่าทางการนั่งในการทำงาน',
                        style: TextStyle(
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 14
                              : 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF484D56),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      'คุณสามารถกลับมาทำแบบทดสอบนี้ใหม่ได้ในอนาคต',
                      style: TextStyle(
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 12
                              : 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF7F8795)),
                    )
                  ],
                )
              : Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (notification) {
                        notification.disallowIndicator();
                        return true;
                      },
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              filteredOptionsQuestions(allIdCategory[index])
                                      .isEmpty
                                  ? SizedBox()
                                  : CategoryErgBoxWidget(
                                      idCategory: allIdCategory[index],
                                      type: QuestionService.getTypeByIdCategory(
                                          allIdCategory[index]),
                                      questions: filteredOptionsQuestions(
                                          allIdCategory[index]),
                                    ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: filteredOptionsQuestions(
                                            allIdCategory[index])
                                        .isEmpty
                                    ? 0
                                    : 16,
                              ),
                          itemCount: allIdCategory.length)),
                ),
          const SizedBox(
            height: 16,
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                StoredOptionsService.clearStoredOptions();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              text: "กลับเมนู",
              radius: 32,
              width: double.infinity,
              height: 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: Theme.of(context).textTheme.headlineSmall),
        ]);
  }
}
