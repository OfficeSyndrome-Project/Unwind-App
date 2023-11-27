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
        Text(
          '${question.questionOrder}.${question.question}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'คำแนะนำ :',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                question.solution,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'ป้องกัน :',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                question.prevent,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
