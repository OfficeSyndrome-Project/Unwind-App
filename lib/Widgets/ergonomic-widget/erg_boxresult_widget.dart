import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/data/ergonomic_model.dart';

class ErgBoxresultWidget extends StatelessWidget {
  final ErgonomicModel question;
  const ErgBoxresultWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          '${question.questionOrder}.${question.question}',
          style: Theme.of(context).textTheme.bodyLarge,
          maxFontSize: 16,
          minFontSize: 14,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'คำแนะนำ :',
                style: Theme.of(context).textTheme.bodySmall,
                maxFontSize: 16,
                minFontSize: 14,
              ),
              AutoSizeText(
                question.solution,
                style: Theme.of(context).textTheme.bodyLarge,
                maxFontSize: 16,
                minFontSize: 14,
              ),
              const SizedBox(
                height: 8,
              ),
              AutoSizeText(
                'ป้องกัน :',
                style: Theme.of(context).textTheme.bodySmall,
                maxFontSize: 16,
                minFontSize: 14,
              ),
              AutoSizeText(
                question.prevent,
                style: Theme.of(context).textTheme.bodyLarge,
                maxFontSize: 16,
                minFontSize: 14,
              ),
            ],
          ),
        )
      ],
    );
  }
}
