import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.init();

  if (message.notification != null) {
    int uniqueId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    NotificationService.showNotification(
      id: uniqueId,
      title: message.notification!.title ?? "",
      body: message.notification!.body ?? "",
    );
  }
}

class FirebaseNotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    try {
      await NotificationService.init();

      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      ('User granted permission: ${settings.authorizationStatus}');

      String? token = await _messaging.getToken();
      ('FCM Token: $token');

      await _messaging.subscribeToTopic("test");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          int uniqueId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
          NotificationService.showNotification(
            id: uniqueId,
            title: message.notification!.title ?? "",
            body: message.notification!.body ?? "",
          );
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});

      RemoteMessage? initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {}

      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
    } catch (e) {
      ('FirebaseNotificationService init error: $e');
    }
  }
}
