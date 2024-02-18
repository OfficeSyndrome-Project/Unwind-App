import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/animate_sequence_widget.dart';
import 'package:unwind_app/data/alarm-data/break_post.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import '../../Widgets/responsive_check_widget.dart';

class ContentAfterWorkPage extends StatefulWidget {
  const ContentAfterWorkPage({super.key});

  @override
  _ContentAfterWorkPageState createState() => _ContentAfterWorkPageState();
}

class _ContentAfterWorkPageState extends State<ContentAfterWorkPage> {
  static final List<BreakPostModel> postureModel = BreakPostModel.getPosture();
  final int valueRandom = Random().nextInt(postureModel.length);

  @override
  void initState() {
    super.initState();
  }

  void startworkTimes() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBar: "นาฬิกาจับเวลา",
        children: [
          Expanded(
              child: Column(
            children: [
              Container(
                width: double.infinity,
                height:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 280 : 350,
                child: AnimateSequenceWidget(
                  listPath: postureModel[valueRandom].listPath,
                  repeat: 10,
                  eachSetDuration: 10,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 24, bottom: 48),
                child: Text(
                    "ตอนนี้คุณได้ทำงานครบตามเวลาที่ได้ตั้งไว้\nได้เวลาพักสายตาและยืดเส้นยืดสาย",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 16
                          : 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    )),
              ),
            ],
          )),
          ButtonWithoutIconWidget(
            onTap: () {
              startworkTimes();
            },
            text: "ถัดไป",
            radius: 32,
            width: double.infinity,
            height: 52,
            color: Theme.of(context).colorScheme.primary,
            borderSide: BorderSide.none,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ]);
  }
}
