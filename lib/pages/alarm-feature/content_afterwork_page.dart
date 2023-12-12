import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 24, bottom: 48),
            child: AutoSizeText(
              "ตอนนี้คุณได้ทำงานครบตามเวลาที่ได้ตั้งไว้\nได้เวลาพักสายตาและยืดเส้นยืดสาย",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
              minFontSize: 14,
            ),
          ),
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
