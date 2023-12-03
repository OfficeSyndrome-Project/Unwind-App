// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/alarm-widget/alarm_btncircle_widget.dart';
import 'package:unwind_app/Widgets/text_with_starticon_widget.dart';
import 'package:unwind_app/data/timewatch_obj.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

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
  bool boolTimes = true;
  late TimeWatchObj timesObj;
  int currentIndex = 0;

  PageRoutes pageRoutes = PageRoutes();

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
      const Duration(microseconds: 500),
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
        alignment: Alignment.centerLeft,
        onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: const Color.fromARGB(122, 245, 245, 250),
            builder: (BuildContext dialogcontext) => Center(
                  child: Container(
                    width: 238,
                    height: 128,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F3B67CD),
                            blurRadius: 15,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "ยืนยันที่จะหยุดจับเวลาใช่หรือไม่ ?",
                          style: TextStyle(
                            color: Color(0xFF484D56),
                            fontFamily: "Noto Sans Thai",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonTapTheme(
                                onTap: () {
                                  Navigator.of(dialogcontext)
                                      .popUntil((route) => route.isFirst);
                                },
                                text: "ใช่",
                                radius: 8,
                                width: 63,
                                height: 32,
                                color: Colors.white,
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 12,
                                    fontFamily: "Noto Sans Thai",
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    letterSpacing: 1.0)),
                            const SizedBox(
                              width: 8,
                            ),
                            ButtonTapTheme(
                                onTap: () {
                                  Navigator.of(dialogcontext).pop();
                                },
                                text: "ไม่",
                                radius: 8,
                                width: 63,
                                height: 32,
                                color: Theme.of(context).colorScheme.primary,
                                borderSide: BorderSide.none,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Noto Sans Thai",
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
        padding: const EdgeInsets.all(0),
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
      ),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            textIcon(
                context,
                timesObj.title,
                const Color(0xFF636A75),
                Icon(
                  timesObj.iconData,
                  color: Theme.of(context).colorScheme.primary,
                )),
            const SizedBox(
              height: 24,
            ),
            Text(
              '${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Color(0xFF636A75),
                fontSize: 56,
                fontFamily: 'Noto Sans Thai',
                fontWeight: FontWeight.w500,
              ),
            ),
            // buildSecondsTime(),
            Text(
              'จาก ${timesObj.times} นาที',
              style: const TextStyle(
                color: Color(0xFFC3C8D2),
                fontSize: 16,
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
        ),
      ],
    );
  }
}
