// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes-config.dart';
import 'package:unwind_app/Widgets/topic-widget.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({Key? key}) : super(key: key);

  PageRoutes pageRoutes = PageRoutes();

  List<String> nameWorkout = ['name 1', 'name 2', 'name 3'];

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: pageRoutes.history.summarypage().title,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "Date - Date Month Year",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TopicWidget(
                    startIcon: Icon(
                      Icons.directions_run_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName: 'ชื่อชุดท่าบริหาร'),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: nameWorkout.map((data) {
                      return Row(
                        children: [
                          const Text(
                            '\u2022',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF484D56)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            data,
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      );
                    }).toList()),
                const SizedBox(
                  height: 4,
                ),
                TopicWidget(
                    startIcon: Icon(
                      Icons.analytics_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    topicName: 'ค่าความเจ็บปวด (ก่อน/หลัง)'),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Theme.of(context).colorScheme.secondary,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weeknd num',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
