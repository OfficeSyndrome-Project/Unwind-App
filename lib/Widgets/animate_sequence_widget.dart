import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/stack_image_widget.dart';

class AnimateSequenceWidget extends StatefulWidget {
  final List<String> listPath;
  final int repeat;
  final int eachSetDuration;

  const AnimateSequenceWidget(
      {super.key,
      required this.listPath,
      required this.repeat,
      required this.eachSetDuration});

  @override
  State<AnimateSequenceWidget> createState() => _AnimateSequenceWidgetState();
}

class _AnimateSequenceWidgetState extends State<AnimateSequenceWidget>
    with SingleTickerProviderStateMixin {
  final int duration = 1000;
  // final int repeat = 3;
  // final int eachSetDuration = 10;

  late int currentIndex;
  late int currentRepeat;
  late Timer timer;
  late Timer setTimer;
  late bool isDone;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    currentRepeat = 0;
    isDone = false;
    startTimer();
    startSetTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    setTimer.cancel();
  }

  void onNext() {
    setState(() {
      if (currentIndex < widget.listPath.length - 1)
        currentIndex += 1;
      else {
        currentIndex = 0;
        isDone = true;
      }
    });
  }

  void startTimer() {
    if (currentIndex < widget.listPath.length && !isDone) {
      timer = Timer(Duration(milliseconds: duration), () {
        onNext();
        startTimer();
      });
    } else {
      print("All timers completed!");
    }
  }

  void startSetTimer() {
    if (currentRepeat < widget.repeat) {
      setTimer = Timer(Duration(seconds: widget.eachSetDuration), () {
        print("New set Begined!");
        setState(() {
          isDone = false;
          currentRepeat += 1;
        });
        startTimer();
        startSetTimer();
      });
    } else {
      print("All setTimers completed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StackImageWidget(
      listPath: widget.listPath,
      currentIndex: currentIndex,
    );
  }
}
