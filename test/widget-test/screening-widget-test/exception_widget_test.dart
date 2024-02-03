import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/screening-widget/exception_widget.dart';

void main() {
  testWidgets('test ExceptionBox widget', (WidgetTester tester) async {
    const String assetPath = 'lib/assets/images/blank_profile.png';
    const String titleLabel = 'Error Title';
    const String descriptionLabel = 'Error Description';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExceptionBoxWidget(
            assetPath: assetPath,
            titleLabel: titleLabel,
            descriptionLabel: descriptionLabel,
          ),
        ),
      ),
    );

    expect(find.byType(RatioImageoneToOne), findsOneWidget);
    expect(find.text(titleLabel), findsOneWidget);
    expect(find.text(descriptionLabel), findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(ExceptionBoxWidget), matching: find.byType(Text)),
        findsNWidgets(2));
    expect(find.byType(RatioImageoneToOne), findsOneWidget);
  });
}
