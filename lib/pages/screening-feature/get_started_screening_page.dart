import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/get_started_screening_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/welcome_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../Widgets/button_withouticon_widget.dart';

class ScreeningPage extends StatefulWidget {
  const ScreeningPage({super.key, this.isFirstTime});

  final bool? isFirstTime;

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
        iconButtonStart: (currentPage >= 1 || widget.isFirstTime == false)
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
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
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
                            "หากการทำงานทำให้คุณรู้สึกปวดเมื่อยไม่สบายตัว ส่งผลต่อสภาพจิตใจและร่างกายของคุณอยู่บ่อยครั้งให้ UNWIND ช่วยคุณ"),
                    ScreeningBoxWidget(
                      assetPath:
                          'lib/assets/images/screeningPart/get_started_2.png',
                      titleLabel: "บรรเทาอาการเจ็บปวด",
                      descriptionLabel:
                          "บรรเทาอาการปวดเหล่านั้นกับ UNWIND ด้วยวิธีการตรวจที่แม่นยำและให้ชุดท่าบริหารที่เหมาะสม ซึ่งได้รับการยืนยันจากแพทย์ผู้เชี่ยวชาญ",
                    ),
                    ScreeningBoxWidget(
                        assetPath:
                            'lib/assets/images/screeningPart/get_started_3.png',
                        titleLabel: 'ติดตามผลอาการของคุณ',
                        descriptionLabel:
                            'UNWIND ติดตามผลอาการของคุณอย่างสม่ำเสมอ โดยคุณสามารถดูผลอาการของตนเองย้อนหลังได้'),
                    ScreeningBoxWidget(
                        assetPath:
                            'lib/assets/images/screeningPart/get_started_4.png',
                        titleLabel: 'ป้องกันอาการเจ็บปวด',
                        descriptionLabel:
                            'ป้องกันอาการเจ็บปวดจากการทำงานที่ต้นเหตุ UNWIND จะแนะนำการจัดสภาพแวดล้อมการทำงาน รวมถึงเวลาในการทำงานที่เหมาะให้กับคุณ'),
                    ScreeningBoxWidget(
                        assetPath:
                            'lib/assets/images/screeningPart/get_started_5.png',
                        titleLabel: 'ทำอย่างไรหากไม่เข้าใจในอาการแต่ละรูปแบบ ?',
                        descriptionLabel:
                            'สามารถกดไอคอนรูปตัว i มุมขวาบน เพื่อดูรายละเอียดแต่ละอาการปวดได้'),
                    WelcomeWidget(
                        assetPath: 'lib/assets/images/logo.png',
                        titleLabel: 'ยินดีต้อนรับเข้าสู่ UNWIND ! ',
                        descriptionLabel:
                            'แอปพลิเคชันที่คุณสามารถรักษาอาการ ออฟฟิศซินโดรมได้ด้วยตัวของคุณเอง '),
                  ],
                ),
              ),
              DotsIndicator(
                dotsCount: 6,
                position: currentPage,
                decorator: DotsDecorator(
                  color: const Color(0xFFC3C8D2),
                  activeColor: Theme.of(context).colorScheme.primary,
                  size: const Size.square(8.0),
                  spacing: const EdgeInsets.all(4.0),
                ),
              ),
              ResponsiveCheckWidget.isSmallMobile(context)
                  ? SizedBox(
                      height: 32,
                    )
                  : Spacer(
                      flex: 1,
                    ),
            ],
          )),
          ButtonWithoutIconWidget(
              text: currentPage == 5 ? 'เริ่มประเมินอาการปวดของคุณ' : 'ถัดไป',
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
                currentPage < 5
                    ? _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut)
                    : Navigator.push(
                        context,
                        pageRoutes.screening
                            .introscreeningpage(0, [], [], null)
                            .route(context));
              }),

          // ),
        ]);
  }
}
