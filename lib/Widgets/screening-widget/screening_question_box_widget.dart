import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';

class ScreeningQuestionBoxWidget extends StatefulWidget {
  final String? assetPath;
  final List<ScreeningPartOneModel> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  final void Function(int, int) onChanged;
  // final ScreeningPartOneModel question;

  const ScreeningQuestionBoxWidget(
      {super.key,
      required this.assetPath,
      required this.questions,
      required this.currentPage,
      required this.pageRoutes,
      required this.controller,
      required this.onChanged});

  @override
  State<ScreeningQuestionBoxWidget> createState() =>
      _ScreeningQuestionBoxWidgetState();
}

class _ScreeningQuestionBoxWidgetState
    extends State<ScreeningQuestionBoxWidget> {
  void onCurrentOptionsChanged(bool bool) {
    //here
  }

  int? currentOptions;

//question box
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.assetPath != null) // Check if assetPath is not null
            RatioImageoneToOne(
              assetName: widget.assetPath!,
              smallWidth: 200,
              largeWidth: 250,
              smallHeight: 200,
              largeHeight: 250,
            ),
          Container(
              width: double.infinity,
              constraints: BoxConstraints(
                  maxHeight: ResponsiveCheckWidget.isSmallMobile(context)
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height), //70 % screen size
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
                        onChanged: (value) {
                          widget.onChanged(
                              widget.questions[index].questionId, value);
                        },
                        questionPage: widget.currentPage),
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
  final void Function(dynamic)? onChanged;

  const QuestionAndRadioButton({
    super.key,
    required this.questionPage,
    required this.questionId,
    required this.questions,
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
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Row(children: [
                    GeneralAnimatedCustomRadio<int>(
                        value: 1,
                        groupValue: currentOptions,
                        onChanged: (value) {
                          widget.onChanged!(value);
                          setState(() {
                            currentOptions = value;
                          });
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
                    height: 4,
                  ),
                  Row(
                    children: [
                      GeneralAnimatedCustomRadio<int>(
                          value: 2,
                          groupValue: currentOptions,
                          onChanged: (value) {
                            widget.onChanged!(value);
                            setState(() {
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
