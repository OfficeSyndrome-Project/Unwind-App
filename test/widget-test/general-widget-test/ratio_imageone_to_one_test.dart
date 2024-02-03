import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
// import 'package:unwind_app/Widgets/responsive_check_widget.dart';

void main() {
  testWidgets('test RatioImageoneToOne widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RatioImageoneToOne(
            assetName: 'lib/assets/images/blank_profile.png',
            smallWidth: 50.0,
            largeWidth: 100.0,
            smallHeight: 50.0,
            largeHeight: 100.0,
          ),
        ),
      ),
    );

    expect(find.byType(Container).first, findsOneWidget);
    ////////////////NOTE//////////////////////
    ///////////////responsive/////////////////
    ///////////////test problem///////////////
    expect(find.byType(AspectRatio), findsOneWidget);
    expect(
      tester
          .widget<AspectRatio>(
            find.byType(AspectRatio),
          )
          .aspectRatio,
      1 / 1,
    );

    // expect(find.byType(DecorationImage), findsOneWidget);
    // expect(
    //   tester.widget<DecorationImage>(
    //     find.byType(DecorationImage),
    //   ).image,
    //   isA<AssetImage>(),
    // );
  });
}
