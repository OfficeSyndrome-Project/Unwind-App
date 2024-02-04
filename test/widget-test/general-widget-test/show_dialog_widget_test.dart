import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/show_dialog_widget.dart';

void main() {
  testWidgets('test AlertDialog widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              await alertDialog.getshowDialog(
                context,
                "testTitle",
                "testSubtitle",
                () {
                  print("NO tapped");
                },
                () {
                  print("YES tapped");
                },
              );
            },
            child: const Text('Show Dialog'),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.text('Show Dialog'));
    await tester.pump();
    expect(find.text('testTitle'), findsOneWidget);
    expect(find.text('testSubtitle'), findsOneWidget);
    expect(find.text('ไม่'), findsOneWidget);
    expect(find.text('ใช่'), findsOneWidget);
    // await tester.tap(find.text('ใช่'));
    // await tester.pump();
  });
}
