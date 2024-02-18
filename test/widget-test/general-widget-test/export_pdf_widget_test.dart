import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unwind_app/Widgets/export_pdf_widget.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';

void main() {
  testWidgets('test export report pdf', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              onPressed: () async {
                final Uint8List pdf = await generateDocument(PdfPageFormat.a4);
                expect(pdf, isNotNull);
              },
              child: Text('Generate PDF'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Generate PDF'));
    await tester.pumpAndSettle();
  });
}
