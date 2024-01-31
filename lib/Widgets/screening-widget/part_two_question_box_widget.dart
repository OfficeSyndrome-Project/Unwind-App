import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class PartTwoQuestionBoxWidget extends StatefulWidget {
  final String? assetPath;
  final List<ScreeningPartTwoQuestionModel> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  final String title;
  final List<int> questionID;
  final void Function(Answer) onChanged;
  final Function(bool)? onCompleted;
  // final ScreeningPartOneModel question;

  const PartTwoQuestionBoxWidget({
    super.key,
    required this.assetPath,
    required this.questions,
    required this.currentPage,
    required this.pageRoutes,
    required this.controller,
    required this.title,
    required this.questionID,
    required this.onChanged,
    this.onCompleted,
  });

  @override
  State<PartTwoQuestionBoxWidget> createState() =>
      _PartTwoQuestionBoxWidgettState();
}

class _PartTwoQuestionBoxWidgettState extends State<PartTwoQuestionBoxWidget>
    with AutomaticKeepAliveClientMixin {
  List<Answer> answers = [];

  void onCurrentOptionsChanged(bool bool) {}

  int? currentOptions;
  // int index = 0;

  @override
  bool get wantKeepAlive => true;

//question box
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3B67CD),
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16),
            child: RatioImageoneToOne(
              assetName: widget.assetPath!,
              smallWidth: 120,
              largeWidth: 140,
              smallHeight: 120,
              largeHeight: 140,
            ),
          ),
          Container(
            width: double.infinity, //70 % screen size
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.questions.length,
              physics: NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemBuilder: (context, index) => QuestionAndRadioButton(
                topic: widget.questions[index].topic,
                questions: widget.questions[index].question,
                questionId: widget.questions[index].questionId,
                questionPage: widget.currentPage,
                onChanged: (value) {
                  // Set state

                  answers = Answer.updateAnswer(
                      answers,
                      Answer(
                        questionPart: widget.questions[index].questionPart,
                        title: widget.title,
                        questionId: widget.questions[index].questionId,
                        answer: value,
                      ));

                  if (widget.onCompleted != null) {
                    widget.onCompleted!(
                        answers.length == widget.questions.length);
                  }

                  print(answers.length == widget.questions.length);

                  widget.onChanged(Answer(
                      questionPart: widget.questions[index].questionPart,
                      title: widget.title,
                      questionId: widget.questions[index].questionId,
                      answer: value));
                },
              ),
            ),
          ),
        ]);
  }
}

class QuestionAndRadioButton extends StatefulWidget {
  final String questions;
  final int questionPage;
  final int questionId;
  final String pagename = "screening";
  final String? topic;
  final void Function(dynamic)? onChanged;

  const QuestionAndRadioButton({
    super.key,
    required this.questionPage,
    required this.questionId,
    required this.questions,
    this.topic,
    this.onChanged,
  });

  @override
  State<QuestionAndRadioButton> createState() => _QuestionAndRadioButtonState();
}

class _QuestionAndRadioButtonState extends State<QuestionAndRadioButton> {
  int? currentOptions;
  String get questions => widget.questions;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.topic == null
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  widget.topic.toString(),
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
        Text(
          questions,
          style: ResponsiveCheckWidget.isSmallMobile(context)
              ? TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF484D56),
                )
              : Theme.of(context).textTheme.titleMedium,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 16,
              ),
              widget.questionPage == 2 && widget.questionId == 4
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(children: [
                          GeneralAnimatedCustomRadio<int>(
                              value: 1,
                              groupValue: currentOptions,
                              onChanged: (value) {
                                if (widget.onChanged != null) {
                                  widget.onChanged!(value);
                                }
                                setState(() {
                                  currentOptions = value;
                                });
                                // onCurrentOptionsChanged(true);
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveColor:
                                  Theme.of(context).colorScheme.primary),
                          Text(
                            'ปวดหนึบๆ แน่นๆ ปวดตึงๆ',
                            style: ResponsiveCheckWidget.isSmallMobile(context)
                                ? TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF484D56),
                                  )
                                : Theme.of(context).textTheme.bodyLarge,
                          ),
                        ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GeneralAnimatedCustomRadio<int>(
                                value: 2,
                                groupValue: currentOptions,
                                onChanged: (value) {
                                  if (widget.onChanged != null) {
                                    widget.onChanged!(value);
                                  }
                                  setState(() {
                                    currentOptions = value;
                                  });
                                },
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                inactiveColor:
                                    Theme.of(context).colorScheme.primary),
                            Text(
                              'ปวดตื้อๆ เหมือนเป็นตะคริว',
                              style:
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF484D56),
                                        )
                                      : Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GeneralAnimatedCustomRadio<int>(
                                value: 3,
                                groupValue: currentOptions,
                                onChanged: (value) {
                                  if (widget.onChanged != null) {
                                    widget.onChanged!(value);
                                  }
                                  setState(() {
                                    currentOptions = value;
                                  });
                                },
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                inactiveColor:
                                    Theme.of(context).colorScheme.primary),
                            Container(
                              width: 230,
                              child: Text(
                                'ปวดซ่าๆ ชาๆ จี๊ดๆ เหมือนโดนเข็มตำหรือผึ้งต่อย',
                                style:
                                    ResponsiveCheckWidget.isSmallMobile(context)
                                        ? TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF484D56),
                                          )
                                        : Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GeneralAnimatedCustomRadio<int>(
                                value: 4,
                                groupValue: currentOptions,
                                onChanged: (value) {
                                  if (widget.onChanged != null) {
                                    widget.onChanged!(value);
                                  }
                                  setState(() {
                                    currentOptions = value;
                                  });
                                },
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                inactiveColor:
                                    Theme.of(context).colorScheme.primary),
                            Text(
                              'ปวดไหม้แสบร้อน เจ็บแปล็บขึ้นทันทีทันใด',
                              style:
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF484D56),
                                        )
                                      : Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          GeneralAnimatedCustomRadio<int>(
                              value: 1,
                              groupValue: currentOptions,
                              onChanged: (value) {
                                if (widget.onChanged != null) {
                                  widget.onChanged!(value);
                                }
                                setState(() {
                                  currentOptions = value;
                                });
                                // onCurrentOptionsChanged(true);
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveColor:
                                  Theme.of(context).colorScheme.primary),
                          Text(
                            'ใช่',
                            style: ResponsiveCheckWidget.isSmallMobile(context)
                                ? TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF484D56),
                                  )
                                : Theme.of(context).textTheme.bodyLarge,
                          ),
                        ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GeneralAnimatedCustomRadio<int>(
                                value: 2,
                                groupValue: currentOptions,
                                onChanged: (value) {
                                  if (widget.onChanged != null) {
                                    widget.onChanged!(value);
                                  }
                                  setState(() {
                                    currentOptions = value;
                                  });
                                },
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                inactiveColor:
                                    Theme.of(context).colorScheme.primary),
                            Text(
                              'ไม่ใช่',
                              style:
                                  ResponsiveCheckWidget.isSmallMobile(context)
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF484D56),
                                        )
                                      : Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                    )
            ])
      ],
    );
  }
}
