import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/profile-widget/show_infomation.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/text_withstart_icon.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/models/user.dart';
import 'package:unwind_app/pages/loading_page.dart';
import 'package:unwind_app/services/profile-service/profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  PageRoutes pageRoutes = PageRoutes();
  User user = User();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() async {
    final User storageUser = await ProfileService.getUser();
    setState(() {
      user = storageUser;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return LoadingPage(
        isShowNavbar: false,
      );
    return AppscreenTheme(
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        vertical: ResponsiveCheckWidget.isSmallMobile(context) ? 0 : 16,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage:
                    AssetImage('lib/assets/images/blank_profile.png'),
                radius: 60,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 16, bottom: 8),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: const Color(0xFFEBECF0),
                  // color: Colors.cyan,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  ////////// หัวข้อ- ข้อมูลส่วนตัว/////////////
                  children: [
                    TextWithStartIconWidget(
                      startIcon: Icon(
                        Icons.contact_mail_outlined,
                        color: Color(0xFF7F8795),
                      ),
                      topicName: 'ข้อมูลส่วนตัว',
                      style: TextStyle(
                        fontFamily: "Noto Sans Thai",
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 16
                            : 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      ),
                    ),
                    //////////////แสดงข้อมูล//////////
                    SizedBox(
                      height: 16,
                    ),
                    ShowInfomation(
                      headDetails: 'ชื่อ',
                      detail: user.firstName,
                    ),
                    SizedBox(height: 2),
                    ShowInfomation(
                        headDetails: 'นามสกุล', detail: user.lastName),
                    SizedBox(height: 2),
                    ShowInfomation(
                        headDetails: 'อายุ',
                        detail: user.age.toString() + " ปี"),
                    SizedBox(height: 2),
                    ShowInfomation(headDetails: 'เพศ', detail: user.sex),
                    SizedBox(height: 2),
                    ShowInfomation(
                        headDetails: 'น้ำหนัก',
                        detail: user.weight.toString() + " กก."),
                    SizedBox(height: 2),
                    ShowInfomation(
                        headDetails: 'ส่วนสูง',
                        detail: user.height.toString() + " ซม."),
                    SizedBox(height: 2),
                    ShowInfomation(headDetails: 'อาชีพ', detail: user.career),
                    SizedBox(height: 2),
                    ShowInfomation(
                        headDetails: 'การประสบอุบัติเหตุ',
                        detail: user.accident),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   pageRoutes.profile.editpage().route(context),
                // );
                Navigator.push(
                  context,
                  pageRoutes.profile.editpage().route(context),
                ).then((updatedUser) {
                  if (updatedUser != null) {
                    setState(() {
                      user = updatedUser;
                    });
                  }
                });
              },
              child: TextWithStartIconWidget(
                  startIcon: Icon(
                    Icons.edit_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  topicName: 'จัดการโปรไฟล์',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3B67CD),
                  )),
            ),
          ),
        ]);
  }
}
