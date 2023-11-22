import 'package:flutter/material.dart';

class HistoryWorkoutlistWidget extends StatelessWidget {
  const HistoryWorkoutlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86,
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 18),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "name workout list",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "date start and date end",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          Container(
            width: 48,
            height: 48,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
