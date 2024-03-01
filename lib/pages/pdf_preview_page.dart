import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:unwind_app/Widgets/export_pdf_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({
    Key? key,
    required this.workoutListData,
  }) : super(key: key);
  final WorkoutListData workoutListData;

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => generateDocument(
        format,
        workoutListData,
      ),
    );
  }
}
