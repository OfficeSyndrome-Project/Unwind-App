// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/alarm-widget/alarm_btncircle_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../data/alarm-data/timewatch_obj.dart';
import 'afterbreak_page.dart';
import 'content_afterwork_page.dart';

class TimeWatchPage extends StatefulWidget {
  final List<TimeWatchObj> timesArr;

  const TimeWatchPage({super.key, required this.timesArr});

  @override
  _TimeWatchPageState createState() => _TimeWatchPageState();
}

class _TimeWatchPageState extends State<TimeWatchPage> {
  late int remainingTimes;
  bool _stoptoggle = true;
  late TimeWatchObj timesObj;
  int currentIndex = 0;

  final PageRoutes pageRoutes = PageRoutes();

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() {
    if (widget.timesArr.isNotEmpty) {
      timesObj = widget.timesArr.elementAt(currentIndex);
    }
    remainingTimes = timesObj.times * 60; //convert to sec
    startTimer();
  }

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(microseconds: 2000),
      (timer) async {
        if (remainingTimes > 0) {
          setState(() {
            remainingTimes--;
          });
        } else {
          timer.cancel();
          if (currentIndex < widget.timesArr.length - 1) {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContentAfterWorkPage(),
                ));
            setState(() {
              currentIndex++;
              initTimer();
            });
          } else {
            final bool isWorking = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AfterBreakPage())));
            if (isWorking) {
              setState(() {
                currentIndex = 0;
                initTimer();
              });
            } else {
              Navigator.pop(context);
            }
          }
        }
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
  }

  void toggleTimer() {
    if (_stoptoggle == true) {
      stopTimer();
    } else {
      startTimer();
    }
    setState(() {
      _stoptoggle = !_stoptoggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hours = (remainingTimes / 3600).floor();
    final minutes = (remainingTimes / 60).floor() % 60;
    final seconds = (remainingTimes % 60);

    return AppscreenTheme(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      textBar: "นาฬิกาจับเวลา",
      iconButtonStart: IconButton(
        onPressed: () async {
          final result = await alertDialog.getshowDialog(
              context, 'ยืนยันที่จะหยุดจับเวลาใช่หรือไม่ ?', null, () {
            Navigator.pop(context, false);
          }, () {
            Navigator.pop(context, true);
          });
          if (result == true) {
            Navigator.pop(context);
          }
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
      ),
      children: [
        TextWithStartIconWidget(
            startIcon: Icon(
              timesObj.iconData,
              color: Theme.of(context).colorScheme.primary,
            ),
            topicName: timesObj.title,
            style: TextStyle(
              fontFamily: "Noto Sans Thai",
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF636A75),
            )),

        const SizedBox(
          height: 24,
        ),
        Text(
          '${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}',
          style: TextStyle(
            color: Color(0xFF636A75),
            fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 40 : 56,
            fontFamily: 'Noto Sans Thai',
            fontWeight: FontWeight.w500,
          ),
        ),
        // buildSecondsTime(),
        Text(
          'จาก ${timesObj.times} นาที',
          style: TextStyle(
            color: Color(0xFFC3C8D2),
            fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
            fontFamily: 'Noto Sans Thai',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
            onTap: () {
              toggleTimer();
            },
            child: btnCircle(
              context,
              _stoptoggle == true ? "หยุด" : "เริ่ม",
              _stoptoggle == true
                  ? const Color(0xFFC9635F)
                  : const Color(0xFF40AD97),
            )),
      ],
    );
  }
}
