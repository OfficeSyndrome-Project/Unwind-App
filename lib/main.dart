import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/database/screeningtest_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('th');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await init();

  final stdb = ScreeningTestDB(serviceLocator());
  stdb.insertScreeningTest(DateTime.now());

  // ScreeningDiagnoseService.diagnose(
  //   [
  //     Answer(QuestionPart: 2, title: "คอ", questionID: 2, answer: 1)
  //   ],
  //   {
  //     ScreeningTitle.neck: 2,
  //     ScreeningTitle.baa: 2,
  //     ScreeningTitle.shoulder: 3,
  //     ScreeningTitle.lowerback: 4,
  //     ScreeningTitle.upperback: 8,
  //   }
  // );
  // WorkoutListDB wl = WorkoutListDB(serviceLocator());
  // await wl.insertWorkoutList(
  //   WorkoutListModel(
  //     date: DateTime.now(),
  //     WOL_title: WorkoutlistTitle.neckbaa_ch.name,
  //     remaining_times: 20,
  //     WOL_id: 1,
  //     NRS_before: null,
  //     NRS_after: null
  //   )
  // );
  // // wl.getallWorkoutList().then((value) => print(value));
  // // wl.getWorkoutListByDate(DateTime.now()).then((value) => print("$value\n"))
  // final rub = await wl.getWorkoutListByDateAndTitle(DateTime.now(), WorkoutlistTitle.neckbaa_ch.name).then((value)=>value.first);
  // if (rub.WOL_id != null) {
  //   wl.updateNRSbefore(5, rub.WOL_id!);
  // }
  // await wl.updateNRSafter(4, rub.WOL_id!);
  // final test = ScreeningDiagnoseService.Give_Workoutlist_Per_Day([
  //   WorkoutlistTitle.neckbaa_ch,
  //   WorkoutlistTitle.neckbaa_th,
  //   WorkoutlistTitle.shoulder,
  //   WorkoutlistTitle.back_ch,
  //   WorkoutlistTitle.back_th,
  // ]);
  // print(test);
  // WorkoutListDB wl = WorkoutListDB(serviceLocator());
  // for (var wol_title in test.values) {
  //   for (var wol in wol_title) {
  //     await wl.insertWorkoutList(wol);
  //   }
  // }
  // ScreeningDiagnoseService.diagnose([
  //   Answer(QuestionPart: 2, title: "คอ", questionID: 2, answer: 2)
  // ], {
  //   ScreeningTitle.neck: 2,
  //   ScreeningTitle.baa: 2,
  //   ScreeningTitle.shoulder: 3,
  //   ScreeningTitle.lowerback: 4,
  //   ScreeningTitle.upperback: 8,
  // });
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
