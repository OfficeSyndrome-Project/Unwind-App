import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_button.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_dropdown.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';

import '../../Routes/routes_config.dart';

class EditProfile extends StatefulWidget {
  final String? name;
  final String? lastname;
  const EditProfile({Key? key, this.name, this.lastname}) : super(key: key);
  // PageRoutes pageRoutes = PageRoutes();

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  PageRoutes pageRoutes = PageRoutes();
  final _editcontroller = TextEditingController();
  final _lastnameController = TextEditingController();
  String name = "";
  String lastname = "";

  @override
  void initState() {
    super.initState();
    initName();
  }

  void initName() async {
    final String storageName = await ProfileService.getName();
    final String storageLastname = await ProfileService.getLastname();
    setState(() {
      name = storageName;
      lastname = storageLastname;
      _editcontroller.text = name;
      _lastnameController.text = lastname;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ProfileTextForm(
                    controller: _editcontroller,
                    formName: 'ชื่อ',
                  ),
                  const SizedBox(height: 16),
                  ProfileTextForm(
                    formName: 'นามสกุล',
                    controller: _lastnameController,
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
                  const SizedBox(height: 16),
                  ProfileDropdown(
                    dropdownName: 'การประสบอุบัติเหตุ',
                    listSelection: ['เคย', 'ไม่เคย'],
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  ProfileButton(
                    onPressed: () {
                      setState(() {
                        name = _editcontroller.text;
                        // print(name);
                        Navigator.pop(context);
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
