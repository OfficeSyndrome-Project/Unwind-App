import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';

void main() {
  testWidgets('test TextWithStartIconWidget widget',
      (WidgetTester tester) async {
    final Icon testIcon = Icon(Icons.heart_broken);
    final String testTopicName = 'Test Topic';
    final TextStyle testStyle = TextStyle(color: Colors.blue);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextWithStartIconWidget(
            startIcon: testIcon,
            topicName: testTopicName,
            style: testStyle,
          ),
        ),
      ),
    );

    final Finder textWithIconFinder = find.byType(TextWithStartIconWidget);
    expect(textWithIconFinder, findsOneWidget);
    expect(find.text(testTopicName), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNothing);
    expect(find.byIcon(Icons.heart_broken), findsOneWidget);
    final TextStyle? textStyle =
        tester.widget<Text>(find.text(testTopicName)).style;
    expect(textStyle?.color, equals(Colors.blue));
  });
}
