import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:uepgacadonline_flutter/main.dart';

Future showNotification(int id, String title, String message) async {
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'notification_id', 'notification_android', 'notification_android',
      importance: Importance.Max, priority: Priority.High);
  final iOSPlatformChannelSpecifics = IOSNotificationDetails();

  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    id,
    title,
    message,
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}
