import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';

class PosturePartThreeWidget extends StatefulWidget {
  final List<ScreeningPartThreePostureModel> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  final void Function(int) Function(int)? onChanged;
  // final ScreeningPartOneModel question;

  const PosturePartThreeWidget({
    super.key,
    required this.questions,
    required this.currentPage,
    required this.pageRoutes,
    required this.controller,
    this.onChanged,
  });

  @override
  State<PosturePartThreeWidget> createState() => _PosturePartThreeWidgetState();
}

class _PosturePartThreeWidgetState extends State<PosturePartThreeWidget> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;
  void onCurrentOptionsChanged(bool bool) {
    //here
  }

  int? currentOptions;

//question box
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      onChanged: (widget.onChanged != null)
                          ? widget
                              .onChanged!(widget.questions[index].questionId)
                          : null,
                    ),
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
  final void Function(int)? onChanged;

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

class _QuestionAndRadioButtonState extends State<QuestionAndRadioButton> {
  int? currentOptions;
  String get questions => widget.questions;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
                      setState(() {
                        if (widget.onChanged != null) {
                          widget.onChanged!(value);
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
                width: 16,
              ),
              Row(
                children: [
                  GeneralAnimatedCustomRadio<int>(
                      value: 2,
                      groupValue: currentOptions,
                      onChanged: (value) {
                        setState(() {
                          if (widget.onChanged != null) {
                            widget.onChanged!(value);
                          }
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
