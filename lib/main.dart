import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_three_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // testServiceScreeningPartTwo();
  // testServiceScreeningPartThree();
  runApp(const MyApp());
}

//test service
// void testServiceScreeningPartThree() {
//   var selectedPart = "หลังส่วนล่าง";
//   ScreeningPartThreeModel result = ScreeningQuestionPartThreeService
//       .getScreeningPartThreeModelBySelectedPart(selectedPart);
//   var posture = result.postures;
//   var question = result.questions;
//   print("---เลือกส่วนที่ต้องการตรวจ $selectedPart");
//   print("มีทั้งหมด : ${posture.length} ท่า");
//   for (var posture in posture) {
//     print("posture name : ${posture.postureName}");
//     print("   assetPath : ${posture.assetPath}");
//     print("  question: ${posture.question}");
//     print(" questionId: ${posture.questionId}");
//     print(" questionPage: ${posture.questionPage}");
//   }
//   print("--------------");
//   for (var question in question) {
//     // print("title: ${question.title}");
//     print("question : ${question.question}");
//     print("questionId : ${question.questionId}");
//     print("questionPage : ${question.questionPage}");
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: appTheme,
    );
  }
}
