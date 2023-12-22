import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';

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
          style: ResponsiveCheckWidget.isSmallMobile(context)
              ? TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF484D56),
                )
              : Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'คำแนะนำ',
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3B67CD),
                      )
                    : Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\u2022',
                      style: ResponsiveCheckWidget.isSmallMobile(context)
                          ? TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF484D56),
                            )
                          : Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Text(
                      question.solution,
                      style: ResponsiveCheckWidget.isSmallMobile(context)
                          ? TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF484D56),
                            )
                          : Theme.of(context).textTheme.bodyLarge,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'ป้องกัน',
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3B67CD),
                      )
                    : Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\u2022',
                      style: ResponsiveCheckWidget.isSmallMobile(context)
                          ? TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF484D56),
                            )
                          : Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Text(
                      question.prevent,
                      style: ResponsiveCheckWidget.isSmallMobile(context)
                          ? TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF484D56),
                            )
                          : Theme.of(context).textTheme.bodyLarge,
                    ),
                  ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
