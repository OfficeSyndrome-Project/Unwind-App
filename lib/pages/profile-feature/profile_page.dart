import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/Widgets/icontext_widget.dart';
import 'package:unwind_app/Widgets/text_with_starticon_widget.dart';
import 'package:unwind_app/Routes/routes_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PageRoutes pageRoutes = PageRoutes();
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              // Container(
              //   width: 120,
              //   height: 120,
              //   decoration: const BoxDecoration(

              //     image: DecorationImage(
              //       // image: AssetImage('lib/assets/images/profile-img.png'),
              //       image: AssetImage('lib/assets/images/time-management.png'),
              //       fit: BoxFit.fill,

              //     ),

              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              Container(
                // width: 308,
                // height: 283,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(width: 4),
                            textIcon(
                              context,
                              "ข้อมูลส่วนตัว",
                              const Color(0xFF484D56),
                              const Icon(
                                Icons.contact_mail_outlined,
                                color: Color(0xFF7F8795),
                                size: 16,
                              ),
                            ),

                            const SizedBox(height: 8),
                          ]),
                    ),
                    //////////////แสดงข้อมูล//////////
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 220, ////แก้ด้วย*****
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'ชื่อ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Expanded(
                                child: Text('ณัฐวดี',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                'นามสกุล',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Expanded(
                                child: Text('ลี',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'อายุ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Expanded(
                                child: Text('21',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'เพศ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              // const SizedBox(width: 8),
                              Expanded(
                                child: Text('หญิง',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'น้ำหนัก',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              // const SizedBox(width: 8),
                              Expanded(
                                child: Text('40 กก.',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'ส่วนสูง',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              // const SizedBox(width: 8),
                              Expanded(
                                child: Text('160 ซม.',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'อาชีพ',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Expanded(
                                child: Text('นักเรียน/นักศึกษา',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'อีเมลล์',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Expanded(
                                child: Text('test@gmail.com',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.right),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, pageRoutes.profile.editpage().route(context));
              },
              child: iconText(
                context,
                "จัดการโปรโฟล์",
                const Color(0xff3b67cd),
                Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22,
                ),
              ),
            ),
          ),
        ]);
  }
}
