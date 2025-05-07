import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = 'Chưa có thông báo nào';

  @override
  void initState() {
    super.initState();

    // Yêu cầu quyền thông báo (Android 13+ và iOS)
    FirebaseMessaging.instance.requestPermission();

    // In FCM token (sử dụng để gửi từ Firebase Console)
    FirebaseMessaging.instance.getToken().then((token) {
      print('📱 FCM Token: $token');
    });

    // Nhận thông báo khi app đang foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _message =
        '📨 Foreground: ${message.notification?.title} - ${message.notification?.body}';
      });
    });

    // Khi người dùng nhấn vào thông báo để mở app
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      setState(() {
        _message =
        '🟢 Opened from notification: ${message.notification?.title}';
      });
    });

    // Khi app mở lên từ trạng thái terminate do click vào thông báo
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        setState(() {
          _message =
          '🚪 Opened from terminated push: ${message.notification?.title}';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Messaging'),
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}
