import 'package:flutter/material.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';
import 'package:unwind_app/Widgets/soud_widget.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/circular_countdown_timer_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/next_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/prepare_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/pages/workoutList-feature/nrs_after_and_before_page.dart';

class WorkoutPage extends StatefulWidget {
  final WorkoutList workoutList;
  const WorkoutPage({
    super.key,
    required this.workoutList,
  });

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

// enum TtsState { playing, stopped, paused, continued }

class _WorkoutPageState extends State<WorkoutPage> {
  static bool isVolumn = true;
  static final CountDownController _controller = CountDownController();
  final PageRoutes pageRoutes = PageRoutes();
  static bool onPressed = true;
  String? _newVoiceText;
  late TtsManager ttsManager;
  bool isLoding = true;
  List<Widget> workoutWidgetSequences = [];
  WorkoutSequence currentSequence = WorkoutSequence(index: -1, duration: 0);
  final List<String> fullPaths = [
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-1.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-2.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-3.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-4.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-5.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-6.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-7.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-8.png',
    'lib/assets/images/workout/neck-shoulder/neckch03/tp-right/TP-9.png',
  ];

  @override
  initState() {
    super.initState();
    init();
  }

  void init() {
    ttsManager = TtsManager();
    setState(() {
      isLoding = false;
    });
    workoutWidgetSequences = workoutWidgetComposer(
      widget.workoutList.workoutData,
      prepareWidgetFn,
      workoutWidgetFn,
      nextWidgetFn,
    );
    currentSequence =
        nextWorkoutSequence(currentSequence, workoutWidgetSequences);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void btnTime(bool onPressed) {
    if (onPressed) {
      _controller.resume();
    } else if (!onPressed) {
      _controller.pause();
    }
  }

  /// prepareWidgetFn is a function to create the workout prepare widget
  List<Widget> prepareWidgetFn(WorkoutData workoutData) => [
        PrepareWorkoutWidget(
          assetName: workoutData.thumbnailPath,
        )
      ];

  /// workoutWidgetFn is a function to create the workout widget with workout animation
  List<Widget> workoutWidgetFn(WorkoutData workoutData) => List.generate(
      workoutData.time,
      (n) => WorkoutWidget(
            name: workoutData.name,
            workoutData: workoutData,
            timeth: n + 1,
          )).toList();

  /// nextWidgetFn is a function to create the up next workout widget in the middle of the workouts
  List<Widget> nextWidgetFn(WorkoutData workoutData) => [
        NextWorkoutWidget(
          name: workoutData.name,
          time: 10, // change to workoutData.time?
          descrip: workoutData.detail, // change to workoutData.descrip?
          assetName: workoutData.thumbnailPath,
        )
      ];

  /// workoutWidgetComposer is a function to compose the workoutWidgetSequences in the right order
  /// In order to change the order of the workoutWidgetSequences, you can change the order of the functions
  List<U> workoutWidgetComposer<T, U>(
      List<T> workouts,
      List<U> Function(T) prepareWidgetFn,
      List<U> Function(T) workoutWidgetFn,
      List<U> Function(T) upNextWidgetFn) {
    if (workouts.isEmpty) return [];
    if (workouts.length == 1) {
      return [
        ...prepareWidgetFn(workouts.first),
        ...workoutWidgetFn(workouts.first)
      ];
    }
    return [
      ...prepareWidgetFn(workouts.first),
      ...workoutWidgetFn(workouts.first),
      ...tailComposer(workouts.sublist(1), [
        upNextWidgetFn,
        prepareWidgetFn,
        workoutWidgetFn,
      ])
    ];
  }

  /// tailComposer is a helper function to compose the tail of the workoutWidgetSequences
  List<U> tailComposer<T, U>(List<T> xs, List<List<U> Function(T)> fns) =>
      xs.isEmpty
          ? <U>[]
          : xs.expand<U>((x) => fns.expand<U>((f) => f(x)).toList()).toList();

  /// nextWorkoutSequence will determine the next workout sequence and the duration
  WorkoutSequence nextWorkoutSequence(
      WorkoutSequence currentSequence, List<Widget> workoutWidgetSequences) {
    final nextIndex = currentSequence.index + 1;
    if (nextIndex >= workoutWidgetSequences.length) {
      // End of workout
      return WorkoutSequence(index: 0, duration: 10);
    }
    final nextWidget = workoutWidgetSequences[nextIndex];
    if (nextWidget is PrepareWorkoutWidget) {
      return WorkoutSequence(
        index: nextIndex,
        duration: 10,
        widget: nextWidget,
      );
    }
    if (nextWidget is WorkoutWidget) {
      return WorkoutSequence(
        index: nextIndex,
        duration: nextWidget.workoutData.sec,
        widget: nextWidget,
      );
    }
    if (nextWidget is NextWorkoutWidget) {
      return WorkoutSequence(
        index: nextIndex,
        duration: 20,
        widget: nextWidget,
      );
    }
    // never
    return WorkoutSequence(index: nextIndex, duration: 10);
  }

  @override
  Widget build(BuildContext context) {
    return isLoding
        ? LoadingPage(
            isShowNavbar: false,
          )
        : AppscreenTheme(
            colorBar: Colors.transparent,
            iconButtonStart: IconButton(
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () async {
                  _controller.pause();
                  final result = await alertDialog.getshowDialog(
                      context, 'ยกเลิกการบริหารใช่หรือไม่ ?', null, () {
                    Navigator.pop(context, false);
                  }, () {
                    Navigator.pop(context, true);
                    _controller.reset();
                    // index = 0;
                  });
                  _controller.resume();
                  if (result == true) {
                    _controller.pause();
                    Navigator.pop(context);
                  }
                },
                color: Theme.of(context).colorScheme.primary),
            iconButtonEnd: IconButton(
              onPressed: () {
                setState(() {
                  isVolumn = !isVolumn;
                  btnTime(isVolumn);
                });
              },
              icon: isVolumn
                  ? Icon(Icons.volume_up_rounded)
                  : Icon(Icons.volume_off_rounded),
              color: Colors.white,
              iconSize: 20,
              alignment: Alignment.center,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFD7DAE1)),
                  shape: MaterialStateProperty.all(OvalBorder()),
                  minimumSize: MaterialStateProperty.all(Size(30, 30))),
            ),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                IndexedStack(
                  // index: index,
                  index: 0,
                  children: currentSequence.widget != null
                      ? [currentSequence.widget!]
                      : [],
                ),
                CircularCountdownTimerWidget(
                  duration: currentSequence.duration,
                  controller: _controller,
                  onComplete: () {
                    setState(() {
                      print('--- update sequence ---');
                      currentSequence = nextWorkoutSequence(
                          currentSequence, workoutWidgetSequences);
                      print(
                          '--- currentSequence: ${currentSequence.index} of ${workoutWidgetSequences.length} ---');
                      if (currentSequence.widget != null) {
                        _controller.restart(duration: currentSequence.duration);
                        return;
                      }
                      Navigator.push(
                          context,
                          pageRoutes.workout
                              .nrsafterandbeforeworkout(
                                  widget.workoutList, NrsType.after)
                              .route(context));
                      return;
                    });
                  },
                  onChange: (value) {
                    if (_newVoiceText != value) {
                      _newVoiceText = value;
                      print('speaking $_newVoiceText');
                      ttsManager.speak(_newVoiceText);
                      // _speak();
                    }
                  },
                  // make it ceil up, not showing zero at the end
                  timeFormatterFunction: (defaultFormatterFunction, duration) {
                    // if (duration.inSeconds > 60) {
                    //   // mm:ss format
                    //   return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
                    // }
                    return (duration.inMilliseconds / 1000).ceil().toString();
                  },
                ),
              ]);
  }
}

/// WorkoutSequence is a data class to represent a sequence of workout
class WorkoutSequence {
  final int index;
  final int duration;
  final Widget? widget;
  const WorkoutSequence({
    required this.index,
    required this.duration,
    this.widget,
  });
}
