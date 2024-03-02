import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfTitleWidget extends pw.StatelessWidget {
  final String text;
  final pw.Font font;
  PdfTitleWidget({
    required this.text,
    required this.font,
  });
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      alignment: pw.Alignment.centerLeft,
      margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
      child: pw.Text(
        // 'บริเวณ หลังส่วนบน',
        text,
        style: pw.TextStyle(fontSize: 16, font: font),
      ),
    );
  }
}
