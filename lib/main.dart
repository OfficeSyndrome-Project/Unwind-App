import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unwind_app/database/screeningtestanswer_db.dart';
import 'package:unwind_app/database/workoutlist_db.dart';

import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_model.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_service.dart';
import 'package:unwind_app/models/screeningtestanswer_model.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/pages/home.dart';
import 'package:unwind_app/globals/theme/theme_app.dart';

import 'package:unwind_app/pages/screening-feature/get_started_screening_page.dart';
import 'package:unwind_app/services/answer-service/answer_service.dart';

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
  await TrashCan.getAnswers();

  runApp(MyApp(isFirstTime: isFirstTime ?? true));
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

class TrashCan {
  static Future<void> getAnswers() async {
    final availableWorkoutListTitle =
        await serviceLocator<WorkoutListDB>().getAvailableWorkoutListTitles();
    if (availableWorkoutListTitle.length > 0) {
      await serviceLocator<ScreeningTestAnswerWorkoutListService>()
          .getAllScreeningTestByAreaTitle(availableWorkoutListTitle.first);
    }
    final answerDb = serviceLocator<ScreeningTestAnswerDB>();
    final answers = await answerDb.getAllScreeningTestAnswer();

    answers.forEach((answer) {
      final question = AnswerService.questionOf(answer);
      // print(
      //     '--- answer.questionId : ${answer.questionId} area : ${answer.area}');
      // print(question.assetPath);
      // print(question.areaAssetPath);
      // print(question.question);
      // print(AnswerService.interpret(answer).text);
      print('--- question : ${question.question}');
      if (question.questionPart == 2) {
        print('--- posture : ${question.painTypeAssetPath}');
      }
      if (question.questionPart == 3) {
        print('--- posture : ${question.painTypeAssetPath}');
      }
      // print('--- area : ${answer.area}');
      // print('--- areaAssetPath : ${question.areaAssetPath}');
      // print('--- assetPath : ${question.assetPath}');
      print('--- answer : ${AnswerService.interpret(answer).text}');
    });
  }

  Future<void> run() async {
    final answers = [
      ScreeningTestAnswerModel(
        questionPart: 1,
        area: "A",
        questionId: 1,
        answer: 1,
      ),
      ScreeningTestAnswerModel(
        questionPart: 1,
        area: "B",
        questionId: 2,
        answer: 2,
      ),
    ];

    ScreeningTestAnswerWorkoutListService
        screeningTestAnswerWorkoutListService =
        serviceLocator<ScreeningTestAnswerWorkoutListService>();
    WorkoutListDB workoutListDB = serviceLocator<WorkoutListDB>();
    final answerDb = serviceLocator<ScreeningTestAnswerDB>();
    final answerModels = await Future.wait(answers
        .map((answer) => answerDb.insertScreeningTestAnswer(answer))
        .toList());
    final workouts = [
      WorkoutListModel(
        date: DateTime.now(),
        WOL_title: "test",
      ),
      WorkoutListModel(
        date: DateTime.now(),
        WOL_title: "test",
      ),
    ];
    final workoutListModels = await Future.wait(workouts
        .map((workout) => workoutListDB.insertWorkoutList(workout))
        .toList());
    print(workoutListModels);

    final screeningTestAnswerWorkoutListModels = answerModels
        .where((answer) => answer?.id != null)
        .whereType<ScreeningTestAnswerModel>()
        .map((answer) => workoutListModels
            .map((workout) => ScreeningTestAnswerWorkoutListModel(
                  screeningTestAnswerId: answer.id,
                  workoutListId: workout.id,
                ))
            .toList())
        .expand((element) => element)
        .toList();

    final result = await screeningTestAnswerWorkoutListService
        .insertAll(screeningTestAnswerWorkoutListModels);
    print('result : $result');
    print(result.length);

    final gg = await screeningTestAnswerWorkoutListService
        .getAllScreeningTestAnswerByWorkoutList(workoutListModels.first);
    print('querying by workout id : ${workoutListModels.first.id}');
    print(gg);
    print(gg.length);
  }
}
