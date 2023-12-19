import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import '../../Widgets/responsive_check_widget.dart';

class ErgonomicPage extends StatelessWidget {
  ErgonomicPage({super.key});
  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      textBar: "ปรับสภาพแวดล้อมการทำงาน",
      iconButtonStart: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(0),
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatioImageoneToOne(assetName: 'lib/assets/images/worker-ergonomic.png'),
        const SizedBox(
          height: 32,
        ),
        Text(
          "รายการตรวจสอบการยศาสตร์",
          style: ResponsiveCheckWidget.isSmallMobile(context)
              ? TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF484D56),
                )
              : Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "เป้าหมายของรายการนี้คือการช่วยให้คุณจัดท่าทาง\nการนั่งในการทำงานได้อย่างเหมาะสมที่สุดเพื่อ\nการทำงานที่มีประสิทธิภาพ โดยมีทั้งหมด 7 ส่วน",
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  )
                : Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              Navigator.push(
                  context, pageRoutes.menu.questionergonomic().route(context));
            },
            text: "ถัดไป",
            radius: 32,
            width: double.infinity,
            height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
            color: Theme.of(context).colorScheme.primary,
            borderSide: BorderSide.none,
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
