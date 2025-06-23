import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Manages local notification scheduling. This contains only minimal logic and
/// can be expanded later.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  /// Initializes the underlying plugin. Call this before scheduling
  /// notifications.
  Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(settings);
  }

  /// Schedules a simple notification at the given [dateTime].
  Future<void> scheduleNotification(int id, String title, String body,
      DateTime dateTime) async {
    await _plugin.zonedSchedule(
      id,
      title,
      body,
      dateTime.toLocal(),
      const NotificationDetails(
        android: AndroidNotificationDetails('meds', 'Medication'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
