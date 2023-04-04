
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeScreen.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/notification_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'AwesomeNotification/notification_dialogs.dart';
import 'PushNotification/NotificationModel.dart';
import 'PushNotification/firebase_datasource.dart';


class AwesomeAndFirebaseNotificationImpl {
  //String _oneSignalToken = '';

  bool delayLEDTests = false;

  bool globalNotificationsAllowed = false;
  bool schedulesFullControl = false;
  bool isCriticalAlertsEnabled = false;
  bool isPreciseAlarmEnabled = false;
  bool isOverrideDnDEnabled = false;

  Map<NotificationPermission, bool> scheduleChannelPermissions = {};
  Map<NotificationPermission, bool> dangerousPermissionsStatus = {};

  List<NotificationPermission> channelPermissions = [
    NotificationPermission.Alert,
    NotificationPermission.Sound,
    NotificationPermission.Badge,
    NotificationPermission.Light,
    NotificationPermission.Vibration,
    NotificationPermission.CriticalAlert,
    NotificationPermission.FullScreenIntent
  ];

  List<NotificationPermission> dangerousPermissions = [
    NotificationPermission.CriticalAlert,
    NotificationPermission.OverrideDnD,
    NotificationPermission.PreciseAlarms,
  ];

  void checkBasicNotificationPermission(BuildContext context){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      debugPrint('---- isNotificationAllowed: $isAllowed');
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        notificationListenerImpl(context);
      }
    });
  }

  void checkCallNotificationPermission(BuildContext context){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      debugPrint('---- isNotificationAllowed: $isAllowed');
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        notificationListenerImpl(context);
      }
    });
  }

  void notificationListenerImpl(BuildContext context){
    AwesomeNotifications().createdStream.listen((receivedNotification) {
      String? createdSourceText = AwesomeAssertUtils.toSimpleEnumString(receivedNotification.createdSource);
      debugPrint("----: $createdSourceText Notifications created");
    });

    AwesomeNotifications().displayedStream.listen((receivedNotification) {
      String? createdSourceText = AwesomeAssertUtils.toSimpleEnumString(receivedNotification.createdSource);
      debugPrint("----: $createdSourceText Notifications displayed");
    });

    AwesomeNotifications().dismissedStream.listen((receivedAction) {
      String? dismissedSourceText = AwesomeAssertUtils.toSimpleEnumString(
          receivedAction.dismissedLifeCycle);

      debugPrint("----: Notification dismissed on $dismissedSourceText");
    });

    AwesomeNotifications().actionStream.listen((receivedAction){
      debugPrint('----fb Call payload: ${receivedAction.buttonKeyPressed}');
      /*
        debugPrint('----fb Call payload 1: ${receivedAction.channelKey}');
        debugPrint('----fb Call payload 2: ${receivedAction.title}');
        debugPrint('----fb Call payload 2: ${receivedAction.payload!["peerMobile"] ?? ""}');
        debugPrint('----fb Call payload 2: ${receivedAction.payload!["notificationId"] ?? ""}');
      */

      String peerId = receivedAction.payload?["peerMobile"] ?? "";
      String notificationId = receivedAction.payload?["notificationId"] ?? "";
      if (receivedAction.title == 'Incoming Call' && receivedAction.buttonKeyPressed == 'ACCEPT') {
        //update database data
      } else {
        openScreen(context, const HomeScreen());
      }

      dismissNotification(notificationId);
    });
  }

  initFirebaseNotificationImpl(BuildContext context, Function(String firebaseAppToken) onFirebaseAppToken) async {
    try{
      // Uncomment those lines after activate google services inside example/android/build.gradle
      await initializeFirebaseService().then((firebaseAppToken){
        //debugPrint('----firebaseAppToken returned : $firebaseAppToken');
        onFirebaseAppToken(firebaseAppToken);
      });

      for(NotificationPermission permission in channelPermissions){
        scheduleChannelPermissions[permission] = false;
      }

      for(NotificationPermission permission in dangerousPermissions){
        dangerousPermissionsStatus[permission] = false;
      }
    } catch (e){
      debugPrint('----Init FirebaseNotification Impl Error : $e');
    }
  }

  void requestNotificationPermission(BuildContext context){
    refreshPermissionsIcons().then((_) =>
        NotificationDialogs.requestBasicPermissionToSendNotifications(context).then((allowed){
          if(allowed != globalNotificationsAllowed) {
            refreshPermissionsIcons();
          }
        })
    );
  }

  void loadSingletonPage({required String targetPage, required ReceivedAction receivedAction}){
    // Avoid to open the Notifications details page over another details page already opened
    //Navigator.pushNamedAndRemoveUntil(context, targetPage, (route) => (route.settings.name != targetPage) || route.isFirst, arguments: receivedAction);
  }

  Future<void> refreshPermissionsIcons() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      globalNotificationsAllowed = isAllowed;
    });
    refreshScheduleChannelPermissions();
    refreshDangerousChannelPermissions();
  }

  void refreshScheduleChannelPermissions(){
    AwesomeNotifications().checkPermissionList(
        channelKey: 'scheduled',
        permissions: channelPermissions
    ).then((List<NotificationPermission> permissionsAllowed){
      schedulesFullControl = true;
      for(NotificationPermission permission in channelPermissions){
        scheduleChannelPermissions[permission] = permissionsAllowed.contains(permission);
        schedulesFullControl = schedulesFullControl && scheduleChannelPermissions[permission]!;
      }
    });
  }

  void refreshDangerousChannelPermissions(){
    AwesomeNotifications().checkPermissionList(permissions: dangerousPermissions
    ).then((List<NotificationPermission> permissionsAllowed){
      for(NotificationPermission permission in dangerousPermissions){
        dangerousPermissionsStatus[permission] = permissionsAllowed.contains(permission);
      }
      isCriticalAlertsEnabled = dangerousPermissionsStatus[NotificationPermission.CriticalAlert]!;
      isPreciseAlarmEnabled = dangerousPermissionsStatus[NotificationPermission.PreciseAlarms]!;
      isOverrideDnDEnabled = dangerousPermissionsStatus[NotificationPermission.OverrideDnD]!;
    }
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<String> initializeFirebaseService() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String firebaseAppToken = await messaging.getToken(
      // https://stackoverflow.com/questions/54996206/firebase-cloud-messaging-where-to-find-public-vapid-key
      vapidKey: 'AAAAM5WJNBg:APA91bFLTHqVgWQyNAjn2pe1mzo0ibmeYTGws6OvEM1OtIleAubIP0F6ZLqk9zoxljBc4YX6lNmfrwrM8T3PiA3HPwcymeLVy2B15VvhoLstAQyqAmcgvUT6rIxPR-axYQeuzJ0NOFT-',
    ) ?? '';

    //debugPrint('----Firebase token: $firebaseAppToken');
    //return firebaseAppToken = '' empty if no token found
    if (AwesomeStringUtils.isNullOrEmpty(firebaseAppToken, considerWhiteSpaceAsEmpty: true)) return '';

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('----Got a message whilst in the foreground!');
      handleNotificationOnReceive(message);
    });

    return firebaseAppToken;
  }

  static void handleNotificationOnReceive(RemoteMessage message) {
    debugPrint('----Message data: ${message.data}');
    var  notificationPayloadModel = notificationModelFromJson(message.data.values.first);
    debugPrint('----Message data channelKey: ${notificationPayloadModel.channelKey}');
    if (notificationPayloadModel.channelKey == 'incoming_call' || notificationPayloadModel.channelKey == 'call_channel'
        || notificationPayloadModel.title == 'Incoming Call') {
      NotificationUtils.showNotificationWithActionButtonsForCall(
        callerName: notificationPayloadModel.body?? "from Code Bell",
        callerImg: notificationPayloadModel.largeIcon?? Strings.appLogoUrlSqWhiteBg,
        payload: {
          'notificationId': notificationPayloadModel.id.toString(),
          'peerUserId': notificationPayloadModel.payload?.peerUserId?? "",
          'peerName': notificationPayloadModel.payload?.peerName?? "",
          'peerImage': notificationPayloadModel.payload?.peerImage?? "",
          'peerDeviceToken': notificationPayloadModel.payload?.peerDeviceToken?? "",
          'peerMobile': notificationPayloadModel.payload?.peerMobile?? "",
        },
      );
    } else if (
    // This step (if condition) is only necessary if you pretend to use the
    // test page inside console.firebase.google.com
    !AwesomeStringUtils.isNullOrEmpty(message.notification?.title, considerWhiteSpaceAsEmpty: true) ||
        !AwesomeStringUtils.isNullOrEmpty(message.notification?.body, considerWhiteSpaceAsEmpty: true)
    ) {
      debugPrint('----Message also contained a Notifications: ${message.notification}');

      String? imageUrl;
      imageUrl ??= message.notification!.android?.imageUrl;
      imageUrl ??= message.notification!.apple?.imageUrl;

      // https://pub.dev/packages/awesome_notifications#notification-types-values-and-defaults
      Map<String, dynamic> notificationAdapter = {
        NOTIFICATION_CONTENT: {
          NOTIFICATION_ID: getRandomNumberInRange(),
          NOTIFICATION_CHANNEL_KEY: 'basic_channel',
          NOTIFICATION_TITLE: message.notification!.title,
          NOTIFICATION_BODY: message.notification!.body,
          NOTIFICATION_LAYOUT: AwesomeStringUtils.isNullOrEmpty(imageUrl) ? 'Default' : 'BigPicture',
          NOTIFICATION_BIG_PICTURE: imageUrl
        }
      };

      AwesomeNotifications().createNotificationFromJsonData(notificationAdapter);
    } else {
      AwesomeNotifications().createNotificationFromJsonData(message.data);
    }
  }

  void sendCallPushNotificationByFirebase(String firebaseAppToken, String peerId) async {
    //String? firebaseAppToken = await AppSharedPreferences().getFirebaseToken();
    //String firebaseAppToken = "eiPjhX95Q0qJZVwUIlhEm4:APA91bHlXEUaMeXmc9V1XA3TX_W6fG5opF3ylXQpcs6apX7ohMnm28jL4KxTKvmNpMqoV9pVsyKuxO-sHA6TKTj92hZNjxfVvlSpjXk5Ppuv52pblF7x6a9u5KXPF1DcsjxzDjxMr1Ip";

    //Web caller doesn't have ac so sending static data but firebaseAppToken is receiver token for Notifications send
    if (kIsWeb) {
      await FirebaseDataSource().pushNotificationCall(
        firebaseAppToken: firebaseAppToken,
        notificationId: getRandomNumberInRange(),
        title: 'Incoming Call',
        body: 'from ${Strings.appName}',
        peerImage: Strings.appLogoUrlPotraitBlackBg,
        peerMob: "Strings.selfId",
        payload: {
          'selfMob': peerId,  // this data reflect opposite when user receiving notification.
          'peerUserId': Strings.appName,
          'peerName': Strings.appName,
          'peerImage': Strings.appLogoUrlPotraitBlackBg,
          'peerDeviceToken': firebaseAppToken,
          'peerMobile': Strings.appName
        },
      );
    } else {
      AppSharedPreferences().getUserDetails().then((loginApiResModel) async {
        await FirebaseDataSource().pushNotificationCall(
          firebaseAppToken: firebaseAppToken,
          notificationId: getRandomNumberInRange(),
          title: 'Incoming Call',
          body: 'from ${loginApiResModel.response?.name?? "Strings.selfId"}',
          peerImage: loginApiResModel.response?.image ?? "",
          peerMob: "Strings.selfId",
          payload: {
            'selfMob': peerId,
            'peerUserId': loginApiResModel.response!.userId.toString(),
            'peerName': loginApiResModel.response?.name?? "Strings.selfId",
            'peerImage': loginApiResModel.response?.image ?? Strings.appLogoUrlPotraitBlackBg,
            'peerDeviceToken': firebaseAppToken,
            'peerMobile': "Strings.selfId"
          },
        );
      });
    }
  }

  static void sendBasicPushNotificationByFirebase(
      {required String firebaseAppToken, required String title, required String body, required Map<String, String> payload}) async {
    await FirebaseDataSource().pushBasicNotification(
        firebaseAppToken: firebaseAppToken,
        notificationId: getRandomNumberInRange(),
        title: title,
        body: body,
        payload: payload
    );
  }

  static Future<void> dismissNotification(String notificationId) async {
    if (notificationId.isNotEmpty) {
      //remove Notifications
      await AwesomeNotifications().dismiss(int.parse(notificationId));
    }
  }
}