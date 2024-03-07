import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/services/tts_manager_service.dart';

class CircularCountdownTimerWidget extends StatefulWidget {
  final int duration;
  final CountDownController controller;
  final void Function()? onComplete;
  final void Function(String)? onChange;
  final void Function()? onStart;
  final dynamic Function(dynamic Function(Duration), Duration)?
      timeFormatterFunction;
  final TtsManager? ttsManager;
  CircularCountdownTimerWidget(
      {super.key,
      required this.duration,
      required this.controller,
      this.onComplete,
      this.onChange,
      this.onStart,
      this.ttsManager,
      this.timeFormatterFunction});

  @override
  _CircularCountdownTimerWidgetState createState() =>
      _CircularCountdownTimerWidgetState();
}

class _CircularCountdownTimerWidgetState
    extends State<CircularCountdownTimerWidget> {
  late int currentDuration = widget.duration;
  late Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularCountDownTimer(
        width: 120,
        height: 120,
        duration: widget.duration,
        fillColor: Theme.of(context).colorScheme.primary,
        ringColor: Color(0xffebedf0),
        autoStart: true,
        controller: widget.controller,
        initialDuration: 0,
        isReverse: true,
        isReverseAnimation: true,
        strokeWidth: 6.0,
        textFormat: CountdownTextFormat.S,
        textStyle: TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 35 : 40,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF2C3036),
        ),
        onComplete: widget.onComplete,
        onStart: widget.onStart,
        onChange: (value) => widget.onChange!(value),
        timeFormatterFunction: widget.timeFormatterFunction,
      ),
    );
  }
}
