import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';

import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/typepain_container.dart';
import 'package:unwind_app/data/screening-data/typepain_screening.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

//select point to check
class ScreeningPartTwoQuestion extends StatefulWidget {
  const ScreeningPartTwoQuestion({super.key});

  @override
  State<ScreeningPartTwoQuestion> createState() =>
      _ScreeningPartTwoQuestionState();
}

class _ScreeningPartTwoQuestionState extends State<ScreeningPartTwoQuestion> {
  List<TypePainScreening> typelist = TypePainScreening.getData();
  PageRoutes pageRoutes = PageRoutes();
  // late List<bool> onCurrentSelect =
  //     List.generate(typelist.length, (index) => false);
  late Map<int, bool> onSelectMap = {};

  void selectContainer(int index) {
    setState(() {
      int typeID = typelist[index].idType;
      if (onSelectMap.containsKey(typeID)) {
        onSelectMap[typeID] = !onSelectMap[typeID]!;
      } else {
        onSelectMap[typeID] = true;
      }

      // onCurrentSelect[index] = !onCurrentSelect[index];
      print(onSelectMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      iconButtonStart: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(0),
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
                  isSelect: onSelectMap.containsKey(typelist[index].idType)
                      ? onSelectMap[typelist[index].idType]!
                      : false,
                  assetName: typelist[index].assetPath,
                  typePain: typelist[index].type,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: typelist.length),
        ),
        ButtonWithoutIconWidget(
            onTap: () {
              Navigator.push(
                  context,
                  pageRoutes.screening
                      .questionafterscreeningparttwo(onSelectMap)
                      .route(context));
            },
            text: 'ถัดไป',
            radius: 32,
            width: double.infinity,
            height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
            color: Theme.of(context).colorScheme.primary,
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
