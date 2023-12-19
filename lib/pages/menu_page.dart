import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/pages/alarm-feature/clock_page.dart';

import 'ergonomic-feature/ergonomic_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        textBar: "เมนู",
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            // color: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ErgonomicPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: ResponsiveCheckWidget.isSmallMobile(context)
                        ? 116
                        : 136,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      image: const DecorationImage(
                        image: AssetImage(
                            'lib/assets/images/ergonomic-img/ergonomic.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Text(
                  'ปรับสภาพแวดล้อมการทำงาน',
                  style: ResponsiveCheckWidget.isSmallMobile(context)
                      ? TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF484D56),
                        )
                      : Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClockPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: ResponsiveCheckWidget.isSmallMobile(context)
                        ? 116
                        : 136,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/clock.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Text(
                  'นาฬิกาจับเวลา',
                  style: ResponsiveCheckWidget.isSmallMobile(context)
                      ? TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF484D56),
                        )
                      : Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ]);
  }
}
