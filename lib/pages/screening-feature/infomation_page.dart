import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';

import 'package:unwind_app/Widgets/workoutlist-widget/box_infomation_widget.dart';
import 'package:unwind_app/data/screening-data/infomation_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class InformationPage extends StatelessWidget {
  InformationPage({Key? key}) : super(key: key);

  final List<InformationData> infoData = InformationData.getData();
  final PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Theme.of(context).colorScheme.primary),
        colorBar: Colors.transparent,
        textBar: pageRoutes.screening.infomationpage().title,
        textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return BoxInfomationWidget(
                    title: infoData[index].titleLabel,
                    assetName: infoData[index].assetPath,
                    infomation: infoData[index].descriptionLabel);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount: infoData.length,
            ),
          )
        ]);
  }
}
