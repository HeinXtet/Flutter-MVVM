import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      "com.protection.android", "TureProtection Service Channel",
      description: "This is description", importance: Importance.max);

  init() async {
   await _onHandle();
  }

  _notificationSetupForAndroid() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {});
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        //debugPrint('notification payload: $payload');
      }
      //  selectedNotificationPayload = payload;
    });
  }

  _onHandle() async {
    await _notificationSetupForAndroid();
    _handleForegroundMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
    Future<void> _backgroundMessageHandler(RemoteMessage message) async {
      print('background message ${message.notification?.body}');
    }

    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  _handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print("foreground message ${message.notification!.body}");
        if (message.notification == null) {
          return;
        }
        RemoteNotification notification = message.notification!;
        AndroidNotification android = message.notification!.android!;
        var initializationSettingsAndroid =
            const AndroidInitializationSettings('ic_launcher');
        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              priority: Priority.max,
              importance: Importance.max,
              enableVibration: true,
            ),
          ),
        );
      },
    );
  }
}
