import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_btn_widget.dart';
import 'package:unwind_app/services/question_service.dart';
import '../../Routes/routes_config.dart';
import '../../services/storedoptions_service.dart';
import '../../data/ergonomic_model.dart';
import 'erg_boxquestion_widget.dart';
import 'dart:async';

class PageQuestionWidget extends StatefulWidget {
  final int idCategory;
  final Map<int, bool?> storedOptions = {};
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;

  PageQuestionWidget({
    super.key,
    required this.questions,
    required this.idCategory,
    required this.currentPage,
    required this.pageRoutes,
    required this.controller,
  });

  final List<ErgonomicModel> questions;

  @override
  State<PageQuestionWidget> createState() => _PageQuestionWidgetState();
}

class _PageQuestionWidgetState extends State<PageQuestionWidget> {
  var index = 0;
  bool disable = true;

  //initailize
  Map<int, bool?> createDefaultOption(int length) {
    return {for (int i = 1; i <= length; i++) i: null};
  }

  late Map<int, bool?> storedOptions =
      createDefaultOption(widget.questions.length);

  @override
  void initState() {
    super.initState();
    initOptions();
  }

  Future<void> initOptions() async {
    var storedOptionsData =
        await StoredOptionsService.readCurrntOptions(widget.idCategory);
    setState(() {
      storedOptions = storedOptionsData;
    });
    checkAndUpdateDisable();
  }

  //set state btn
  void checkAndUpdateDisable() {
    for (var i = 1;
        i <= QuestionService.getLenghtByIdCategory(widget.idCategory);
        i++) {
      if (storedOptions[i] == null) {
        return;
      }
    }
    setDisable(!disable);
  }

  void setDisable(bool value) {
    setState(() {
      disable = value;
    });
  }

  //set state new
  Future<void> handleCurrentOptions(int questionIndex, bool value) async {
    await StoredOptionsService.writeCurrentOptions(
        questionIndex, value, widget.idCategory);
    setState(() {
      storedOptions = Map<int, bool?>.from(storedOptions)
        ..[questionIndex] = value;
    });
    checkAndUpdateDisable();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ส่วนที่ ${widget.idCategory} ${widget.questions.first.category}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: widget.questions.length + 1,
            itemBuilder: (context, index) {
              if (index < widget.questions.length) {
                return SizedBox(
                    width: double.infinity,
                    child: QuestionEegonomicWidget(
                      index: widget.questions[index].questionOrder,
                      currentOptions: storedOptions,
                      question: widget.questions[index].question,
                      imagePath: widget.questions[index].imagepath,
                      onCurrentOptionsChanged: (value) {
                        handleCurrentOptions(
                            widget.questions[index].questionOrder, value);
                      },
                    ));
              } else {
                return DetectorButton(
                    currentPage: widget.currentPage,
                    pageRoutes: widget.pageRoutes,
                    controller: widget.controller,
                    disable: disable);
              }
            },
          ),
        )),
      ],
    );
  }
}
