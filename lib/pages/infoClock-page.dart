// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';

class InfoErgonomicPage extends StatelessWidget {
  const InfoErgonomicPage({Key? key}) : super(key: key);

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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  width: 250,
                  height: 250,
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
            const SizedBox(
              height: 8,
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
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '2. เลือกจำนวนเวลาที่ต้องการพัก',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '3. นาฬิกาจะแจ้งเตือนเมื่อครบเวลาที่กำหนดไว้',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '4. เมื่อพักเสร็จสิ้น สามารถเลือกได้ว่าต้องการทำงานต่อหรือไม่',
                    style: Theme.of(context).textTheme.titleSmall,
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
