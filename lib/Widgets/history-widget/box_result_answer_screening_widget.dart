import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/history-widget/box_have_img.dart';
import 'package:unwind_app/Widgets/history-widget/box_only_q.dart';

class BoxResultAnswerScreeningWidget extends StatelessWidget {
  final String question;
  final String answer;
  final String? assetPath;
  final String? name;

  const BoxResultAnswerScreeningWidget({
    super.key,
    required this.question,
    required this.answer,
    this.assetPath,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (assetPath != null)
          BoxHaveImg(question: question, answer: answer, name: name!),
        BoxOnlyQ(question: question, answer: answer)
      ],
    );
  }
}
