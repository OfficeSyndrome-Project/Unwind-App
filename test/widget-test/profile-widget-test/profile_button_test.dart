import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_button.dart';

void main() {
  testWidgets('test ProfileButton widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileButton(
            onPressed: () {
              Text('ProfileButton pressed');
            },
          ),
        ),
      ),
    );

    expect(find.text('ยืนยัน'), findsOneWidget);
    final ElevatedButton elevatedButton =
        tester.widget(find.byType(ElevatedButton));
    expect(
      elevatedButton.style?.minimumSize?.resolve({}),
      equals(Size(100, 52)),
    );
    expect(
      elevatedButton.style?.shape?.resolve({}),
      equals(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(width: 0.0, style: BorderStyle.none),
      )),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
