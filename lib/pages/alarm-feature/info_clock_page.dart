import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class InfoClockPage extends StatelessWidget {
  const InfoClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      textBar: "นาฬิกาจับเวลา",
      iconButtonStart: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          )),
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RatioImageoneToOne(
              assetName: 'lib/assets/images/time-management.png',
              smallWidth: 200,
              largeWidth: 250,
              smallHeight: 200,
              largeHeight: 250,
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'หลักการทำงานของนาฬิกาจับเวลา',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF484D56),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. เลือกจำนวนเวลาที่ต้องการทำงาน',
                    style: TextStyle(
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                  Text(
                    '2. เลือกจำนวนเวลาที่ต้องการพัก',
                    style: TextStyle(
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                  Text('3. นาฬิกาจะแจ้งเตือนเมื่อครบเวลาที่กำหนดไว้',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF636A75),
                      )),
                  Text(
                    '4. เมื่อพักเสร็จสิ้น สามารถเลือกได้ว่าต้องการทำงานต่อหรือไม่',
                    style: TextStyle(
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
