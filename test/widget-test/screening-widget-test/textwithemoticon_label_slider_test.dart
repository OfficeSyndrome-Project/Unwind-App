import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/textwithemoticon_label_slider.dart';
import 'package:unwind_app/data/screening-data/nrs_score_label.dart';

void main() {
  testWidgets('test TextWithEmoticonLabel widget', (WidgetTester tester) async {
    // late BuildContext testContext;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            // testContext = context;
            return TextWithEmoticonLabel(context);
          }),
        ),
      ),
    );

    expect(find.byType(Row), findsOneWidget);
    List<NrsScoreLabel> scoreLabels = NrsScoreLabel.getScore();
    for (var i = 0; i < scoreLabels.length; i++) {
      expect(
          find.byWidgetPredicate((widget) =>
              widget is Column &&
              widget.children.isNotEmpty &&
              widget.children[1] is Text &&
              (widget.children[1] as Text).data == scoreLabels[i].label),
          findsOneWidget);
    }
  });
}
