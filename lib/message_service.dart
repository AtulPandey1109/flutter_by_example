
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessagingService {
  static String? fcmToken; // Variable to store the FCM token

  static final MessagingService _instance = MessagingService._internal();

  factory MessagingService() => _instance;

  MessagingService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init(BuildContext context) async {
    // Requesting permission for notifications
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    fcmToken = await _fcm.getToken();


    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // if (message.notification != null) {
      //   if (message.notification!.title != null &&
      //       message.notification!.body != null) {
      //     final notificationData = message.data;
      //     final screen = notificationData['screen'];
      //
      //     showDialog(
      //       context: context,
      //       barrierDismissible: false,
      //       builder: (BuildContext context) {
      //         return PopScope(
      //           canPop: false,
      //           child: AlertDialog(
      //             title: Text(message.notification!.title!),
      //             content: Text(message.notification!.body!),
      //             actions: [
      //               if (notificationData.containsKey('screen'))
      //                 TextButton(
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                     Navigator.of(context).pushNamed(screen);
      //                   },
      //                   child: const Text('Open Screen'),
      //                 ),
      //               TextButton(
      //                 onPressed: () => Navigator.of(context).pop(),
      //                 child: const Text('Dismiss'),
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   }
      // }
      showNotification(message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotificationClick(context, message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
          'onMessageOpenedApp: ${message.notification!.title.toString()}');
      _handleNotificationClick(context, message);

    });
  }

  void _handleNotificationClick(BuildContext context, RemoteMessage message) {
    final notificationData = message.data;

    if (notificationData.containsKey('screen')) {
      final screen = notificationData['screen'];
      Navigator.of(context).pushNamed(screen);
    }
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> localInit() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    int notificationId = 1;
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await FlutterLocalNotificationsPlugin().show(
        notificationId,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: 'Not present'
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message: ${message.notification!.title}');
}
