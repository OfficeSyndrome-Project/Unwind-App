import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/Widgets/export_pdf_widget.dart' as pdfGenerator;

void main() {
  testWidgets('test export report pdf', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return ElevatedButton(
          onPressed: () async {
            final pdfBytes = await pdfGenerator.generateDocument(
              PdfPageFormat.a4,
              WorkoutListData(
                  title: "คอ-บ่า",
                  titleTH: "ชุดท่าบริหารคอเพิ่มความยืดหยุ่น",
                  workoutType: "stretch",
                  titlePath:
                      "lib/assets/images/screeningPart/select_pain_1.png",
                  titleCode: "neckbaa_ch",
                  workoutData: WorkoutData.getWorkoutData()
                      .where((element) =>
                          element.title == "คอ-บ่า" &&
                          element.workoutType == "stretch")
                      .toList(),
                  totalTime: "4 นาที 10 วินาที"),
            );

            expect(pdfBytes.isNotEmpty, true);
          },
          child: Text('Generate PDF'),
        );
      }),
    ));

    await tester.tap(find.text('Generate PDF'));
    await tester.pumpAndSettle();
  });
}
