import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/history-widget/box_have_img.dart';
import 'package:unwind_app/Widgets/history-widget/box_only_q.dart';
import 'package:unwind_app/Widgets/history-widget/box_title_part_select.dart';

import 'package:unwind_app/Widgets/history-widget/header_box.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

import 'package:unwind_app/data/history-data/keep_score_and_date_model.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class ResultScreeningPage extends StatelessWidget {
  final List<KeepScoreAndDateModel> dateMockup;
  ResultScreeningPage({super.key, required this.dateMockup});

  final List<ScreeningPartOneModel> q1 =
      ScreeningPartOneModel.getScreeningPartOneModel();

  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    List<Widget> _partWidget = [];
    List<Widget> resultWidget = [];

    for (var data in q1) {
      var answerS1Widget = BoxOnlyQ(
        question: data.question,
        answer: 'ใช่',
      );
      resultWidget.add(answerS1Widget);
    }

    for (var i = 0; i < 3; i++) {
      var partWidget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBox(screeningPart: i + 1),
          ...resultWidget,
          BoxTitlePartSelect(partSelect: 'partSelect'),
          BoxHaveImg(
            question: 'question',
            answer: 'answer',
            name: 'name',
            assetPath:
                'lib/assets/images/workout/shoulder/shoulderch02/tp-left/TP-1.png',
          )
        ],
      );
      _partWidget.add(partWidget);
    }

    return AppscreenTheme(
        iconButtonStart: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
        textBar: 'ประวัติ',
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(3),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            'ผลการประเมินแบบทดสอบ',
                            style: ResponsiveCheckWidget.isSmallMobile(context)
                                ? TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF484D56),
                                  )
                                : Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Center(
                          child: Text(
                            '${dateMockup.first.dateTime.day} - ${dateMockup.last.dateTime.day} ' +
                                DateFormat('MMMM', 'th')
                                    .format(dateMockup[0].dateTime) +
                                ' ' +
                                DateFormat('yyyy').format(DateTime(
                                    dateMockup[0].dateTime.year + 543)),
                            style: ResponsiveCheckWidget.isSmallMobile(context)
                                ? TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF484D56),
                                  )
                                : Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        ..._partWidget
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            pageRoutes.previewPdf
                                .pdfpreviewpage()
                                .route(context));
                      },
                      child: Icon(
                        Icons.ios_share_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
