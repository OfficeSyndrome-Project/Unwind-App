import 'package:flutter/material.dart';
import '../data/ergonomic-model.dart';
import 'ergonomicQ-widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../services/storedOptions-service.dart';

class PageQuestionWidget extends StatefulWidget {
  int idCategory;
  Widget widget;
  Map<int, bool?> storedOptions = {};

  PageQuestionWidget({
    Key? key,
    required this.questions,
    required this.widget,
    required this.idCategory,
  }) : super(key: key);

  final List<ErgonomicModel> questions;

  @override
  State<PageQuestionWidget> createState() => _PageQuestionWidgetState();
}

class _PageQuestionWidgetState extends State<PageQuestionWidget> {
  var index = 0;

  //initailize
  Map<int, bool?> createDefaultOption(int length) {
    return {for (int i = 0; i < length; i++) i: null};
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Map<int, bool?> storedOptions =
      createDefaultOption(widget.questions.length);

  @override
  void initState() {
    super.initState();
    initOptions();
  }

  Future<void> initOptions() async {
    var storedOptions =
        await StoredOptionsService.readCurrntOptions(widget.idCategory);
    setState(() {
      storedOptions = storedOptions;
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
    print('storedOptions : $storedOptions');
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
                      index: index,
                      currentOptions: storedOptions,
                      question: widget.questions[index].question,
                      imagePath: widget.questions[index].imagepath,
                      onCurrentOptionsChanged: (value) {
                        handleCurrentOptions(index, value);
                      },
                    ));
              } else {
                return widget.widget;
              }
            },
          ),
        )),
      ],
    );
  }
}
