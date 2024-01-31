import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

void main() {
  testWidgets('test ResponsiveCheck widget', (WidgetTester tester) async {
    const Widget smallMobileWidget = Text('Small Mobile');
    const Widget mediumMobileWidget = Text('Medium Mobile');
    const Widget largeMobileWidget = Text('Large Mobile');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ResponsiveCheckWidget(
            smallMobile: smallMobileWidget,
            mediumMobile: mediumMobileWidget,
            largeMobile: largeMobileWidget,
          ),
        ),
      ),
    );
    await tester.binding.setSurfaceSize(Size(300, 600));
    await tester.pump();
    expect(find.text('Small Mobile'), findsOneWidget);
    expect(find.text('Medium Mobile'), findsNothing);
    expect(find.text('Large Mobile'), findsNothing);
    await tester.binding.setSurfaceSize(Size(400, 600));
    await tester.pump();
    expect(find.text('Small Mobile'), findsNothing);
    expect(find.text('Medium Mobile'), findsOneWidget);
    expect(find.text('Large Mobile'), findsNothing);
    await tester.binding.setSurfaceSize(Size(600, 800));
    await tester.pump();
    expect(find.text('Small Mobile'), findsNothing);
    expect(find.text('Medium Mobile'), findsNothing);
    expect(find.text('Large Mobile'), findsOneWidget);
  });
}
