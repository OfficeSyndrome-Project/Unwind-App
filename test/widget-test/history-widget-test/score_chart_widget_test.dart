import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unwind_app/Widgets/history-widget/score_chart_widget.dart';

void main() {
  testWidgets('Test ScoreChartWidget', (WidgetTester tester) async {
    final List<CartesianSeries<dynamic, dynamic>> series = [
      LineSeries<TestData, double>(
        dataSource: <TestData>[
          TestData(1, 30),
          TestData(2, 20),
          TestData(3, 25),
        ],
        xValueMapper: (TestData datamock, _) => datamock.days,
        yValueMapper: (TestData datamock, _) => datamock.nrs,
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScoreChartWidget(height: 200, series: series),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SfCartesianChart), findsOneWidget);
  });
}

class TestData {
  final double days;
  final double nrs;

  TestData(this.days, this.nrs);
}
