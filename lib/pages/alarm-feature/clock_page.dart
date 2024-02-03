import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

import 'package:unwind_app/Widgets/alarm-widget/alarm_btncircle_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import 'package:unwind_app/Widgets/alarm-widget/alarm_wheeltile_widget.dart';
import 'package:unwind_app/data/alarm-data/time_breakstate.dart';

import '../../Widgets/button_withouticon_widget.dart';
import '../../data/alarm-data/time_workstate.dart';
import '../../data/alarm-data/timewatch_obj.dart';
import 'info_clock_page.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  int currIndexWork = 0;
  int curIndexBreak = 0;
  //work
  bool _worktoggle = true;
  late List<WorkStates> workstates = [];
  late String currentWorkState = "${workstates[currIndexWork].worktimes}";

  late FixedExtentScrollController _workController;
  late FixedExtentScrollController _breakController;

  //break
  bool _breaktoggle = true;
  late List<BreakStates> breakstates = [];
  late String currentBreakState = "${breakstates[curIndexBreak].breaktimes}";
  PageRoutes pageRoutes = PageRoutes();

  @override
  void initState() {
    super.initState();
    workstates = allWorkStates();
    breakstates = allBreakStates();

    _workController = FixedExtentScrollController(initialItem: currIndexWork);
    _breakController = FixedExtentScrollController(initialItem: curIndexBreak);
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        iconButtonEnd: IconButton(
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
                Container(
                  width: double.infinity,
                  height: 30,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: _worktoggle == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWithStartIconWidget(
                          startIcon: Icon(
                            Icons.computer_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          topicName: 'คุณต้องการทำงาน',
                          style: TextStyle(
                            fontFamily: "Noto Sans Thai",
                            fontSize:
                                ResponsiveCheckWidget.isSmallMobile(context)
                                    ? 14
                                    : 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF636A75),
                          )),
                      _worktoggle == true
                          ? const SizedBox()
                          : ButtonWithoutIconWidget(
                              onTap: () {
                                scrollWorkTimes();
                              },
                              text: 'ยืนยัน',
                              radius: 4,
                              width: 72,
                              height: 30,
                              color: Theme.of(context).colorScheme.primary,
                              borderSide: BorderSide.none,
                              style: ResponsiveCheckWidget.isSmallMobile(
                                      context)
                                  ? TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFFFFFF),
                                    )
                                  : Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
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
                                    style: TextStyle(
                                        color: Color(0xFF6285D7),
                                        fontSize:
                                            ResponsiveCheckWidget.isSmallMobile(
                                                    context)
                                                ? 14
                                                : 16,
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
                                  controller: _workController,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      currIndexWork = index;
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
                Container(
                  //break
                  width: double.infinity,
                  height: 30,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: _breaktoggle == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWithStartIconWidget(
                          startIcon: Icon(
                            Icons.coffee_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          topicName: 'คุณต้องการพัก',
                          style: TextStyle(
                            fontFamily: "Noto Sans Thai",
                            fontSize:
                                ResponsiveCheckWidget.isSmallMobile(context)
                                    ? 14
                                    : 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF636A75),
                          )),
                      _breaktoggle == true
                          ? const SizedBox()
                          : ButtonWithoutIconWidget(
                              onTap: () {
                                scrollBreakTimes();
                              },
                              text: 'ยืนยัน',
                              radius: 4,
                              width: 72,
                              height: 30,
                              color: Theme.of(context).colorScheme.primary,
                              borderSide: BorderSide.none,
                              style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
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
                                    style: TextStyle(
                                        color: Color(0xFF6285D7),
                                        fontSize:
                                            ResponsiveCheckWidget.isSmallMobile(
                                                    context)
                                                ? 14
                                                : 16,
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
                                  controller: _breakController,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      curIndexBreak = index;
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'กดปุ่มเพื่อเริ่มการทำงาน',
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF484D56),
                          )
                        : Theme.of(context).textTheme.bodyLarge,
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
