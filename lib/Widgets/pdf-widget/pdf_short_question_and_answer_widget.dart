import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfShortQuestionAndAnswerWidget extends pw.StatelessWidget {
  final String question;
  final String answer;
  final pw.Font font;
  PdfShortQuestionAndAnswerWidget({
    required this.question,
    required this.answer,
    required this.font,
  });
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          margin: pw.EdgeInsets.only(
              top: 3.0 * PdfPageFormat.mm, bottom: 3.0 * PdfPageFormat.mm),
          // padding: pw.EdgeInsets.only(right: 3.0),
          child: pw.Text(
            '${question}',
            style: pw.TextStyle(fontSize: 16, font: font),
          ),
        ),
        pw.Row(
          children: [
            pw.Flexible(
              flex: 1,
              child: pw.Text(
                'ตอบ',
                style: pw.TextStyle(
                    font: font,
                    fontSize: 16,
                    decoration: pw.TextDecoration.underline),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Flexible(
              flex: 5,
              fit: pw.FlexFit.tight,
              child: pw.Text(
                answer,
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
