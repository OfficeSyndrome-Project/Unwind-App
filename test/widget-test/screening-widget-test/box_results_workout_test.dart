import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/screening-widget/box_results_workout.dart';

void main() {
  testWidgets('test BoxResultsWorkout widget', (WidgetTester tester) async {
    const String name = 'Workout Name';
    const String detail = 'Workout Details';
    const Duration time = Duration(seconds: 2); // 2 minutes
    const String imagePath = 'lib/assets/images/blank_profile.png';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoxResultsWorkout(
            name: name,
            detail: detail,
            time: time,
            imagePath: imagePath,
          ),
        ),
      ),
    );
    expect(find.text(name), findsOneWidget);
    expect(find.text(detail), findsOneWidget);
    expect(find.text('00 : 02'), findsOneWidget);
    expect(find.byType(RatioImageoneToOne), findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(BoxResultsWorkout), matching: find.byType(Text)),
        findsWidgets);
    expect(
        find.descendant(
            of: find.byType(BoxResultsWorkout),
            matching: find.byType(RatioImageoneToOne)),
        findsOneWidget);
  });
}
