// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';

class ContentAfterWorkPage extends StatefulWidget {
  const ContentAfterWorkPage({super.key});

  @override
  _ContentAfterWorkPageState createState() => _ContentAfterWorkPageState();
}

class _ContentAfterWorkPageState extends State<ContentAfterWorkPage> {
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
          Container(
            width: double.infinity,
            height: 240,
            decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ]),
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              "ตอนนี้คุณได้ทำงานครบตามเวลาที่ได้ตั้งไว้\nได้เวลาพักสายตาและยืดเส้นยืดสาย",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          GestureDetector(
            onTap: () {
              startworkTimes();
            },
            child: ButtomTapTheme(
              text: "ถัดไป",
              radius: 32,
              width: double.infinity,
              height: 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ]);
  }
}
