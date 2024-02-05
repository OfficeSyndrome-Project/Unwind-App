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
  static final int _duration = 10;
  static final CountDownController _controller = CountDownController();
  late int duration = _duration;

  static int index = 0;

  final PageRoutes pageRoutes = PageRoutes();
  static bool onPressed = true;

  String? _newVoiceText;
  late TtsManager ttsManager;
  bool isLoding = true;

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

  List<U> workoutWidgetComposer<T, U>(List<T> xs, U Function(T) prepareWidgetFn,
      U Function(T) workoutWidgetFn, U Function(T) upNextWidgetFn) {
    if (xs.isEmpty) return [];
    if (xs.length == 1) {
      return [prepareWidgetFn(xs.first), workoutWidgetFn(xs.first)];
    }
    return [
      prepareWidgetFn(xs.first),
      workoutWidgetFn(xs.first),
      ...tailComposer(xs.sublist(1), [
        upNextWidgetFn,
        prepareWidgetFn,
        workoutWidgetFn,
      ])
    ];
  }

  /// Composes a list of elements by applying a list of functions to each element in the input list.
  ///
  /// The `tailComposer` function takes in two parameters: `xs` and `fns`.
  /// - `xs` is a list of elements of type `T`.
  /// - `fns` is a list of functions that take an element of type `T` and return an element of type `U`.
  ///
  /// The function returns a list of elements of type `U` that is composed by applying each function in `fns` to each element in `xs`.
  /// If `xs` is empty, an empty list of type `U` is returned.
  List<U> tailComposer<T, U>(List<T> xs, List<U Function(T)> fns) => xs.isEmpty
      ? <U>[]
      : xs.expand<U>((x) => fns.map((f) => f(x)).toList()).toList();

  Widget prepareWidgetFn(WorkoutData workoutData) => PrepareWorkoutWidget(
        assetName: workoutData.thumbnailPath,
      );
  Widget workoutWidgetFn(WorkoutData workoutData) => WorkoutWidget(
        name: workoutData.name,
        fullPaths: fullPaths, // change to workoutData.fullPaths
        eachSetDuration:
            workoutData.sec, // change to workoutData.eachSetDuration?
        repeat: workoutData.time, // change to workoutData.repeat?
      );
  Widget nextWidgetFn(WorkoutData workoutData) => NextWorkoutWidget(
        name: workoutData.name,
        time: 20, // change to workoutData.time?
        descrip: workoutData.detail, // change to workoutData.descrip?
        assetName: workoutData.thumbnailPath,
      );

  @override
  Widget build(BuildContext context) {
    // final List<Widget> _widgetOptions = <Widget>[
    //   // PrepareWorkoutWidget(
    //   //     assetName: 'lib/assets/images/workout/prepare/prepare.png'),
    //   WorkoutWidget(
    //     name: 'ท่าเอนคอ',
    //     fullPaths: fullPaths,
    //     eachSetDuration: _duration,
    //     repeat: 3,
    //   ),
    //   NextWorkoutWidget(
    //     name: 'ท่าดันต้าน',
    //     time: 20,
    //     descrip: 'เพิ่มความแข็งแรงบริเวณคอ',
    //     assetName: 'lib/assets/images/workout/prepare/prepare.png',
    //   ),
    // ];

    // T = WorkoutData
    // U = Widget
    final List<Widget> _widgetOptions = workoutWidgetComposer(
      widget.workoutList.workoutData,
      prepareWidgetFn,
      workoutWidgetFn,
      nextWidgetFn,
    );

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
                  setState(() {
                    onPressed = !onPressed;
                    btnTime(onPressed);
                  });
                  final result = await alertDialog.getshowDialog(
                      context, 'ยกเลิกการบริหารใช่หรือไม่ ?', null, () {
                    Navigator.pop(context, false);
                    _controller.resume();
                    setState(() {
                      onPressed = !onPressed;
                    });
                  }, () {
                    Navigator.pop(context, true);
                    _controller.reset();
                    index = 0;
                  });
                  _controller.pause();
                  if (result == true) {
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
                  index: index,
                  children: [..._widgetOptions],
                ),
                CircularCountdownTimerWidget(
                  duration: _duration,
                  controller: _controller,
                  onComplete: () {
                    setState(() {
                      if (index == _widgetOptions.length - 1) {
                        index = 0;
                      } else {
                        index += 1;
                      }
                      _controller.restart(duration: _duration);
                      duration = _duration;
                    });
                  },
                  onChange: (value) {
                    if (_newVoiceText != value) {
                      _newVoiceText = value;
                      // ttsManager.speak(_newVoiceText);
                      // _speak();
                    }
                  },
                ),
              ]);
  }
}
