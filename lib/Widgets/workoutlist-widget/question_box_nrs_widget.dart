import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/general_radio_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class QuestionBoxNrsWidget extends StatefulWidget {
  final String questions;
  final int questionPage;
  final int questionId;
  final String pagename = "screening";
  final String assetName;
  final void Function(int)? onChanged;

  const QuestionBoxNrsWidget({
    super.key,
    required this.questionPage,
    required this.questionId,
    required this.questions,
    required this.assetName,
    this.onChanged,
  });

  @override
  State<QuestionBoxNrsWidget> createState() => _QuestionBoxNrsWidgetState();
}

class _QuestionBoxNrsWidgetState extends State<QuestionBoxNrsWidget> {
  int? currentOptions;
  String get questions => widget.questions;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        RatioImageoneToOne(
            assetName: widget.assetName,
            smallWidth: 240,
            largeWidth: 280,
            smallHeight: 240,
            largeHeight: 280),
        Container(
          margin: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            widget.questions,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF484D56),
            ),
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
