import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/screening-widget/get_started_screening_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';

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
        iconButtonStart: (currentPage >= 1)
            ? IconButton(
                onPressed: () {
                  currentPage >= 1
                      ? _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut)
                      : Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(0),
              )
            : null,
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 356,
            margin: const EdgeInsets.only(bottom: 32),
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
                        'lib/assets/images/screeningPart/get_started_1.png',
                    titleLabel: "ปวดเมื่อยจากการทำงานใช่ไหม ?",
                    descriptionLabel:
                        "หากการทำงานทำให้คุณรู้สึกปวดเมื่อยไม่สบายตัว\nส่งผลต่อสภาพจิตใจและร่างกายของคุณอยู่บ่อยครั้งให้ unwind ช่วยคุณ"),
                ScreeningBoxWidget(
                  assetPath:
                      'lib/assets/images/screeningPart/get_started_2.png',
                  titleLabel: "บรรเทาอาการเจ็บปวด",
                  descriptionLabel:
                      "บรรเทาอาการปวดเหล่านั้นกับ unwind\nด้วยวิธีการตรวจที่แม่นยำและให้ชุดท่าบริหารที่เหมาะสม\nซึ่งได้รับการยืนยันจากแพทย์ผู้เชี่ยวชาญ",
                ),
                ScreeningBoxWidget(
                    assetPath:
                        'lib/assets/images/screeningPart/get_started_3.png',
                    titleLabel: 'ติดตามผลอาการของคุณ',
                    descriptionLabel:
                        'unwind ติดตามผลอาการของคุณอย่างสม่ำเสมอ\nโดยคุณสามารถดูผลอาการของตนเองย้อนหลังได้'),
                ScreeningBoxWidget(
                    assetPath:
                        'lib/assets/images/screeningPart/get_started_4.png',
                    titleLabel: 'ป้องกันอาการเจ็บปวด',
                    descriptionLabel:
                        'ป้องกันอาการเจ็บปวดจากการทำงานที่ต้นเหตุ\nunwind จะแนะนำการจัดสภาพแวดล้อมการทำงาน รวมถึงเวลาในการทำงานที่เหมาะให้กับคุณ'),
                ScreeningBoxWidget(
                    assetPath:
                        'lib/assets/images/screeningPart/get_started_1.png',
                    titleLabel: 'ยินดีต้อนรับเข้าสู่ unwind ! ',
                    descriptionLabel:
                        'แอปพลิเคชันที่คุณสามารถรักษาอาการ\nออฟฟิศซินโดรมได้ด้วยตัวของคุณเอง '),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: 5,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              color: const Color(0xFFC3C8D2),
              activeColor: Theme.of(context).colorScheme.primary,
              size: const Size.square(8.0),
              spacing: const EdgeInsets.all(4.0),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ButtonTapTheme(
              text: currentPage == 4 ? 'เริ่มประเมินอาการปวดของคุณ' : 'ถัดไป',
              radius: 32,
              width: 345,
              height: 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: Theme.of(context).textTheme.displayMedium,
              onTap: () {
                currentPage < 4
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpagepartone()
                            .route(context));
              }),

          // ),
        ]);
  }
}
