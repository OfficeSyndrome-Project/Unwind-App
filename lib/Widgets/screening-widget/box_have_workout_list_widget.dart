import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/screening-widget/box_results_workout.dart';

class BoxHaveWorkoutListWidget extends StatelessWidget {
  final String? name;
  final int index;
  const BoxHaveWorkoutListWidget({Key? key, this.name, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name == null
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      '${index + 1}. ${name}',
                      style: TextStyle(
                        color: Color(0xFF484D56),
                        fontSize: 16,
                        fontFamily: 'Noto Sans Thai',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
            Container(
              width: double.infinity,
              height: 104 * 5,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => BoxResultsWorkout(name: '1'),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                  itemCount: 5),
            ),
          ],
        ));
  }
}
