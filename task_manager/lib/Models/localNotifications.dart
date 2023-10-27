import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
class LocalNotificationServices{
  LocalNotificationServices();
  
  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> intialize()async{
    const AndroidInitializationSettings androidInitializationSetting= 
    AndroidInitializationSettings('@drawable/ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  final InitializationSettings settings = 
    InitializationSettings(android: androidInitializationSetting,iOS: initializationSettingsDarwin);

    await _localNotificationService.initialize(
      settings,
       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse 
      );

  }

Future<NotificationDetails> _notificationDetails()async {
const  AndroidNotificationDetails androidNotificationDetails = 
  AndroidNotificationDetails(
    "channel_id",
    "channel_name",
    channelDescription: "channel_description",
    importance: Importance.max,
    priority: Priority.max,
    playSound: true,
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();
    return NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails);

}

Future<void> showNotification({
  required int id,
  required String title,
  required String body,

}) async{
  final _details = await _notificationDetails();
  await _localNotificationService.show(id, title, body, _details);
}
Future<void> showSchedulenotification({
  required int id,
  required String title,
  required String body,
  required String dueDate,
}) async {
  final _details = await _notificationDetails();

   // Initialize time zone data (usually done in the main function)
  tzdata.initializeTimeZones();

  // Get the local time zone
  final local = tz.local;

final parsedDueDate = DateTime.parse(dueDate);
  // Calculate the time before the due date when the notification should be shown (e.g., 1 hour before)
  var notificationTime = parsedDueDate.subtract(const Duration(hours: 1));
   // Check if the calculated notificationTime is in the future
  if (notificationTime.isBefore(DateTime.now())) {
    // If it's not in the future, set it to a future time (e.g., 1 minute from now)
    notificationTime = DateTime.now().add(const Duration(minutes: 1));
  }
  await _localNotificationService.zonedSchedule(
    id, // Unique ID for this notification
    title,
    body,
    tz.TZDateTime.from(notificationTime, local), // Convert to the local time zone
    _details,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}




  void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
  }

  void onDidReceiveNotificationResponse(NotificationResponse details) {
    print("payloads");
  }
}