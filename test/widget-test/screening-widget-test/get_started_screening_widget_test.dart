import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/screening-widget/get_started_screening_widget.dart';

void main() {
  testWidgets('test ScreeningBox widget', (WidgetTester tester) async {
    const String assetPath = 'lib/assets/images/blank_profile.png';
    const String titleLabel = 'Screening Title';
    const String descriptionLabel = 'Screening Description';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreeningBoxWidget(
            assetPath: assetPath,
            titleLabel: titleLabel,
            descriptionLabel: descriptionLabel,
          ),
        ),
      ),
    );
    expect(find.byType(Container), findsOneWidget);
    expect(find.text(titleLabel), findsOneWidget);
    expect(find.text(descriptionLabel), findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(ScreeningBoxWidget), matching: find.byType(Text)),
        findsNWidgets(2));
    expect(find.byType(Container), findsOneWidget);
  });
}
