import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:unwind_app/Widgets/history-widget/history_boxworkoutlist_widget.dart';
import 'package:unwind_app/data/history-data/keep_score_and_date_model.dart';

void main() {
  List<KeepScoreAndDateModel> keepscores = KeepScoreAndDateModel.getData();

  testWidgets('test HistoryWorkoutlist widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HistoryWorkoutlistWidget(),
        ),
      ),
    );

    expect(find.text(keepscores.map((data) => data.name).first.toString()),
        findsOneWidget);
    expect(
      find.text(
        "วันที่ ${DateFormat("dd/MM/yy").format(keepscores.map((data) => data.dateTime).first)} ถึง ${DateFormat("dd/MM/yy").format(keepscores.map((data) => data.dateTime).last)}",
      ),
      findsOneWidget,
    );
    expect(find.byType(CircularPercentIndicator), findsOneWidget);
  });
}
