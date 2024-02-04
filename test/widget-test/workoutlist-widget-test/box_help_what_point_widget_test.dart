import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/box_help_what_point_widget.dart';

void main() {
  testWidgets('test BoxHelpWhatPoint widget', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BoxHelpWhatPointWidget(
            helpPoint: 'Help Point',
          ),
        ),
      ),
    );

    await tester.pump();
    expect(find.byType(BoxHelpWhatPointWidget), findsOneWidget);
    expect(find.text('Help Point'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
  });
}
