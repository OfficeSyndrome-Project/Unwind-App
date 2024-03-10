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
  final String? resultText;
  const FormAfterScreening({
    Key? key,
    this.answerContext,
    this.resultText,
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
  List<PostureAnswer> get postureAnswers =>
      widget.answerContext?.postureAnswers ?? [];
  User _user = User();

  bool? isChecked = false;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    initCreateUser();
    // initUser();
  }

  void initCreateUser() async {
    controllerFirstname.text = createUser.firstName;
    controllerLastname.text = createUser.lastName;
    controllerAge.text = createUser.age.toString();
    controllerHeight.text = createUser.height.toString();
    controllerWeight.text = createUser.weight.toString();
  }

  void initUser() async {
    final User storageUser = await ProfileService.getUser();
    setState(() {
      _user = storageUser;
    });
    controllerFirstname.text = _user.firstName;
    controllerLastname.text = _user.lastName;
    controllerAge.text = _user.age.toString();
    controllerHeight.text = _user.height.toString();
    controllerWeight.text = _user.weight.toString();
  }

  PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
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
                    'UNWIND',
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
                      if (value.isNotEmpty) {
                        createUser.firstName = value;
                      }
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, pageRoutes.screening.policypage().route(context));
            },
            child: Container(
              margin: EdgeInsets.only(top: 32, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      splashRadius: 0,
                      activeColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'ฉัน',
                          style: TextStyle(
                            color: Color(0xFF636A75),
                          ),
                        ),
                        TextSpan(
                          text: 'ยอมรับข้อกำหนดและเงื่อนไข',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Theme.of(context).colorScheme.primary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonWithoutIconWidget(
              onTap: () async {
                setState(() {
                  if (controllerFirstname.text.isEmpty) {
                    return;
                  }

                  createUser.firstName = controllerFirstname.text;
                  createUser.lastName = controllerLastname.text;
                  createUser.age = int.tryParse(controllerAge.text) ?? 0;
                  createUser.height = int.tryParse(controllerHeight.text) ?? 0;
                  createUser.weight = int.tryParse(controllerWeight.text) ?? 0;

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

                final diagnoseResult = await ScreeningDiagnoseService.diagnose(
                    answers, nrs, postureAnswers);
                // call diagnose service here
                final List<WorkoutListData> workoutList =
                    diagnoseResult.workoutList;

                final toDoctor = ScreeningDiagnoseService.isNeckSetToDoctor(
                        answers, nrs) ||
                    ScreeningDiagnoseService.isBackSetToDoctor(answers, nrs);

                String resultText = 'คุณมีอาการออฟฟิศซินโดรม';
                if (workoutList.isEmpty) {
                  resultText = (toDoctor)
                      ? 'คุณมีอาการที่ไม่ใช่ออฟฟิศซินโดรม ควรพบแพทย์เพื่อได้รับการรักษาที่ถูกต้อง'
                      : 'ยินดีด้วย! คุณไม่มีอาการ\nออฟฟิศซินโดรม';
                }

                // Widget.resulText is from ExceptionPage
                if (widget.resultText != null) {
                  resultText = widget.resultText!;
                }

                if (isChecked == true) {
                  Navigator.push(
                      context,
                      pageRoutes.screening
                          .resultsworkout(workoutList, resultText)
                          .route(context));
                }
              },
              text: "ดำเนินการต่อ",
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: isChecked == true
                  ? Theme.of(context).colorScheme.primary
                  : Color(0xFF9BA4B5),
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
