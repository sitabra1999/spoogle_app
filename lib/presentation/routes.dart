
import 'package:flutter_spoogle_app/presentation/journeys/profile/Profile.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/Test/Firebase_Push_Notification_Test.dart';
import 'package:flutter/material.dart';
import 'journeys/HomeScreen/HomeScreen.dart';
import 'journeys/Settings/AppSetting.dart';
import '../common/constants/route_constants.dart';
import 'journeys/Auth/LoginScreen.dart';
import 'libraries/AppContents/FirebaseNotification/Test/AwesomeNotification.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.firebaseNotificationExample: (context) => const AwesomeNotificationTest(),
        RouteList.firebasePushNotificationTests: (context) => FirebasePushNotificationTest(),
        RouteList.login: (context) => const LoginScreen(),
        RouteList.appSetting: (context) => const AppSetting(),
        //RouteList.notification: (context) => const Notifications(),

        RouteList.homeScreen: (context) => const HomeScreen(),
        //RouteList.callDetails: (context) => const CallDetails(),
        RouteList.profile: (context) => const Profile(),
        //RouteList.leaveMsg: (context) => const LeaveMessage(),
        //RouteList.incomingCall: (context) => const IncomingCall(),
        //RouteList.ongoingCall: (context) => const OngoingCall(),
        //RouteList.homeScreenNav: (context) => const HomeScreenNavbar(),
        //RouteList.qrScan: (context) => const QrScan(),
        //RouteList.internetNotAvailable: (context) => InternetNotAvailable(onReload: () {  },),
      };
}
