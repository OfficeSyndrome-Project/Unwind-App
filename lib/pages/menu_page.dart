import 'package:flutter/material.dart';
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
          SizedBox(
            width: double.infinity,
            height: 148,
            // color: Colors.black,
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
                            builder: (context) => ErgonomicPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 116,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/ergonomic.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'ปรับสภาพแวดล้อมการทำงาน',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            height: 148,
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
                    height: 116,
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
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'นาฬิกาจับเวลา',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ]);
  }
}
