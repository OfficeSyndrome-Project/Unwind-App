import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/screening_box_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';


class ScreeningPage extends StatelessWidget {
  ScreeningPage({Key? key}) : super(key: key);
  PageRoutes pageRoutes = PageRoutes();
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ScreeningBoxWidget(
            assetPath: 'lib/assets/images/screeningPart/screening-1.png',
            titleLabel: "ปวดเมื่อยจากการทำงานใช่ไหม ?",
            descriptionLabel:
                "หากการทำงานทำให้คุณรู้สึกปวดเมื่อยไม่สบายตัว\nส่งผลต่อสภาพจิตใจและร่างกายของคุณอยู่บ่อยครั้ง\nให้ unwind ช่วยคุณ",
          ),
          const SizedBox(
            height: 32,
          ),
          ButtomTapTheme(
              text: "ถัดไป",
              radius: 32,
              width: 345,
              height: 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: Theme.of(context).textTheme.displayMedium),

          // ScreeningBoxWidget(assetPath: 'lib/assets/images/screeningPart/screening-1.png',
          // titleLabel: "บรรเทาอาการเจ็บปวด",
          // descriptionLabel: "บรรเทาอาการปวดเหล่านั้นกับ unwind\nด้วยวิธีการตรวจที่แม่นยำและให้ชุดท่าบริหารที่เหมาะสม\nซึ่งได้รับการยืนยันจากแพทย์ผู้เชี่ยวชาญ",),

          // ScreeningBoxWidget(assetPath: '',
          // titleLabel: 'ติดตามผลอาการของคุณ',
          // descriptionLabel: 'unwind ติดตามผลอาการของคุณอย่างสม่ำเสมอ\nโดยคุณสามารถดูผลอาการของตนเองย้อนหลังได้'),

          // ScreeningBoxWidget(assetPath: '',
          // titleLabel: 'ป้องกันอาการเจ็บปวด',
          // descriptionLabel: 'ป้องกันอาการเจ็บปวดจากการทำงานที่ต้นเหตุ\nunwind จะแนะนำการจัดสภาพแวดล้อมการทำงาน รวมถึงเวลาในการทำงานที่เหมาะให้กับคุณ'),
        ]);
        
  }
}

//Button Next Page Controller
class StartingNextPageButton extends StatefulWidget {
  const StartingNextPageButton({ Key? key,
  required this.currentPage,
  required this.pageRoutes,
  required PageController controller,
  }) : _controller=controller;

  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController _controller;

  @override
  _StartingNextPageButton createState() => _StartingNextPageButton();
}

class _StartingNextPageButton extends State<StartingNextPageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}