import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/database/screeningtest_db.dart';

import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/screeningtest_model.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';
import 'package:unwind_app/pages/screening-feature/get_started_screening_page.dart';

import 'package:unwind_app/services/general_stored_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:unwind_app/services/schedule-service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initNotification();
  tz.initializeTimeZones();

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
  print("isFirstTime: $isFirstTime");

  runApp(MyApp(isFirstTime: isFirstTime ?? true));
  final ScreeningTestModel screeningTestModel = ScreeningTestModel(
    created_at: DateTime.now(),
  );
  final screeningTestDB = serviceLocator<ScreeningTestDB>();
  final success = await screeningTestDB.insertScreeningTest(screeningTestModel);
  print('screeningTestModel: $success');
  // dispose();
}

class MyApp extends StatelessWidget {
  final bool? isFirstTime;
  const MyApp({super.key, this.isFirstTime});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isFirstTime ?? true
          ? const ScreeningPage()
          : HomePage(
              selectedIndex: 0,
            ),
      theme: appTheme,
    );
  }
}
