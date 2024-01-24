import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/typepain_container.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_two_model.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';
import 'package:unwind_app/services/screening-service/screening_service.dart';

//select point to check

class ScreeningPartTwoQuestion extends StatefulWidget {
  final List<Answer>? answers;
  ScreeningPartTwoQuestion({super.key, this.answers});

  @override
  State<ScreeningPartTwoQuestion> createState() =>
      _ScreeningPartTwoQuestionState();
}

class _ScreeningPartTwoQuestionState extends State<ScreeningPartTwoQuestion> {
  List<ScreeningPartTwoSelectPart> typelist =
      ScreeningPartTwoSelectPart.getTitleQPage();

  PageRoutes pageRoutes = PageRoutes();
  final Map<String, bool> onSelectPart = {};
  ScreeningQuestionPartTwoService serviceModel =
      ScreeningQuestionPartTwoService();

  bool disable = true;

  List<Answer> get answers => widget.answers ?? [];

  String notSureKey = "ไม่แน่ใจ/ไม่อยู่ในตัวเลือก"; // Please set this string corresponding to the ScreeningPartTwoSelectPart.title

  void selectContainer(int index) {
    String titleType = typelist[index].title;
    // int partOrd = typelist[index].partOrder;

    setState(() {
      if (index == 5 && onSelectPart.containsKey(notSureKey)) {
        onSelectPart.clear();
        setDisable(false);
        return;
      }
      if (onSelectPart[notSureKey] ?? false) {
        onSelectPart.clear();
      }
      if (onSelectPart.containsKey(titleType)) {
        onSelectPart[titleType] = !onSelectPart[titleType]!;
      } else {
        onSelectPart[titleType] = true;
      }
      if (onSelectPart[notSureKey] ?? false) {
        onSelectPart.clear();
        onSelectPart[notSureKey] = true;
      }
      setDisable(false);
    });
  }

  void setDisable(bool value) {
    setState(() {
      if (onSelectPart.isEmpty) {
        disable = true;
        return;
      }
      if (onSelectPart.values.every((element) => !element)) {
        disable = !value;
      } else {
        disable = value;
      }
    });
  }

  @override
  void dispose() {
    onSelectPart.clear();
    super.dispose();
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
            'กรุณาเลือกส่วนที่ปวดมากที่สุด\n(สามารถเลือกได้มากกว่า 1 จุด)',
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
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 4),
              physics: ResponsiveCheckWidget.isSmallMobile(context)
                  ? ClampingScrollPhysics()
                  : ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return TypepainContainer(
                  onTap: () {
                    selectContainer(index);
                  },
                  isSelect: onSelectPart.containsKey(typelist[index].title)
                      ? onSelectPart[typelist[index].title]!
                      : false,
                  assetName: typelist[index].assetPath ?? "",
                  typePain: typelist[index].title,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: typelist.length),
        ),
        SizedBox(
          height: ResponsiveCheckWidget.isSmallMobile(context) ? 16 : 0,
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              if (!disable) {
                if (onSelectPart[notSureKey] ?? false) {
                  print('not sure');
                  onSelectPart.clear();
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .introscreeningpage(2,[], [], {})
                          .route(context));
                          return;
                }
                onSelectPart.remove(notSureKey);
                Navigator.push(
                    context,
                    pageRoutes.screening
                        .questionafterscreeningparttwo(onSelectPart, answers)
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
