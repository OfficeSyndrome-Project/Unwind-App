import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/head_and_sub_result_nrs_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/question_box_nrs_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ResultNrsFourWeekPage extends StatefulWidget {
  const ResultNrsFourWeekPage({Key? key}) : super(key: key);

  @override
  State<ResultNrsFourWeekPage> createState() => _ResultNrsFourWeekPageState();
}

class _ResultNrsFourWeekPageState extends State<ResultNrsFourWeekPage> {
  int index = 0;

  String generateBtnTitle(int index) {
    if (index == 0) {
      return 'ถัดไป';
    } else if (index == 1) {
      return 'ยืนยัน';
    }
    return 'ดำเนินการต่อ';
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            setState(() {
              if (index == 0) {
                Navigator.pop(context);
              } else {
                index -= 1;
              }
            });
          },
          color: Theme.of(context).colorScheme.primary),
      colorBar: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              index == 2
                  ? SizedBox()
                  : HeadAndSubResultNrsWidget(
                      title: 'ปัจจุบันผ่านมาทั้งหมด 4 สัปดาห์',
                      subtitle: 'ค่า NRS ของคุณเฉลี่ยคือ ${3}'),
              IndexedStack(
                index: index,
                children: [
                  Center(
                    child: QuestionBoxNrsWidget(
                      questionPage: index,
                      questionId: index,
                      questions:
                          'จากระยะเวลาที่ผ่านมา 4 สัปดาห์\nคุณมีอาการดีขึ้นจากการทำชุดท่านี้',
                      assetName:
                          'lib/assets/images/workout/result_nrs_four_week_1.png',
                      onChanged: (p0) {
                        print('p0 ${p0}');
                      },
                    ),
                  ),
                  Center(
                    child: QuestionBoxNrsWidget(
                      questionPage: index,
                      questionId: index,
                      questions: 'คุณต้องการบริหารด้วยชุดท่านี้ต่อใช่หรือไม่',
                      assetName:
                          'lib/assets/images/workout/result_nrs_four_week_2.png',
                      onChanged: (p1) {
                        print('p1 ${p1}');
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatioImageoneToOne(
                            assetName:
                                'lib/assets/images/workout/result_nrs_four_week_3.png',
                            smallWidth: 240,
                            largeWidth: 340,
                            smallHeight: 240,
                            largeHeight: 340),
                        HeadAndSubResultNrsWidget(
                          title: 'ทางเราต้องขออภัย',
                          subtitle:
                              'หากท่านอาการไม่ดีขึ้นภายในระยะเวลา 4 สัปดาห์\nควรพบแพทย์เพื่อตรวจสอบสาเหตุของอาการ',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              setState(() {
                setState(() {
                  if (index == 2) {
                    Navigator.pop(context);
                  } else {
                    index += 1;
                  }
                });
              });
            },
            text: generateBtnTitle(index),
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
                : Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
