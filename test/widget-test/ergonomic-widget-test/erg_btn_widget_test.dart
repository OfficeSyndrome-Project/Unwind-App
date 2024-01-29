import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_btn_widget.dart';

void main() {
  testWidgets('test DetectorButton widget', (WidgetTester tester) async {
    final PageRoutes testPageRoutes = PageRoutes();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DetectorButton(
            currentPage: 1,
            pageRoutes: testPageRoutes,
            controller: PageController(),
            disable: false,
          ),
        ),
      ),
    );

    expect(find.byType(ButtonWithoutIconWidget), findsOneWidget);
    expect(find.text('ถัดไป'), findsOneWidget);
    await tester.pumpAndSettle();
    // expect(find.byType(RouteResultErgonomic), findsOneWidget);
    // await tester.tap(find.byType(ButtonWithoutIconWidget));
    // await tester.pump();
    // await tester.pumpAndSettle();
  });
}
