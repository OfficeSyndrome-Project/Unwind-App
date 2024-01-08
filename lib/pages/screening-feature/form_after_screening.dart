import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_dropdown.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class FormAfterScreening extends StatefulWidget {
  const FormAfterScreening({Key? key}) : super(key: key);

  @override
  State<FormAfterScreening> createState() => _FormAfterScreeningState();
}

class _FormAfterScreeningState extends State<FormAfterScreening> {
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded,
              color: Theme.of(context).colorScheme.primary),
        ),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: RatioImageoneToOne(
                      assetName: 'lib/assets/images/blank_profile.png',
                      smallWidth: 88,
                      largeWidth: 100,
                      smallHeight: 88,
                      largeHeight: 100),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 24),
                  child: Text(
                    'unwind',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 18
                          : 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3b67cd),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ProfileTextForm(
                  formName: 'ชื่อ',
                ),
                const SizedBox(height: 16),
                ProfileTextForm(
                  formName: 'นามสกุล',
                ),
                const SizedBox(height: 16),
                const ProfileTextForm(
                  formName: 'อายุ',
                  inputType: TextInputType.number,
                  formUnit: 'ปี',
                ),
                const SizedBox(height: 16),
                ProfileDropdown(
                  dropdownName: 'เพศ',
                  listSelection: ['ชาย', 'หญิง'],
                ),
                const SizedBox(height: 16),
                const ProfileTextForm(
                  formName: 'ส่วนสูง',
                  inputType: TextInputType.number,
                  formUnit: 'ซม.',
                ),
                const SizedBox(height: 16),
                const ProfileTextForm(
                  formName: 'น้ำหนัก',
                  inputType: TextInputType.number,
                  formUnit: 'กก.',
                ),
                const SizedBox(height: 16),
                ProfileDropdown(
                  dropdownName: 'อาชีพ',
                  listSelection: [
                    "นักเรียน/นักศึกษา",
                    "ครู/อาจารย์",
                    "พนักงานออฟฟิศ",
                    "พนักงานขาย",
                    "สถาปนิก/วิศวกร",
                    "พนักงานโรงงาน/ผู้ใช้แรงงาน",
                    "นักกีฬา",
                    "อื่น ๆ"
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32, bottom: 8),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: '*',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFC9635F),
                  )),
              TextSpan(
                  text:
                      'นโยบายการเก็บข้อมูลส่วนตัวนี้เป็นไปเพื่อการวิเคราะห์ข้อมูลทางเราขอให้ความมั่นใจในการคุ้มครองข้อมูลและไม่มีการนำไปเผยแพร่แต่อย่างใด',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  ))
            ])),
          ),
          ButtonWithoutIconWidget(
              onTap: () {},
              text: "สมัครสมาชิก",
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
        ]);
  }
}
