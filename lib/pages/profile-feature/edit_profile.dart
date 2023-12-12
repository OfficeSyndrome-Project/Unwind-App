import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_button.dart';
import 'package:unwind_app/Widgets/profile-widget/profile_textform_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../Routes/routes_config.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  // PageRoutes pageRoutes = PageRoutes();

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  PageRoutes pageRoutes = PageRoutes();
  String? _selectedValue;

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
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: const ProfileTextForm(
                      formName: 'ชื่อ',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: const ProfileTextForm(
                      formName: 'นามสกุล',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: const ProfileTextForm(
                      formName: 'อายุ',
                      inputType: TextInputType.number,
                      formUnit: 'ปี',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      items: <String>[
                        'ชาย',
                        'หญิง',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      // hint: const Text(
                      //   "เพศ",
                      //   style: TextStyle(
                      //     color: Color(0xFF9BA4B5),
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      value: _selectedValue,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9BA4B5),
                      ),
                      decoration: const InputDecoration(
                          labelText: 'เพศ',
                          labelStyle: TextStyle(color: Color(0xFF7F8795)),
                          contentPadding: EdgeInsets.only(bottom: 0, top: 00),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF9BA4B5),
                            width: 1,
                          ))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: const ProfileTextForm(
                      formName: 'ส่วนสูง',
                      inputType: TextInputType.number,
                      formUnit: 'ซม.',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 46,
                    width: double.infinity,
                    child: const ProfileTextForm(
                      formName: 'น้ำหนัก',
                      inputType: TextInputType.number,
                      formUnit: 'กก.',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                      height: 46,
                      width: double.infinity,
                      child: const ProfileTextForm(formName: 'สมมติว่ามี')),
                  const SizedBox(height: 16),
                  // SizedBox(
                  //   height: 46,
                  //   width: double.infinity,
                  //   child: DropdownButtonFormField(
                  //     items: <String>[
                  //       'เคย',
                  //       'ไม่เคย',
                  //     ].map<DropdownMenuItem<String>>((String value) {
                  //       return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(
                  //             value,
                  //             style: const TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w500),
                  //           ));
                  //     }).toList(),
                  //     onChanged: (String? value) {
                  //       setState(() {
                  //         _selectedValue = value;
                  //       });
                  //     },
                  //     hint: const Text(
                  //       "การประสบอุบัติเหตุ",
                  //       style: TextStyle(
                  //         color: Color(0xFF9BA4B5),
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //     value: _selectedValue,
                  //     icon: const Icon(
                  //       Icons.keyboard_arrow_down_rounded,
                  //       color: Color(0xFF9BA4B5),
                  //     ),
                  //     decoration: const InputDecoration(
                  //         enabledBorder: UnderlineInputBorder(
                  //             borderSide: BorderSide(
                  //       color: Color(0xFF9BA4B5),
                  //       width: 1,
                  //     ))),
                  //   ),
                  // ),
                  SizedBox(
                    height: 48,
                  ),
                  ProfileButton()
                ],
              ),
            ),
          ),
        ]);
  }
}
