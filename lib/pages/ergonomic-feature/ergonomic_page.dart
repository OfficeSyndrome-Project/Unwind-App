import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/globals/theme/button_withouticon_theme.dart';

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
        SizedBox(
          width: 200,
          height: 200,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/worker-ergonomic.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "รายการตรวจสอบการยศาสตร์",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            "เป้าหมายของรายการนี้คือการช่วยให้คุณจัดท่าทาง\nการนั่งในการทำงานได้อย่างเหมาะสมที่สุดเพื่อ\nการทำงานที่มีประสิทธิภาพ โดยมีทั้งหมด 7 ส่วน",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ButtonTapTheme(
            onTap: () {
              Navigator.push(
                  context, pageRoutes.menu.questionergonomic().route(context));
            },
            text: "ถัดไป",
            radius: 32,
            width: double.infinity,
            height: 52,
            color: Theme.of(context).colorScheme.primary,
            borderSide: BorderSide.none,
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
