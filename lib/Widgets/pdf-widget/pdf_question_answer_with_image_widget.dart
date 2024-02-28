import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfQuestionAnswerWithImageWidget extends pw.StatelessWidget {
  final String question;
  final String answer;
  final pw.Font font;
  final pw.MemoryImage? image;
  PdfQuestionAnswerWithImageWidget({
    required this.question,
    required this.answer,
    required this.font,
    this.image,
  });
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child: pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        if (image != null)
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            margin: pw.EdgeInsets.symmetric(vertical: 3.0 * PdfPageFormat.mm),
            height: 100,
            width: 100,
            child: pw.Image(image!),
          ),
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child:
              pw.Text(question, style: pw.TextStyle(fontSize: 16, font: font)),
        ),
        pw.Row(
          children: [
            pw.Text(
              'ตอบ',
              style: pw.TextStyle(
                  font: font,
                  fontSize: 16,
                  decoration: pw.TextDecoration.underline),
            ),
            pw.SizedBox(width: 8),
            pw.Text(
              answer,
              style:
                  pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
            ),
          ],
        ),
      ],
    ));
  }
}
