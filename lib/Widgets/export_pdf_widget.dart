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
import 'package:unwind_app/Widgets/pdf-widget/pdf_question_answer_with_image_widget.dart';
import 'package:unwind_app/Widgets/pdf-widget/pdf_short_question_and_answer_widget.dart';
import 'package:unwind_app/Widgets/pdf-widget/pdf_title_widget.dart';
import 'package:unwind_app/Widgets/pdf-widget/pdf_topic_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/screening_test_answer_workout_list_service.dart';

import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/pages/history-feature/summary_page.dart';
import 'package:unwind_app/services/answer-service/answer_service.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

Future<Uint8List> generateDocument(
    PdfPageFormat format, WorkoutListData workoutListData) async {
  final document = pw.Document(pageMode: PdfPageMode.outlines);
  final font1 = await PdfGoogleFonts.sarabunRegular();
  final font2 = await PdfGoogleFonts.sarabunBold();
  final logo = await rootBundle.load('lib/assets/images/logo.png');
  final logoByte = await logo.buffer.asUint8List();
  final User storageUser = await ProfileService.getUser();
  final workouts = await serviceLocator<WorkoutListDB>()
      .getWorkoutListByTitle(workoutListData.titleCode);
  final answers = await serviceLocator<ScreeningTestAnswerWorkoutListService>()
      .getAllScreeningTestAnswerByWorkoutList(workouts.first);
  final firstDate = workouts.first.date;
  final lastDate = workouts.last.date;
  final answersInPartOne =
      answers.where((element) => element.questionPart == 1).toList();
  final answersInPartTwo =
      answers.where((element) => element.questionPart == 2).toList();
  final answersInPartThree = answers
      .where((answer) => answer.questionPart == 3 || answer.questionPart == 4)
      .toList();
  final resultsPartOne = answersInPartOne
      .expand((answer) => [
            PdfShortQuestionAndAnswerWidget(
              question: AnswerService.questionOf(answer).question,
              answer: AnswerService.interpret(answer).text,
              font: font1,
            ),
          ])
      .toList();
  final distinctAreas = answersInPartTwo.map((answer) => answer.area).toSet();
  final answersInPartTwoGroupByArea = distinctAreas
      .map((area) =>
          answersInPartTwo.where((answer) => answer.area == area).toList())
      .toList();

  final resultsPartTwo =
      await Future.wait(answersInPartTwoGroupByArea.expand((answers) {
    final areaThai = ScreeningDiagnoseService.toThai[ScreeningDiagnoseService
        .fromEngToScreeningTitle[AnswerService.questionOf(answers.first).area]];
    return [
      Future.value(PdfTitleWidget(
        text: 'บริเวณ${areaThai ?? ''}',
        font: font1,
      )),
      ...answers.expand(
        (answer) => [
          widgetQuestionWithImgFn(
            AnswerService.questionOf(answer).question,
            AnswerService.interpret(answer).text,
            AnswerService.questionOf(answer).questionSpecificAssetPath,
            font1,
          ),
        ],
      ),
    ];
  }).toList());

  final resultsPartThree = await Future.wait(answersInPartThree
      .expand((answer) => [
            widgetQuestionWithImgFn(
              AnswerService.questionOf(answer).question,
              AnswerService.interpret(answer).text,
              AnswerService.questionOf(answer).questionSpecificAssetPath,
              font1,
            ),
          ])
      .toList());

  Future<pw.MultiPage> pdfBody() async => pw.MultiPage(
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
              (firstDate == null || lastDate == null)
                  ? ''
                  : '${formatDateTimeRangeToThai(firstDate, lastDate)}',
              style: pw.TextStyle(
                fontSize: 18,
                font: font1,
              ),
            ),
          ),
          ...generateUserInformation(storageUser, font1),
          separatorLine(),
          PdfTopicWidget(text: 'ส่วนที่ 1 คัดกรองอาการ', font: font2),
          ...resultsPartOne,
          separatorLineWithTopMargin(),
          PdfTopicWidget(
              text: 'ส่วนที่ 2 ประเมินความเจ็บปวดจากบริเวณที่เลือก',
              font: font2),
          ...resultsPartTwo,
          separatorLineWithTopMargin(),
          PdfTopicWidget(
              text: 'ส่วนที่ 3 ทดสอบจากท่าตรวจเบื้องต้น', font: font2),
          ...resultsPartThree,
        ],
      );

  final pages = <pw.Page>[
    await pdfCover(format, font1, font2, logoByte, firstDate, lastDate),
    await pdfBody(),
  ];
  for (final page in pages) {
    document.addPage(page);
  }
  return await document.save();
}

Future<Uint8List> loadImageBytes(String path) async =>
    await rootBundle.load(path).then((value) => value.buffer.asUint8List());

Future<PdfQuestionAnswerWithImageWidget> widgetQuestionWithImgFn(
        String question,
        String answer,
        String? imagePath,
        pw.Font font) async =>
    (imagePath == null)
        ? PdfQuestionAnswerWithImageWidget(
            question: question,
            answer: answer,
            font: font,
          )
        : PdfQuestionAnswerWithImageWidget(
            question: question,
            answer: answer,
            font: font,
            image: pw.MemoryImage(await loadImageBytes(imagePath)),
          );

pw.Page pdfCover(
  PdfPageFormat format,
  pw.Font font1,
  pw.Font font2,
  Uint8List logoImageBytes,
  DateTime? firstDate,
  DateTime? lastDate,
) =>
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
                child: pw.Image(pw.MemoryImage(logoImageBytes)),
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
                // 'วันที่ 8 - 18 สิงหาคม 2566',
                (firstDate == null || lastDate == null)
                    ? ''
                    : '${formatDateTimeRangeToThai(firstDate, lastDate)}',
                style: pw.TextStyle(
                  fontSize: 30,
                ),
              ),
              pw.Spacer(flex: 4),
            ],
          ),
        );
      },
    );

pw.Container separatorLine() => pw.Container(
      margin: pw.EdgeInsets.only(bottom: 8.0 * PdfPageFormat.mm),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 1, color: PdfColors.black),
        ),
      ),
    );

pw.Container separatorLineWithTopMargin() => pw.Container(
      margin: pw.EdgeInsets.only(
          top: 3.0 * PdfPageFormat.mm, bottom: 8.0 * PdfPageFormat.mm),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 1, color: PdfColors.black),
        ),
      ),
    );

List<pw.Container> generateUserInformation(User storageUser, pw.Font font2) {
  return [
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
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
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
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
          ),
          pw.SizedBox(width: 8),
          pw.Text(
            'เพศ',
            style: pw.TextStyle(font: font2, fontSize: 16),
          ),
          pw.SizedBox(width: 8),
          pw.Text(
            '${storageUser.sex}',
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
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
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
          ),
          pw.SizedBox(width: 8),
          pw.Text(
            'ส่วนสูง',
            style: pw.TextStyle(font: font2, fontSize: 16),
          ),
          pw.SizedBox(width: 8),
          pw.Text(
            '${storageUser.height} ซม.',
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
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
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
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
            style: pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 16),
          ),
        ],
      ),
    ),
  ];
}
