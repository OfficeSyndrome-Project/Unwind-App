import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unwind_app/Widgets/history-widget/score_chart_widget.dart';

void main() {
  testWidgets('test ScoreChartWidget widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScoreChartWidget(
          height: 300.0,
          series: <CartesianSeries>[],
        ),
      ),
    );

    expect(find.byType(SfCartesianChart), findsOneWidget);
    // expect(find.byType(Container), findsOneWidget);
    // // final Container containerWidget = tester.widget(find.byType(Container));
    // // expect(containerWidget.height, 300.0);
    // expect(find.byType(TooltipBehavior), findsOneWidget);
    // expect(find.byType(Legend), findsOneWidget);
    // expect(find.byType(NumericAxis), findsOneWidget);
    // expect(find.byType(DateTimeAxis), findsOneWidget);
  });
}
