import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';
import 'package:unwind_app/pages/screening-feature/get_started_screening_page.dart';
import 'package:unwind_app/services/general_stored_service.dart';

<<<<<<< HEAD
import 'package:unwind_app/pages/workoutList-feature/schedule_page.dart';

void main() {
=======
void main() async {
>>>>>>> main
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('th');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await init();
  final isFirstTime = await GeneralStoredService.readBoolean(
      GeneralStoredService.isFirstTime, 0, 0);
  if (isFirstTime == null) {
    await GeneralStoredService.writeBoolean(
        GeneralStoredService.isFirstTime, 0, 0, true);
  }

  runApp(MyApp(isFirstTime: isFirstTime ?? true));
}

class MyApp extends StatelessWidget {
  final bool? isFirstTime;
  const MyApp({super.key, this.isFirstTime});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: HomePage(
        selectedIndex: 0,
        devScreen: SchedulePage(),
      ),
=======
      home: isFirstTime ?? true
          ? const ScreeningPage()
          : const HomePage(selectedIndex: 0),
>>>>>>> main
      theme: appTheme,
    );
  }
}
