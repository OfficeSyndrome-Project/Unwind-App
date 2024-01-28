import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/slider_nrs.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class NrsAfterAndBeforePage extends StatelessWidget {
  NrsAfterAndBeforePage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'ก่อนบริหารร่างกาย',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 16
                          : 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF484D56),
                    ),
                  ),
                ),
                RatioImageoneToOne(
                    assetName:
                        'lib/assets/images/screeningPart/select_pain_1.png',
                    smallWidth: 120,
                    largeWidth: 150,
                    smallHeight: 120,
                    largeHeight: 150),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'หากวัดความปวดเป็นตัวเลข\nท่านมีความปวดบริเวณดังกล่าวระดับใด',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF484D56),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SliderNrs(),
              ],
            ),
          ),
          ButtonWithoutIconWidget(
              onTap: () {
                Navigator.push(context,
                    pageRoutes.workout.preparebeforeworkout().route(context));
              },
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
