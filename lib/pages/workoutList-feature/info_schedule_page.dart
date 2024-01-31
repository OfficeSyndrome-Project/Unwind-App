import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';

class InfoSchedulePage extends StatefulWidget {
  const InfoSchedulePage({Key? key}) : super(key: key);

  @override
  _InfoSchedulePageState createState() => _InfoSchedulePageState();
}

class _InfoSchedulePageState extends State<InfoSchedulePage> {
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
            color: Colors.white),
        textBar: pageRoutes.workout.infoschedulepage().title,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: TextWithStartIconWidget(
                    startIcon: Icon(
                      Icons.directions_run,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName: 'ท่าบริหารคอ',
                    style: TextStyle(
                      color: Color(0xFF484D56),
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontFamily: 'Noto Sans Thai',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'วันพฤหัสที่ 9 สิงหาคม พ.ศ. 2566\nเวลา 19:00 -19:30',
                  style: TextStyle(
                    color: Color(0xFF636A75),
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontFamily: 'Noto Sans Thai',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  alignment: Alignment.center,
                  child: RatioImageoneToOne(
                      assetName:
                          'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-1.png',
                      smallWidth: 180,
                      largeWidth: 250,
                      smallHeight: 180,
                      largeHeight: 250),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ButtonWithiconWidget(
              onTap: () {
                alertDialog.getshowDialog(
                    context, 'ยืนยันลบการแจ้งเตือนใช่หรือไม่ ?', null, () {
                  Navigator.of(context).pop();
                }, () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                });
              },
              mainAxisAlignment: MainAxisAlignment.center,
              text: 'ลบแจ้งเตือนนี้',
              radius: 8,
              side: BorderSide(width: 1, color: Color(0xFFC9635F)),
              icon: Icons.delete_outline_rounded,
              iconcolor: Color(0xFFC9635F),
              colorText: Color(0xFFC9635F),
            ),
          )
        ]);
  }
}
