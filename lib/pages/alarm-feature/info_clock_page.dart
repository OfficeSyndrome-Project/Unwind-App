import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class InfoErgonomicPage extends StatelessWidget {
  const InfoErgonomicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      textBar: "นาฬิกาจับเวลา",
      iconButtonStart: IconButton(
          alignment: Alignment.centerLeft,
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.all(0),
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
            Container(
              width: ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
              margin: EdgeInsets.only(top: 24, bottom: 8),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  width:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
                  height:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('lib/assets/images/time-management.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'หลักการทำงานของนาฬิกาจับเวลา',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
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
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF636A75),
                          )
                        : Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '2. เลือกจำนวนเวลาที่ต้องการพัก',
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF636A75),
                          )
                        : Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '3. นาฬิกาจะแจ้งเตือนเมื่อครบเวลาที่กำหนดไว้',
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF636A75),
                          )
                        : Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '4. เมื่อพักเสร็จสิ้น สามารถเลือกได้ว่าต้องการทำงานต่อหรือไม่',
                    style: ResponsiveCheckWidget.isSmallMobile(context)
                        ? TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF636A75),
                          )
                        : Theme.of(context).textTheme.titleSmall,
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
