import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class PostuerWidget extends StatefulWidget {
  final List<ScreeningPartTwoPostureModel> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  final void Function(Answer) onChanged;
  final Function(bool)? onCompleted;
  // final ScreeningPartOneModel question;

  const PostuerWidget({
    super.key,
    required this.questions,
    required this.currentPage,
    required this.pageRoutes,
    required this.controller,
    required this.onChanged,
    this.onCompleted,
  });

  @override
  State<PostuerWidget> createState() => _PostuerWidgetState();
}

class _PostuerWidgetState extends State<PostuerWidget> {
  void onCurrentOptionsChanged(bool bool) {
    //here
  }

  int? currentOptions;

  List<Answer> answers = [];

//question box
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(top: 32),
              width: double.infinity,
              constraints: BoxConstraints(
                  maxHeight: ResponsiveCheckWidget.isSmallMobile(context)
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height), //70 % screen size

              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  bool isOverFlow = constraints.maxHeight <
                      MediaQuery.of(context).size.height;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.questions.length,
                    physics: isOverFlow
                        ? ClampingScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => QuestionAndRadioButton(
                        questions: widget.questions[index].question,
                        questionId: index,
                        questionPage: widget.currentPage,
                        posture: widget.questions[index].postureName,
                        assetName: widget.questions[index].assetPath,
                        onChanged: (value) {
                          final answer = Answer(
                            questionPart: 2,
                            title: widget.questions[index].title,
                            questionId: widget.questions[index].questionId,
                            answer: value,
                          );
                          setState(() {
                            answers = Answer.updateAnswer(answers, answer);
                            if (widget.onCompleted != null) {
                              widget.onCompleted!(
                                  answers.length == widget.questions.length);
                            }
                          });
                          widget.onChanged(answer);
                        }),
                  );
                },
              ))
        ]);
  }
}

class QuestionAndRadioButton extends StatefulWidget {
  final String questions;
  final int questionPage;
  final int questionId;
  final String pagename = "screening";
  final String posture;
  final String assetName;
  final void Function(dynamic)? onChanged;

  const QuestionAndRadioButton({
    super.key,
    required this.questionPage,
    required this.questionId,
    required this.questions,
    required this.posture,
    required this.assetName,
    this.onChanged,
  });

  @override
  State<QuestionAndRadioButton> createState() => _QuestionAndRadioButtonState();
}

class _QuestionAndRadioButtonState extends State<QuestionAndRadioButton>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  int? currentOptions;
  String get questions => widget.questions;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Text(
            widget.posture,
            style: TextStyle(
              fontFamily: "Noto Sans Thai",
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3B67CD),
            ),
          ),
        ),
        RatioImageoneToOne(
          assetName: widget.assetName,
          smallWidth: 200,
          largeWidth: 280,
          smallHeight: 200,
          largeHeight: 280,
        ),
        Container(
          margin: EdgeInsets.only(top: 32, bottom: 4),
          child: Text(
            questions,
            textAlign: TextAlign.center,
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  )
                : Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                width: 16,
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
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: Theme.of(context).colorScheme.primary),
                  Text(
                    'ไม่',
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
            ])
      ],
    );
  }
}
