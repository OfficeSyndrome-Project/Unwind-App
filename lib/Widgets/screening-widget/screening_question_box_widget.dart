import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';

class ScreeningQuestionBoxWidget extends StatefulWidget {
  final String? assetPath;
  final List<String> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  // final ScreeningPartOneModel question;

  const ScreeningQuestionBoxWidget(
      {super.key,
      required this.assetPath,
      required this.questions,
      required this.currentPage,
      required this.pageRoutes,
      required this.controller});

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

//radio button
  Widget radioWidget(BuildContext context, int? currentOptions) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(
          //   width: 16,
          // ),
          Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Row(children: [
                GeneralAnimatedCustomRadio<int>(
                    value: 1,
                    groupValue: this.currentOptions,
                    onChanged: (value) {
                      setState(() {
                        this.currentOptions = value;
                        // print(value);
                        // print(currentOptions);
                      });
                      // onCurrentOptionsChanged(true);
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor: Theme.of(context).colorScheme.primary),
                Text(
                  'ใช่',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ]),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  GeneralAnimatedCustomRadio<int>(
                      value: 2,
                      groupValue: this.currentOptions,
                      onChanged: (value) {
                        setState(() {
                          this.currentOptions = value;
                          // print(value);
                          // print(currentOptions);
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: Theme.of(context).colorScheme.primary),
                  Text(
                    'ไม่',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              )
            ],
          )
        ]);
  }

//question box
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.assetPath != null) // Check if assetPath is not null

            SizedBox(
              width: 240,
              height: 240,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.assetPath!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          // const SizedBox(
          //   height: 16,
          // ),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              // margin: const EdgeInsets.only(bottom: 24),
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
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) => QuestionAndRadioButton(
                    questions: widget.questions[index],
                    questionId: index,
                    questionPage: widget.currentPage),
              ))
        ]);
  }
}

class QuestionAndRadioButton extends StatefulWidget {
  final String questions;
  final int questionPage;
  final int questionId;
  final String pagename = "screening";

  const QuestionAndRadioButton({
    super.key,
    required this.questionPage,
    required this.questionId,
    required this.questions,
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
          style: Theme.of(context).textTheme.titleMedium,
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
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Row(children: [
                    GeneralAnimatedCustomRadio<int>(
                        value: 1,
                        groupValue: currentOptions,
                        onChanged: (value) {
                          setState(() {
                            currentOptions = value;
                            // print(widget.questionId);
                            // print(value);
                            // print(currentOptions);
                          });
                          // onCurrentOptionsChanged(true);
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor: Theme.of(context).colorScheme.primary),
                    Text(
                      'ใช่',
                      style: Theme.of(context).textTheme.bodyLarge,
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
                            setState(() {
                              currentOptions = value;
                              // print(widget.questionId);
                              // print(value);
                              // print(currentOptions);
                            });
                          },
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveColor: Theme.of(context).colorScheme.primary),
                      Text(
                        'ไม่',
                        style: Theme.of(context).textTheme.bodyLarge,
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
