import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class SuccessfulWorkoutPage extends StatelessWidget {
  SuccessfulWorkoutPage({Key? key}) : super(key: key);

  final PageRoutes pageRoutes = PageRoutes();
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      iconButtonStart: IconButton(
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary),
      colorBar: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 50, bottom: 30),
                child: RatioImageoneToOne(
                    assetName: 'lib/assets/images/successful_icon.png',
                    smallWidth: 240,
                    largeWidth: 280,
                    smallHeight: 240,
                    largeHeight: 280),
              ),
              Text(
                'ยินดีด้วย!\nคุณได้ทำการออกกำลังกายสำเร็จอย่างดีเยี่ยม ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF646A76),
                ),
              )
            ],
          ),
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              Navigator.push(
                  context, pageRoutes.home.workoutlist().route(context));
            },
            text: 'กลับหน้าแรก',
            radius: 32,
            width: double.infinity,
            height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
            color: Theme.of(context).colorScheme.primary,
            borderSide: BorderSide.none,
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  )
                : Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
