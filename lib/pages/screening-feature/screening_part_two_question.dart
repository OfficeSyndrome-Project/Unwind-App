import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/typepain_container.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

//select point to check

class ScreeningPartTwoQuestion extends StatefulWidget {
  const ScreeningPartTwoQuestion({super.key});

  @override
  State<ScreeningPartTwoQuestion> createState() =>
      _ScreeningPartTwoQuestionState();
}

class _ScreeningPartTwoQuestionState extends State<ScreeningPartTwoQuestion> {
  List<ScreeningPartTwoSelectPart> typelist =
      ScreeningPartTwoSelectPart.getTitleQPage();

  PageRoutes pageRoutes = PageRoutes();
  late Map<String, bool> onSelectPart = {};
  ScreeningQuestionPartTwoService serviceModel =
      ScreeningQuestionPartTwoService();

  bool disable = true;

  void selectContainer(int index) {
    String titleType = typelist[index].title;
    setState(() {
      if (onSelectPart.containsKey(titleType)) {
        onSelectPart[titleType] = !onSelectPart[titleType]!;
      } else {
        onSelectPart[titleType] = true;
      }
      setDisable(false);
    });
  }

  void setDisable(bool value) {
    setState(() {
      if (onSelectPart.values.every((element) => !element)) {
        disable = !value;
      } else {
        disable = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      iconButtonStart: IconButton(
        highlightColor: Colors.transparent,
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Theme.of(context).colorScheme.primary,
      ),
      colorBar: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            'กรุณาเลือกส่วนที่ท่านต้องการประเมิน\n(สามารถเลือกได้มากกว่า 1 จุด)',
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56))
                : Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.separated(
              physics: ResponsiveCheckWidget.isSmallMobile(context)
                  ? ClampingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TypepainContainer(
                  onTap: () {
                    selectContainer(index);
                  },
                  isSelect: onSelectPart.containsKey(typelist[index].title)
                      ? onSelectPart[typelist[index].title]!
                      : false,
                  assetName: typelist[index].assetPath,
                  typePain: typelist[index].title,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: typelist.length),
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              if (!disable) {
                Navigator.push(
                    context,
                    pageRoutes.screening
                        .questionafterscreeningparttwo(onSelectPart)
                        .route(context));
              }
            },
            text: 'ถัดไป',
            radius: 32,
            width: double.infinity,
            height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
            color: !disable
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFF9BA4B5),
            borderSide: BorderSide.none,
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFFFFF),
                  )
                : Theme.of(context).textTheme.headlineSmall)
      ],
    );
  }
}
