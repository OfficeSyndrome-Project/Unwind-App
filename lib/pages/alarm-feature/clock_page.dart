// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/text_with_starticon_widget.dart';

import 'package:unwind_app/Widgets/alarm-widget/alarm_btncircle_widget.dart';
import 'package:unwind_app/data/timewatch_obj.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import 'package:unwind_app/Widgets/alarm-widget/alarm_wheeltile_widget.dart';
import 'package:unwind_app/data/time_workstate.dart';
import 'package:unwind_app/data/time_breakstate.dart';

import 'info_clock_page.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  //work
  bool _worktoggle = true;
  List<WorkStates> workstates = [];
  String currentWorkState = "15";

  //break
  bool _breaktoggle = true;
  List<BreakStates> breakstates = [];
  String currentBreakState = "15";
  PageRoutes pageRoutes = PageRoutes();

  @override
  void initState() {
    super.initState();
    workstates = allWorkStates();
    breakstates = allBreakStates();
  }

  void scrollWorkTimes() {
    setState(() {
      currentWorkState;
      _worktoggle = !_worktoggle;
    });
  }

  void scrollBreakTimes() {
    setState(() {
      currentBreakState;
      _breaktoggle = !_breaktoggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBar: pageRoutes.menu.clockpage().title,
        iconButtonStart: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        iconButtonEnd: IconButton(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.of(context).push(_animationInfoRoute());
            },
            icon: const Icon(
              Icons.info_outline_rounded,
              color: Color(0xFFEBEDF0),
            )),
        children: [
          SizedBox(
            //section 1 tab time
            width: double.infinity,
            height: 325,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textIcon(
                        context,
                        "คุณต้องการทำงาน",
                        const Color(0xFF636A75),
                        Icon(
                          Icons.computer_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      _worktoggle == true
                          ? const SizedBox(
                              width: 72,
                              height: 3,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                scrollWorkTimes();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: const Size(72, 30),
                              ),
                              child: Text(
                                'ยืนยัน',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedContainer(
                    //time-wheel 1
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    width: double.infinity,
                    padding: _worktoggle == true
                        ? const EdgeInsets.symmetric(horizontal: 9)
                        : const EdgeInsets.symmetric(horizontal: 0),
                    height: _worktoggle == true ? 40 : 129,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: _worktoggle == true
                          ? Colors.white
                          : const Color(0xFFD7E0F5),
                    ),
                    child: _worktoggle == true
                        ? Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: Text(
                                    '$currentWorkState นาที',
                                    style: const TextStyle(
                                        color: Color(0xFF6285D7),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans Thai',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: _breaktoggle == false
                                      ? null
                                      : () {
                                          setState(() {
                                            _worktoggle = !_worktoggle;
                                          });
                                        },
                                  icon: const Icon(
                                    Icons.unfold_more_sharp,
                                    color: Color(0xFF6285D7),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            //time-wheel.dart
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Opacity(
                                  opacity: 0.65,
                                  child: Container(
                                    width: 312,
                                    decoration: ShapeDecoration(
                                        color: const Color(0xFFD7E0F5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification: (notification) {
                                  notification.disallowIndicator();
                                  return true;
                                },
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 50,
                                  perspective: 0.001,
                                  diameterRatio: 1.6,
                                  physics: const FixedExtentScrollPhysics(),
                                  squeeze: 1.2,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      currentWorkState =
                                          workstates[index].worktimes!;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: workstates.length,
                                    builder: (context, index) {
                                      return WheelTile(
                                          workstates[index].worktimes!);
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  //break
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textIcon(
                        context,
                        'คุณต้องการพัก',
                        const Color(0xFF636A75),
                        Icon(
                          Icons.coffee_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      _breaktoggle == true
                          ? const SizedBox(
                              width: 72,
                              height: 3,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                scrollBreakTimes();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: const Size(72, 30),
                              ),
                              child: Text(
                                'ยืนยัน',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedContainer(
                    //time-wheel 2
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    width: double.infinity,
                    padding: _breaktoggle == true
                        ? const EdgeInsets.symmetric(horizontal: 9)
                        : const EdgeInsets.symmetric(horizontal: 0),
                    height: _breaktoggle == true ? 40 : 129,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: _breaktoggle == true
                          ? Colors.white
                          : const Color(0xFFD7E0F5),
                    ),
                    child: _breaktoggle == true
                        ? Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: Text(
                                    '$currentBreakState นาที',
                                    style: const TextStyle(
                                        color: Color(0xFF6285D7),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans Thai',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: _worktoggle == false
                                      ? null
                                      : () {
                                          setState(() {
                                            _breaktoggle = !_breaktoggle;
                                          });
                                        },
                                  icon: const Icon(
                                    Icons.unfold_more_sharp,
                                    color: Color(0xFF6285D7),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            //time-wheel.dart
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Opacity(
                                  opacity: 0.65,
                                  child: Container(
                                    width: 312,
                                    decoration: ShapeDecoration(
                                        color: const Color(0xFFD7E0F5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification: (notification) {
                                  notification.disallowIndicator();
                                  return true;
                                },
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 50,
                                  perspective: 0.001,
                                  diameterRatio: 1.6,
                                  physics: const FixedExtentScrollPhysics(),
                                  squeeze: 1.2,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      currentBreakState =
                                          breakstates[index].breaktimes!;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: breakstates.length,
                                    builder: (context, index) {
                                      return WheelTile(
                                          breakstates[index].breaktimes!);
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  pageRoutes.menu.timewatchpage([
                    TimeWatchObj(
                        title: "เวลาทำงาน",
                        iconData: Icons.computer_rounded,
                        times: changeWorkTimes()),
                    TimeWatchObj(
                        title: "เวลาพัก",
                        iconData: Icons.coffee_rounded,
                        times: changeBreakTimes()),
                  ]).route(context));
            },
            child: Container(
              //section 2 btn
              width: double.infinity,
              // color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'กดปุ่มเพื่อเริ่มการทำงาน',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  btnCircle(context, 'เริ่ม', const Color(0xFF40AD97))
                ],
              ),
            ),
          ),
        ]);
  }

  changeWorkTimes() {
    var intWorkTimes = int.parse(currentWorkState);

    return intWorkTimes;
  }

  changeBreakTimes() {
    var intBreakTimes = int.parse(currentBreakState);

    return intBreakTimes;
  }
}

Route _animationInfoRoute() {
  return PageRouteBuilder(
    pageBuilder: ((context, animation, secondaryAnimation) =>
        const InfoErgonomicPage()),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.1, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
