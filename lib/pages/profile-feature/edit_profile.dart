import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

import '../../Routes/routes_config.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  PageRoutes pageRoutes = PageRoutes();

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
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
        children: []);
  }
}
