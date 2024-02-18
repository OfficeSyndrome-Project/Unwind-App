import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_button.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_dropdown.dart';
import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';

import '../../Routes/routes_config.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);
  // PageRoutes pageRoutes = PageRoutes();

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  PageRoutes pageRoutes = PageRoutes();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  User _user = User();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    // initName();
    initUser();
  }

  void initUser() async {
    final User storageUser = await ProfileService.getUser();
    setState(() {
      _user = storageUser;
      loading = false;
    });
    firstnameController.text = _user.firstName;
    lastnameController.text = _user.lastName;
    ageController.text = _user.age.toString();
    heightController.text = _user.height.toString();
    weightController.text = _user.weight.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return LoadingPage(
        isShowNavbar: false,
      );
    return AppscreenTheme(
        textBar: pageRoutes.profile.editpage().title,
        textStyle: const TextStyle(
          fontFamily: "Noto Sans Thai",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3B67CD),
        ),
        colorBar: Colors.transparent,
        iconButtonStart: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Theme.of(context).colorScheme.primary,
            )),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: ListView(
                children: <Widget>[
                  ProfileTextForm(
                    onChange: (value) {
                      setState(() {
                        _user.firstName = value;
                      });
                    },
                    controller: firstnameController,
                    formName: 'ชื่อ',
                  ),
                  const SizedBox(height: 16),
                  ProfileTextForm(
                    onChange: (value) {
                      setState(() {
                        _user.lastName = value;
                      });
                    },
                    formName: 'นามสกุล',
                    controller: lastnameController,
                  ),
                  const SizedBox(height: 16),
                  ProfileTextForm(
                    onChange: (value) {
                      setState(() {
                        _user.age = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: ageController,
                    formName: 'อายุ',
                    inputType: TextInputType.number,
                    formUnit: 'ปี',
                  ),
                  const SizedBox(height: 16),
                  ProfileDropdown(
                    dropdownName: 'เพศ',
                    listSelection: ['ชาย', 'หญิง'],
                    defaultValue: _user.sex,
                    onSelect: (value) {
                      setState(() {
                        _user.sex = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileTextForm(
                    onChange: (value) {
                      setState(() {
                        _user.height = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: heightController,
                    formName: 'ส่วนสูง',
                    inputType: TextInputType.number,
                    formUnit: 'ซม.',
                  ),
                  const SizedBox(height: 16),
                  ProfileTextForm(
                    onChange: (value) {
                      setState(() {
                        _user.weight = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: weightController,
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
                    defaultValue: _user.career,
                    onSelect: (value) {
                      setState(() {
                        _user.career = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileDropdown(
                    dropdownName: 'การประสบอุบัติเหตุ',
                    listSelection: ['เคย', 'ไม่เคย'],
                    defaultValue: _user.accident,
                    onSelect: (value) {
                      setState(() {
                        _user.accident = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  ProfileButton(
                    onPressed: () {
                      setState(() {
                        ProfileService.writeUser(_user);
                        // print("USER:" + _user.age.toString());
                        Navigator.pop(context, _user);
                        // Navigator.push(
                        //   context,
                        //   pageRoutes.profile.profilepage().route(context),
                        // );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
