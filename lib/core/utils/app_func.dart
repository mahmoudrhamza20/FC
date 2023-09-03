import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class AppFunc {
  static Future<String> getTokenDevice() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    // deviceToken = token;
    log("token is $token");
    return token!;
  }
}
