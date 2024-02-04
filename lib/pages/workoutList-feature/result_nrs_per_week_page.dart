import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/head_and_sub_result_nrs_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/row_result_nrs_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ResultNrsPerWeekPage extends StatelessWidget {
  const ResultNrsPerWeekPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Theme.of(context).colorScheme.primary),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: RatioImageoneToOne(
                    assetName:
                        'lib/assets/images/workout/result_nrs_per_week.png',
                    smallWidth: 240,
                    largeWidth: 280,
                    smallHeight: 240,
                    largeHeight: 280),
              ),
              HeadAndSubResultNrsWidget(
                title: 'ปัจจุบันผ่านมาทั้งหมด 1 สัปดาห์',
                subtitle: 'คุณมีอาการที่ดีขึ้น ! โปรดตั้งใจบริหารร่างกายต่อไป',
              ),
              RowResultNrsWidget(
                firstNrs: 6,
                lastestNrs: 6,
              )
            ],
          )),
          ButtonWithoutIconWidget(
              onTap: () {},
              text: "ยืนยัน",
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
        ]);
  }
}
