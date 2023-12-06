import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../Routes/routes_config.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  // PageRoutes pageRoutes = PageRoutes();

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  PageRoutes pageRoutes = PageRoutes();
  // String? item = 'item1';
  // List items = [
  //   'item1',
  //   'ชาย',
  //   'หญิง',
  // ];

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
          SizedBox(
            width: 312,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'ชื่อ',
                      hintStyle: TextStyle(
                        color: Color(0xFF9BA4B5),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF9BA4B5),
                        width: 1,
                      ))),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'นามสกุล',
                      hintStyle: TextStyle(
                        color: Color(0xFF9BA4B5),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF9BA4B5),
                        width: 1,
                      ))),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'อายุ',
                      hintStyle: TextStyle(
                        color: Color(0xFF9BA4B5),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF9BA4B5),
                        width: 1,
                      ))),
                ),
                const SizedBox(height: 8),
                // DropdownButton(
                //   value: item,
                //   items: items
                //       .map((item) =>
                //           DropdownMenuItem(value: item, child: Text(item)))
                //       .toList(),
                //   onChanged: (value) => setState(() => item = value.toString()),
                // ),
              ],
            ),
          ),
        ]);
  }
}
