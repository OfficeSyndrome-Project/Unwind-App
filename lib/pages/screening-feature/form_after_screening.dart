import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_dropdown.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class FormAfterScreening extends StatefulWidget {
  final AnswerContext? answerContext;
  const FormAfterScreening({
    Key? key,
    this.answerContext,
  }) : super(key: key);

  @override
  State<FormAfterScreening> createState() => _FormAfterScreeningState();
}

class _FormAfterScreeningState extends State<FormAfterScreening> {
  final controllerFirstname = TextEditingController();
  final controllerLastname = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerHeight = TextEditingController();
  final controllerWeight = TextEditingController();
  User createUser = User();
  List<Answer> get answers => widget.answerContext?.answers ?? [];
  Map<ScreeningTitle, int> get nrs => widget.answerContext?.nrs ?? {};
  @override
  void initState() {
    super.initState();
    initCreateUser();
  }

  void initCreateUser() async {
    controllerFirstname.text = createUser.firstName;
    controllerLastname.text = createUser.lastName;
    controllerAge.text = createUser.age.toString();
    controllerHeight.text = createUser.height.toString();
    controllerWeight.text = createUser.weight.toString();
  }

  PageRoutes pageRoutes = PageRoutes();

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
                      assetName: 'lib/assets/images/logo.png',
                      smallWidth: 88,
                      largeWidth: 100,
                      smallHeight: 88,
                      largeHeight: 100),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8, bottom: 24),
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
                  controller: controllerFirstname,
                  onChange: (value) {
                    setState(() {
                      createUser.firstName = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ProfileTextForm(
                  formName: 'นามสกุล',
                  controller: controllerLastname,
                  onChange: (value) {
                    setState(() {
                      createUser.lastName = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ProfileTextForm(
                  formName: 'อายุ',
                  inputType: TextInputType.number,
                  formUnit: 'ปี',
                  controller: controllerAge,
                  onChange: (value) {
                    setState(() {
                      createUser.age = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ProfileDropdown(
                  dropdownName: 'เพศ',
                  listSelection: ['ชาย', 'หญิง'],
                  defaultValue: 'ชาย',
                  onSelect: (value) {
                    setState(() {
                      createUser.sex = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ProfileTextForm(
                  formName: 'ส่วนสูง',
                  inputType: TextInputType.number,
                  formUnit: 'ซม.',
                  controller: controllerHeight,
                  onChange: (value) {
                    setState(() {
                      createUser.height = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ProfileTextForm(
                  formName: 'น้ำหนัก',
                  inputType: TextInputType.number,
                  formUnit: 'กก.',
                  controller: controllerWeight,
                  onChange: (value) {
                    setState(() {
                      createUser.weight = int.tryParse(value) ?? 0;
                    });
                  },
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
                  defaultValue: 'นักเรียน/นักศึกษา',
                  onSelect: (value) {
                    setState(() {
                      createUser.career = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ProfileDropdown(
                  dropdownName: 'การประสบอุบัติเหตุ',
                  listSelection: ['เคย', 'ไม่เคย'],
                  defaultValue: 'ไม่เคย',
                  onSelect: (value) {
                    setState(() {
                      createUser.accident = value;
                    });
                  },
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
              onTap: () async {
                setState(() {
                  if (createUser.sex == "") {
                    createUser.sex =
                        'ชาย'; // หรือให้ค่าเป็น defaultValue ที่ต้องการ
                  }
                  if (createUser.career == "") {
                    createUser.career =
                        'นักเรียน/นักศึกษา'; // หรือให้ค่าเป็น defaultValue ที่ต้องการ
                  }
                  if (createUser.accident == "") {
                    createUser.accident =
                        'ไม่เคย'; // หรือให้ค่าเป็น defaultValue ที่ต้องการ
                  }

                  ProfileService.writeUser(createUser);
                });

                // call diagnose service here
                final List<WorkoutList> workoutList =
                    await ScreeningDiagnoseService.diagnose(answers, nrs);

                final resultText = 'คุณมีอาการออฟฟิศซินโดรม';
                print(
                    "workoutList: ${workoutList.map((e) => e.workoutData.map((e) => e.name))}");
                Navigator.push(
                    context,
                    pageRoutes.screening
                        .resultsworkout(workoutList, resultText)
                        .route(context));
              },
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
