import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/screening-widget/typepain_container.dart';

void main() {
  testWidgets('test TypepainContainer widget', (WidgetTester tester) async {
    const String expectedAssetName = 'lib/assets/images/blank_profile.png';
    await tester.pumpWidget(
      MaterialApp(
        home: TypepainContainer(
            onTap: () {},
            isSelect: true,
            typePain: 'Type of Pain',
            assetName: expectedAssetName),
      ),
    );

    expect(find.byType(TypepainContainer), findsOneWidget);
    expect(
        tester
            .widget<TypepainContainer>(find.byType(TypepainContainer))
            .isSelect,
        true);
    expect(find.text('Type of Pain'), findsOneWidget);
    TypepainContainer widget =
        tester.firstWidget(find.byType(TypepainContainer));
    expect(widget.assetName, equals(expectedAssetName));
    await tester.tap(find.byType(TypepainContainer));
    await tester.pump();
  });
}
