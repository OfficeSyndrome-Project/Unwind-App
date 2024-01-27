import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/database/screeningtest_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('th');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await init();

  final stdb = ScreeningTestDB(serviceLocator());
  stdb.insertScreeningTest(DateTime.now());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(selectedIndex: 0),
      theme: appTheme,
    );
  }
}
