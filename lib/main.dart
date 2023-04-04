import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/LoginApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeNavBar.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/FirebaseNotificationImpl.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/RedScreen/FlutterPhoenix/flutter_phoenix.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/RootApp.dart';
import 'presentation/journeys/Auth/LoginScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColor.accentColor));

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    //'resource://drawable/ic_notification',
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_tests',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: AppColor.primaryColor,
            ledColor: Colors.white,
            importance: NotificationImportance.High
        ),

        NotificationChannel(
            channelGroupKey: 'image_tests',
            channelKey: 'big_picture',
            channelName: 'Big pictures',
            channelDescription: 'Notifications with big and beautiful images',
            defaultColor: AppColor.primaryColor,
            ledColor: AppColor.primaryColor,
            vibrationPattern: lowVibrationPattern,
            importance: NotificationImportance.High,
        ),
      ],

      channelGroups: [
        NotificationChannelGroup(channelGroupkey: 'basic_tests', channelGroupName: 'Basic tests'),
        NotificationChannelGroup(channelGroupkey: 'image_tests', channelGroupName: 'Images tests'),
      ],
      debug: true
  );

  // Uncomment those lines after activate google services inside example/android/build.gradle
  // Create the initialization Future outside of `build`:

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  getUserId().then((screen){
    runApp(DevicePreview(
      enabled: false,
      builder: (context) => Phoenix(child: RootApp(screenName: screen))
    ));
  });
}
Future<Widget> getUserId() async {
  String userId = "";
  try {
    LoginApiResModel model= LoginApiResModel();
    model = await AppSharedPreferences().getUserDetails();
    userId = model.response?.userId.toString()?? "";
    //Strings.selfId = model.response?.mobile?? Strings.appName;
    Strings.selfUserImg = model.response?.image?? Strings.appLogoUrlPotraitBlackBg;
    //debugPrint('----userId : $userId, selfId: ${Strings.selfId}');
  } catch (e) {
    debugPrint('----getUserId Error : $e');
  }
  debugPrint('---- User id: $userId');

  // AppSharedPreferences().clearPreferenceData();
  // return  const LoginScreen() ;
  return userId.isEmpty? const LoginScreen() : const HomeNavBar();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint('Handling a background message: ${message.messageId}');

  AwesomeAndFirebaseNotificationImpl.handleNotificationOnReceive(message);
}


