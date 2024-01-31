import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/get_started_screening_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../Widgets/button_withouticon_widget.dart';

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
        vertical: ResponsiveCheckWidget.isSmallMobile(context) ? 0 : 16,
        iconButtonStart: (currentPage >= 1)
            ? IconButton(
                onPressed: () {
                  currentPage >= 1
                      ? _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut)
                      : Navigator.pop(context);
                },
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: ResponsiveCheckWidget.isSmallMobile(context) ? 0 : 32,
              ),
              Container(
                width: double.infinity,
                height:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 350 : 356,
                margin: EdgeInsets.only(
                    bottom: ResponsiveCheckWidget.isSmallMobile(context) == true
                        ? 0
                        : 32),
                padding: EdgeInsets.zero,
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
                            "หากการทำงานทำให้คุณรู้สึกปวดเมื่อยไม่สบายตัว ส่งผลต่อสภาพจิตใจและร่างกายของคุณอยู่บ่อยครั้งให้ unwind ช่วยคุณ"),
                    ScreeningBoxWidget(
                      assetPath:
                          'lib/assets/images/screeningPart/get_started_2.png',
                      titleLabel: "บรรเทาอาการเจ็บปวด",
                      descriptionLabel:
                          "บรรเทาอาการปวดเหล่านั้นกับ unwind ด้วยวิธีการตรวจที่แม่นยำและให้ชุดท่าบริหารที่เหมาะสม ซึ่งได้รับการยืนยันจากแพทย์ผู้เชี่ยวชาญ",
                    ),
                    ScreeningBoxWidget(
                        assetPath:
                            'lib/assets/images/screeningPart/get_started_3.png',
                        titleLabel: 'ติดตามผลอาการของคุณ',
                        descriptionLabel:
                            'unwind ติดตามผลอาการของคุณอย่างสม่ำเสมอ โดยคุณสามารถดูผลอาการของตนเองย้อนหลังได้'),
                    ScreeningBoxWidget(
                        assetPath:
                            'lib/assets/images/screeningPart/get_started_4.png',
                        titleLabel: 'ป้องกันอาการเจ็บปวด',
                        descriptionLabel:
                            'ป้องกันอาการเจ็บปวดจากการทำงานที่ต้นเหตุ unwind จะแนะนำการจัดสภาพแวดล้อมการทำงาน รวมถึงเวลาในการทำงานที่เหมาะให้กับคุณ'),
                    ScreeningBoxWidget(
                        assetPath:
                            'lib/assets/images/screeningPart/get_started_1.png',
                        titleLabel: 'ยินดีต้อนรับเข้าสู่ unwind ! ',
                        descriptionLabel:
                            'แอปพลิเคชันที่คุณสามารถรักษาอาการ ออฟฟิศซินโดรมได้ด้วยตัวของคุณเอง '),
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 5,
                position: currentPage,
                decorator: DotsDecorator(
                  color: const Color(0xFFC3C8D2),
                  activeColor: Theme.of(context).colorScheme.primary,
                  size: const Size.square(8.0),
                  spacing: const EdgeInsets.all(4.0),
                ),
              ),
            ],
          )),

          // SizedBox(
          //   height: ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 32,
          // ),
          ButtonWithoutIconWidget(
              text: currentPage == 4 ? 'เริ่มประเมินอาการปวดของคุณ' : 'ถัดไป',
              radius: 32,
              width: 345,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    )
                  : Theme.of(context).textTheme.headlineSmall,
              onTap: () {
                currentPage < 4
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpage(0, []).route(context));
              }),

          // ),
        ]);
  }
}
