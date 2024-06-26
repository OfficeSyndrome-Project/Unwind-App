import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/exception_widget.dart';
import 'package:unwind_app/data/screening-data/exception_screening_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/pages/screening-feature/form_after_screening.dart';

class ExceptionPage extends StatelessWidget {
  final int exceptionPart;
  const ExceptionPage({super.key, required this.exceptionPart});

  static List<ExceptionData> exceptionArr = ExceptionData.getData();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      colorBar: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ExceptionBoxWidget(
            assetPath: 'lib/assets/images/screeningPart/exception_screen.png',
            titleLabel: exceptionArr[exceptionPart].titleLabel,
            descriptionLabel: exceptionArr[exceptionPart].descriptionLabel,
          ),
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              if (exceptionPart == 0) {
                String resultText = exceptionArr[3].descriptionLabel;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormAfterScreening(
                    resultText: resultText,
                  );
                }));
              } else {
                Navigator.pop(context);
              }
            },
            text: 'ดำเนินการต่อ',
            radius: 32,
            width: double.infinity,
            height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
            color: Theme.of(context).colorScheme.primary,
            borderSide: BorderSide.none,
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  )
                : Theme.of(context).textTheme.headlineSmall)
      ],
    );
  }
}
