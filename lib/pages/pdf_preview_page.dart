import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:unwind_app/Widgets/export_pdf_widget.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => generateDocument(format),
    );
  }
}
