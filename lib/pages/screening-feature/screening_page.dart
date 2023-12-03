// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/screening_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

class ScreeningPage extends StatefulWidget {
  const ScreeningPage({super.key});

  @override
  State<ScreeningPage> createState() => _ScreeningPageState();
}

class _ScreeningPageState extends State<ScreeningPage> {
  PageRoutes pageRoutes = PageRoutes();

  int currentPage = 0;

  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 356,
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: const [
                ScreeningBoxWidget(
                    assetPath:
                        'lib/assets/images/screeningPart/screening-1.png',
                    titleLabel: "ปวดเมื่อยจากการทำงานใช่ไหม ?",
                    descriptionLabel:
                        "หากการทำงานทำให้คุณรู้สึกปวดเมื่อยไม่สบายตัว\nส่งผลต่อสภาพจิตใจและร่างกายของคุณอยู่บ่อยครั้งให้ unwind ช่วยคุณ"),
                ScreeningBoxWidget(
                  assetPath: 'lib/assets/images/screeningPart/screening-1.png',
                  titleLabel: "บรรเทาอาการเจ็บปวด",
                  descriptionLabel:
                      "บรรเทาอาการปวดเหล่านั้นกับ unwind\nด้วยวิธีการตรวจที่แม่นยำและให้ชุดท่าบริหารที่เหมาะสม\nซึ่งได้รับการยืนยันจากแพทย์ผู้เชี่ยวชาญ",
                ),
                ScreeningBoxWidget(
                    assetPath: '',
                    titleLabel: 'ติดตามผลอาการของคุณ',
                    descriptionLabel:
                        'unwind ติดตามผลอาการของคุณอย่างสม่ำเสมอ\nโดยคุณสามารถดูผลอาการของตนเองย้อนหลังได้'),
                ScreeningBoxWidget(
                    assetPath: '',
                    titleLabel: 'ป้องกันอาการเจ็บปวด',
                    descriptionLabel:
                        'ป้องกันอาการเจ็บปวดจากการทำงานที่ต้นเหตุ\nunwind จะแนะนำการจัดสภาพแวดล้อมการทำงาน รวมถึงเวลาในการทำงานที่เหมาะให้กับคุณ'),
                ScreeningBoxWidget(
                    assetPath: '',
                    titleLabel: 'ยินดีต้อนรับเข้าสู่ unwind ! ',
                    descriptionLabel:
                        'แอปพลิเคชันที่คุณสามารถรักษาอาการ\nออฟฟิศซินโดรมได้ด้วยตัวของคุณเอง '),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          StartingNextPageButton(
            currentPage: currentPage,
            pageRoutes: pageRoutes,
            controller: _controller,
          ),
        ]);
  }
}

//Button Next Page Controller
class StartingNextPageButton extends StatefulWidget {
  const StartingNextPageButton({
    super.key,
    required this.currentPage,
    required this.pageRoutes,
    required PageController controller,
  }) : _controller = controller;

  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController _controller;

  @override
  _StartingNextPageButton createState() => _StartingNextPageButton();
}

class _StartingNextPageButton extends State<StartingNextPageButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTapTheme(
        onTap: () {
          widget.currentPage < 4
              ? widget._controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut)
              : Navigator.push(context,
                  widget.pageRoutes.screening.screeningpage().route(context));
        },
        text: "ถัดไป",
        radius: 32,
        width: 345,
        height: 52,
        color: Theme.of(context).colorScheme.primary,
        borderSide: BorderSide.none,
        style: Theme.of(context).textTheme.displayMedium);
  }
}
