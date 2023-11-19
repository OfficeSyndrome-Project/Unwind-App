// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes-config.dart';
import 'package:unwind_app/Widgets/resultErg-box-widget.dart';
import 'package:unwind_app/globals/theme/appscreen-theme.dart';
import 'package:unwind_app/globals/theme/buttomtap-theme.dart';
import 'package:unwind_app/services/storedOptions-service.dart';

// ignore: must_be_immutable
class ResultErgonomicPage extends StatelessWidget {
  ResultErgonomicPage({Key? key}) : super(key: key);

  PageRoutes pageRoutes = PageRoutes();
  int index = 0;

  void handleResult() {
    var storedOptions = StoredOptionsService.readCurrntOptions(index);
    print('result : $storedOptions');
  }

  @override
  Widget build(BuildContext context) {
    handleResult();
    return AppscreenTheme(
        textBar: pageRoutes.menu.resultergonomic().title,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.receipt,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "ผลลัพธ์",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // ListView.separated(
          //   separatorBuilder: (context, index) => const SizedBox(height: 16,),
          //   itemCount: StoredOptionsService.readCurrntOptions(index)
          //   itemBuilder: (context, index) {
          //   },
          // )

          const ResultErgBoxWidget(
              idCategory: 1,
              type: 'type',
              question: 'question',
              solution: 'solution',
              prevent: 'prevent'),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: ButtomTapTheme(
                "กลับเมนู",
                32,
                double.infinity,
                52,
                Theme.of(context).colorScheme.primary,
                BorderSide.none,
                Theme.of(context).textTheme.headlineSmall),
          )
        ]);
  }
}
