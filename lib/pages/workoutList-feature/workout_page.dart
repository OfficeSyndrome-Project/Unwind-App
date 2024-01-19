import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/circular_countdown_timer_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/next_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/prepare_workout_widget.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/workout_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  static bool isVolumn = true;
  static final int _duration = 4;
  static final CountDownController _controller = CountDownController();
  static String textValue = '';
  static int index = 0;

  final PageRoutes pageRoutes = PageRoutes();

  @override
  void initState() {
    super.initState();
  }

  void btnTime(bool isVolumn) {
    if (isVolumn) {
      _controller.resume();
    } else if (!isVolumn) {
      _controller.pause();
    }
  }

  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      PrepareWorkoutWidget(
          assetName: 'lib/assets/images/workout/prepare/prepare.png'),
      WorkoutWidget(
        name: 'ท่าเอนคอ',
        assetName: 'lib/assets/images/workout/prepare/prepare.png',
      ),
      NextWorkoutWidget(
        name: 'ท่าดันต้าน',
        time: 20,
        descrip: 'เพิ่มความแข็งแรงบริเวณคอ',
        assetName: 'lib/assets/images/workout/prepare/prepare.png',
      ),
    ];

    return AppscreenTheme(
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
              _controller.reset();
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
              });
            },
            onChange: (String value) {
              textValue = value;
              debugPrint('Countdown Changed $textValue');
            },
          ),
        ]);
  }
}
