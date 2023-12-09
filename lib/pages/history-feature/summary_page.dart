import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withicon_widget.dart';
import 'package:unwind_app/Widgets/topic_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({super.key});

  final PageRoutes pageRoutes = PageRoutes();

  final List<String> nameWorkout = ['name 1', 'name 2', 'name 3'];

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width > 768;

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
                  child: AutoSizeText(
                    "Date - Date Month Year",
                    style: Theme.of(context).textTheme.titleLarge,
                    maxFontSize: 18,
                    minFontSize: 16,
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
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
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
                            AutoSizeText(
                              data,
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxFontSize: 16,
                              minFontSize: 14,
                            )
                          ],
                        ),
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
                ButtonWithiconWidget(
                  onTap: () {
                    Navigator.push(context,
                        pageRoutes.history.resultperweekpage().route(context));
                  },
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  text: 'Weeknd num',
                  color: Theme.of(context).colorScheme.secondary,
                  colorText: Colors.white,
                  radius: 8,
                  side: BorderSide.none,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconcolor: Colors.white,
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Flex(
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: isScreenWide
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //pain score
                      AutoSizeText.rich(
                        maxFontSize: 16,
                        minFontSize: 14,
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'ค่าความเจ็บปวดเฉลี่ย : ',
                                style: TextStyle(
                                  fontFamily: "Noto Sans Thai",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF484D56),
                                )),
                            TextSpan(
                                text: 'num',
                                style: TextStyle(
                                  fontFamily: "Noto Sans Thai",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3B67CD),
                                )),
                          ],
                        ),
                      ),
                      //frequency
                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        maxFontSize: 16,
                        minFontSize: 14,
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'ความสม่ำเสมอ : ',
                                style: TextStyle(
                                  fontFamily: "Noto Sans Thai",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF484D56),
                                )),
                            TextSpan(
                                text: 'num',
                                style: TextStyle(
                                  fontFamily: "Noto Sans Thai",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3B67CD),
                                )),
                          ],
                        ),
                      ), //frequency
                    ],
                  ),
                ),
                ButtonWithiconWidget(
                  onTap: () {},
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  text: 'ผลการประเมินแบบทดสอบ',
                  color: const Color(0xFFC4D1F0),
                  colorText: const Color(0xFF6285D7),
                  radius: 8,
                  side: BorderSide.none,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconcolor: const Color(0xFF6285D7),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ]);
  }
}
