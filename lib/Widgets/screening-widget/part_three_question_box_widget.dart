import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class PartThreeQuestionBoxWidget extends StatefulWidget {
  final List<ScreeningPartThreeQuestionModel> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  final String title;
  final void Function(Answer)? onChanged;

  // final ScreeningPartOneModel question;

  const PartThreeQuestionBoxWidget({
    super.key,
    required this.questions,
    required this.currentPage,
    required this.pageRoutes,
    required this.controller,
    required this.title,
    this.onChanged,
  });

  @override
  State<PartThreeQuestionBoxWidget> createState() =>
      _PartThreeQuestionBoxWidgettState();
}

class _PartThreeQuestionBoxWidgettState
    extends State<PartThreeQuestionBoxWidget>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  void onCurrentOptionsChanged(bool bool) {}

  int? currentOptions;
  // int index = 0;

//question box
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        width: double.infinity,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height), //70 % screen size
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
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemBuilder: (context, index) => QuestionAndRadioButton(
            questions: widget.questions[index].question,
            questionId: widget.questions[index].questionId,
            questionPage: widget.currentPage,
            title: widget.title,
            onChanged: widget.onChanged,
          ),
        ));
  }
}

class QuestionAndRadioButton extends StatefulWidget {
  final String questions;
  final int questionPage;
  final int questionId;
  final String pagename = "screening";
  final String title;
  final void Function(Answer)? onChanged;

  const QuestionAndRadioButton({
    super.key,
    required this.questionPage,
    required this.questionId,
    required this.questions,
    required this.title,
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.questionId.toString()}. ' + questions,
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
              Column(
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
                          setState(() {
                            if (widget.onChanged != null) {
                              widget.onChanged!(
                                Answer(
                                  questionPart: 3,
                                  title: widget.title,
                                  questionId: widget.questionId,
                                  answer: value,
                                ),
                              );
                            }
                            currentOptions = value;
                          });
                          // onCurrentOptionsChanged(true);
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor: Theme.of(context).colorScheme.primary),
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
                            setState(() {
                              if (widget.onChanged != null) {
                                widget.onChanged!(
                                  Answer(
                                    questionPart: 3,
                                    title: widget.title,
                                    questionId: widget.questionId,
                                    answer: value,
                                  ),
                                );
                              }
                              currentOptions = value;
                            });
                          },
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveColor: Theme.of(context).colorScheme.primary),
                      Text(
                        'ไม่ใช่',
                        style: ResponsiveCheckWidget.isSmallMobile(context)
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
