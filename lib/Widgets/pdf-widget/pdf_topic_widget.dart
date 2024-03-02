import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfTopicWidget extends pw.StatelessWidget {
  final String text;
  final pw.Font font;

  PdfTopicWidget({
    required this.text,
    required this.font,
  });

  pw.Widget build(context) {
    return pw.Container(
      margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 16,
          font: font,
        ),
      ),
    );
  }
}
