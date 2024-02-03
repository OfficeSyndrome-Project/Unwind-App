import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/services/schedule-service/utils.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/services/schedule-service/schedule_service.dart';

class InfoSchedulePage extends StatefulWidget {
  final int index;
  final List<Event> value;
  final DateTime selectedDay;
  const InfoSchedulePage(
      {super.key,
      required this.index,
      required this.value,
      required this.selectedDay});

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
        textBar: widget.value[widget.index].title,
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
                    topicName: widget.value[widget.index].title,
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
                  DateFormat('EEEEที่ d MMMM พ.ศ. ', 'th')
                          .format(widget.value[widget.index].times) +
                      DateFormat('yyyy', 'th').format(DateTime.utc(
                          widget.value[widget.index].times.year + 543)) +
                      '\n' +
                      DateFormat('เวลา hh:mm', 'th')
                          .format(widget.value[widget.index].times) +
                      ' นาฬิกา',
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
              onTap: () async {
                final result = await alertDialog.getshowDialog(
                    context, 'ยืนยันลบการแจ้งเตือนใช่หรือไม่ ?', null, () {
                  Navigator.pop(context, false);
                }, () {
                  ScheduleService.kEvents[widget.selectedDay]
                      ?.removeAt(widget.index);
                  if (ScheduleService.kEvents[widget.selectedDay]?.length ==
                      0) {
                    ScheduleService.kEvents.remove(widget.selectedDay);
                  }
                  ScheduleService.removeEvent(widget.index, widget.selectedDay);
                  Navigator.pop(context, true);
                });
                if (result == true) {
                  Navigator.pop(context);
                }
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
