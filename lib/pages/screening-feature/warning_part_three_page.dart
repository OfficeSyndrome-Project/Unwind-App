import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class WarningPartThreePage extends StatelessWidget {
  final List<ScreeningPartTwoModel> selectPart;
  final List<Answer>? answers;
  final Map<ScreeningTitle, int>? nrs;
  WarningPartThreePage({
    super.key,
    required this.selectPart,
    this.answers,
    this.nrs,
  });

  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
        ),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
              ),
              RatioImageoneToOne(
                assetName:
                    'lib/assets/images/screeningPart/scr_part_three_2.png',
                smallWidth: 200,
                largeWidth: 250,
                smallHeight: 200,
                largeHeight: 250,
              ),
              Container(
                margin: EdgeInsets.only(top: 22, bottom: 4),
                child: Text(
                  'ขั้นตอนการประเมิน',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                '1. ทำท่าค้างไว้ 3-5 วินาที\n2. หากเกิดอาการเจ็บให้หยุดทันที',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Noto Sans Thai",
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF484D56),
                ),
              )
            ],
          )),
          ButtonWithoutIconWidget(
              onTap: () {
                Navigator.push(
                    context,
                    pageRoutes.screening
                        .afterwarningpartthree(selectPart, answers, nrs)
                        .route(context));
              },
              text: 'ถัดไป',
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
        ]);
  }
}
