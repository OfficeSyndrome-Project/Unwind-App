import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<NotificationResponse?>();

  static Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.didNotificationLaunchApp) {
      onNotification.add(notificationAppLaunchDetails.notificationResponse);
    }

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {},
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {
        onNotification.add(details);
      },
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          channelDescription: 'channelDescription',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());
  }

  static Future showNotification(
          {int id = 0, String? title, String? body, String? payLoad}) async =>
      flutterLocalNotificationsPlugin
          .show(id, title, body, await notificationDetails(), payload: payLoad);

  static Future<void> scheduleNotification(
      {int id = 0,
      required String title,
      required String body,
      String? payLoad,
      required DateTime selectedDay}) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    if (selectedDay.isBefore(now) == true) {
      return flutterLocalNotificationsPlugin.cancel(id);
    } else
      return flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(selectedDay.toLocal(), tz.local),
          await notificationDetails(),
          payload: payLoad,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void cancel(int id) => flutterLocalNotificationsPlugin.cancel(id);
  static void cancelAll() => flutterLocalNotificationsPlugin.cancelAll();
}
