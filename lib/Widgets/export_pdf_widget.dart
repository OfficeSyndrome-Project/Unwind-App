import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:typed_data';
import 'package:printing/printing.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';

import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';

Future<Uint8List> generateDocument(PdfPageFormat format) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  final font1 = await PdfGoogleFonts.sarabunRegular();
  final font2 = await PdfGoogleFonts.sarabunBold();
  final logo = await rootBundle.load('lib/assets/images/logo.png');
  final logoByte = await logo.buffer.asUint8List();
  final img = await rootBundle
      .load('lib/assets/images/workout/neck-shoulder/neckch01/TP-1.png');
  final imgByte = await img.buffer.asUint8List();

  final User storageUser = await ProfileService.getUser();
  final List<ScreeningPartOneModel> q1 =
      ScreeningPartOneModel.getScreeningPartOneModel();

  var titleWidget = pw.Container(
    alignment: pw.Alignment.centerLeft,
    margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
    child: pw.Text(
      'บริเวณ หลังส่วนบน',
      style: pw.TextStyle(fontSize: 16, font: font1),
    ),
  );

  var widgetQuestionWithImg = pw.Container(
      child: pw.Column(
    mainAxisAlignment: pw.MainAxisAlignment.start,
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        alignment: pw.Alignment.centerLeft,
        margin: pw.EdgeInsets.symmetric(vertical: 3.0 * PdfPageFormat.mm),
        height: 100,
        width: 100,
        child: pw.Image(pw.MemoryImage(imgByte)),
      ),
      pw.Container(
        alignment: pw.Alignment.centerLeft,
        margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
        child:
            pw.Text('question', style: pw.TextStyle(fontSize: 16, font: font1)),
      ),
      pw.Row(
        children: [
          pw.Text(
            'ตอบ',
            style: pw.TextStyle(
                font: font1,
                fontSize: 16,
                decoration: pw.TextDecoration.underline),
          ),
          pw.SizedBox(width: 8),
          pw.Text(
            'ไม่เคย',
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
          ),
        ],
      ),
    ],
  ));

  List<pw.Widget> resultWidget = [];

  for (var data in q1) {
    var widgetQuestion = pw.Container(
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
            '${data.question}',
            style: pw.TextStyle(fontSize: 16, font: font1),
          ),
        ),
        pw.Row(
          children: [
            pw.Flexible(
              flex: 1,
              child: pw.Text(
                'ตอบ',
                style: pw.TextStyle(
                    font: font1,
                    fontSize: 16,
                    decoration: pw.TextDecoration.underline),
              ),
            ),
            pw.SizedBox(width: 8),
            pw.Flexible(
              flex: 5,
              fit: pw.FlexFit.tight,
              child: pw.Text(
                'ไม่เคย',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            )
          ],
        ),
      ],
    ));

    resultWidget.add(widgetQuestion);
  }

  doc.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        pageFormat: format.copyWith(
          marginBottom: 0,
          marginLeft: 0,
          marginRight: 0,
          marginTop: 0,
        ),
        orientation: pw.PageOrientation.portrait,
        theme: pw.ThemeData.withFont(base: font1, bold: font2),
      ),
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(
            left: 60,
            right: 60,
            bottom: 30,
          ),
          child: pw.Column(
            children: [
              pw.Spacer(flex: 1),
              pw.Container(
                alignment: pw.Alignment.center,
                height: 180,
                child: pw.Image(pw.MemoryImage(logoByte)),
              ),
              pw.Spacer(flex: 1),
              pw.Text(
                'ผลประเมินแบบทดสอบ',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              pw.Text(
                'วันที่ 8 - 18 สิงหาคม 2566',
                style: pw.TextStyle(
                  fontSize: 30,
                ),
              ),
              pw.Spacer(flex: 4),
            ],
          ),
        );
      },
    ),
  );

  doc.addPage(
    pw.MultiPage(
      theme: pw.ThemeData.withFont(base: font1, bold: font2),
      pageFormat: format.copyWith(
          marginTop: 2.0 * PdfPageFormat.cm,
          marginRight: 1.5 * PdfPageFormat.cm,
          marginLeft: 1.5 * PdfPageFormat.cm,
          marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return pw.SizedBox();
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            child: pw.Text('UNWIND APPLICATION',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
        pw.Container(
          alignment: pw.Alignment.center,
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Text(
            'ผลการประเมินแบบทดสอบ',
            style: pw.TextStyle(fontSize: 20, font: font2),
          ),
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Text(
            'วันที่ 15 เดือน กุมภาพันธ์ พ.ศ. 2567',
            style: pw.TextStyle(
              fontSize: 18,
              font: font1,
            ),
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Row(
            children: [
              pw.Text(
                'ชื่อ',
                style: pw.TextStyle(font: font2, fontSize: 16),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.firstName} ${storageUser.lastName}',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Row(
            children: [
              pw.Text(
                'อายุ',
                style: pw.TextStyle(font: font2, fontSize: 16),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.age} ปี',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'เพศ',
                style: pw.TextStyle(font: font2, fontSize: 16),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.sex}',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Row(
            children: [
              pw.Text(
                'น้ำหนัก',
                style: pw.TextStyle(
                  font: font2,
                  fontSize: 16,
                ),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.weight} กก.',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'ส่วนสูง',
                style: pw.TextStyle(font: font2, fontSize: 16),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.height} ซม.',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Row(
            children: [
              pw.Text(
                'อาชีพ',
                style: pw.TextStyle(
                  font: font2,
                  fontSize: 16,
                ),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.career}',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Row(
            children: [
              pw.Text(
                'การประสบอุบัติเหตุ',
                style: pw.TextStyle(
                  font: font2,
                  fontSize: 16,
                ),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                '${storageUser.accident}',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 8.0 * PdfPageFormat.mm),
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(width: 1, color: PdfColors.black),
            ),
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Text(
            'ส่วนที่ 1 คัดกรองอาการ',
            style: pw.TextStyle(
              fontSize: 16,
              font: font2,
            ),
          ),
        ),
        ...resultWidget,
        pw.Container(
          margin: pw.EdgeInsets.only(
              top: 3.0 * PdfPageFormat.mm, bottom: 8.0 * PdfPageFormat.mm),
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(width: 1, color: PdfColors.black),
            ),
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Text(
            'ส่วนที่ 2 ประเมินความเจ็บปวดจากบริเวณที่เลือก',
            style: pw.TextStyle(
              fontSize: 16,
              font: font2,
            ),
          ),
        ),
        titleWidget,
        widgetQuestionWithImg,
        pw.Container(
          margin: pw.EdgeInsets.only(
              top: 3.0 * PdfPageFormat.mm, bottom: 8.0 * PdfPageFormat.mm),
          decoration: const pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(width: 1, color: PdfColors.black),
            ),
          ),
        ),
        pw.Container(
          margin: pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          child: pw.Text(
            'ส่วนที่ 3 ทดสอบจากท่าตรวจเบื้องต้น',
            style: pw.TextStyle(
              fontSize: 16,
              font: font2,
            ),
          ),
        ),
      ],
    ),
  );

  return await doc.save();
}
