import 'package:flutter/material.dart';

import 'package:unwind_app/Widgets/soud_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/services/schedule-service/notification_service.dart';

class TestNotification extends StatefulWidget {
  const TestNotification({Key? key}) : super(key: key);

  @override
  State<TestNotification> createState() => _TestNotificationState();
}

class _TestNotificationState extends State<TestNotification> {
  // @override
  void initState() {
    super.initState();

    TtsManager.initTts();
  }

  // void listenNotification() => NotificationService.onNotifications.stream.listen((event) { });

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () => NotificationService.showNotification(
                  title: 'Sample title', body: 'hey!'),
              child: Text('show noti')),
          ElevatedButton(
              onPressed: () {
                TtsManager.speak('ขออั่งเปาหน่อย');
              },
              child: Text('test tts')),
        ]);
  }
}
