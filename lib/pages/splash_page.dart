import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/pages/screening-feature/get_started_screening_page.dart';

class SplashPage extends StatefulWidget {
  final bool? isFirstTime;
  const SplashPage({Key? key, this.isFirstTime}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => widget.isFirstTime ?? true
              ? const ScreeningPage()
              : HomePage(
                  selectedIndex: 0,
                ),
        ));
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            RatioImageoneToOne(
                assetName: 'lib/assets/logo_white.png',
                smallWidth: 120,
                largeWidth: 140,
                smallHeight: 120,
                largeHeight: 140),
            SizedBox(
              height: 20,
            ),
            Text(
              'UNWIND',
              style: TextStyle(
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 30 : 36,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF),
              ),
            )
          ],
        ),
      ),
    );
  }
}
