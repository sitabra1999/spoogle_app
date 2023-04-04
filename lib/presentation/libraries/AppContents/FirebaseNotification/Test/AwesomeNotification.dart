import 'dart:math';
import 'dart:io';

import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/led_light.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/notification_dialogs.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/notification_util.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/service_control_panel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/simple_button.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/text_divisor.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/text_note.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter/services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'Firebase_Push_Notification_Test.dart';
import 'notification_details_page.dart';

class AwesomeNotificationTest extends StatefulWidget {
  const AwesomeNotificationTest({Key? key}) : super(key: key);

  @override
  State<AwesomeNotificationTest> createState() => _AwesomeNotificationTestState();
}

class _AwesomeNotificationTestState extends State<AwesomeNotificationTest> {
  String _firebaseAppToken = '';
  //String _oneSignalToken = '';

  bool delayLEDTests = false;
  final double _secondsToWakeUp = 5;
  final double _secondsToCallCategory = 5;

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
    NotificationPermission.Provisional,
    NotificationPermission.FullScreenIntent,
  ];

  String packageName = 'com.dreamnext.codebell';

  Future<DateTime?> pickScheduleDate(BuildContext context,
      {required bool isUtc}) async {
    TimeOfDay? timeOfDay;
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now();
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.add(const Duration(days: 365)));

    if (newDate != null) {
      timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(now.add(const Duration(minutes: 1))),
      );

      if (timeOfDay != null) {
        return isUtc
            ? DateTime.utc(newDate.year, newDate.month, newDate.day,
            timeOfDay.hour, timeOfDay.minute)
            : DateTime(newDate.year, newDate.month, newDate.day, timeOfDay.hour,
            timeOfDay.minute);
      }
    }
    return null;
  }

  int _pickAmount = 50;
  Future<int?> pickBadgeCounter(BuildContext context, int initialAmount) async {
    setState(() => _pickAmount = initialAmount);

    // show the dialog
    return showDialog<int?>(
        context: context,
        builder: (BuildContext context) =>
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) =>
                    AlertDialog(
                      title: const Text("Choose the new badge amount"),
                      actions: [
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop(null);
                          },
                        ),
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(_pickAmount);
                          },
                        ),
                      ],
                    )
            )
    );
  }

  @override
  void initState() {
    super.initState();

    // Uncomment those lines after activate google services inside example/android/build.gradle
    //initializeFirebaseService();

    // If you pretend to use the firebase service, you need to initialize it
    // getting a valid token
    // initializeFirebaseService();

    for(NotificationPermission permission in channelPermissions){
      scheduleChannelPermissions[permission] = false;
    }

    for(NotificationPermission permission in dangerousPermissions){
      dangerousPermissionsStatus[permission] = false;
    }

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

    AwesomeNotifications().actionStream.listen((receivedAction) {

      if(receivedAction.channelKey == 'call_channel'){
        switch (receivedAction.buttonKeyPressed) {

          case 'REJECT':
            AndroidForegroundService.stopForeground();
            break;

          case 'ACCEPT':
            loadSingletonPage(targetPage: "PAGE_PHONE_CALL", receivedAction: receivedAction);
            AndroidForegroundService.stopForeground();
            break;

          default:
            loadSingletonPage(targetPage: "PAGE_PHONE_CALL", receivedAction: receivedAction);
            break;
        }
        return;
      }

      if (receivedAction.channelKey == 'alarm_channel') {
        AndroidForegroundService.stopForeground();
        return;
      }

      if (!AwesomeStringUtils.isNullOrEmpty(receivedAction.buttonKeyInput)) {

      } else if (!AwesomeStringUtils.isNullOrEmpty(
          receivedAction.buttonKeyPressed) && receivedAction.buttonKeyPressed.startsWith('MEDIA_')) {
        processMediaControls(receivedAction);
      } else {
        processDefaultActionReceived(receivedAction);
      }
    });

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
    Navigator.pushNamedAndRemoveUntil(context, targetPage, (route) =>
    (route.settings.name != targetPage) || route.isFirst, arguments: receivedAction);
  }

  Future<void> refreshPermissionsIcons() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      setState(() {
        globalNotificationsAllowed = isAllowed;
      });
    });
    refreshScheduleChannelPermissions();
    refreshDangerousChannelPermissions();
  }

  void refreshScheduleChannelPermissions(){
    AwesomeNotifications().checkPermissionList(
        channelKey: 'scheduled',
        permissions: channelPermissions
    ).then((List<NotificationPermission> permissionsAllowed) =>
        setState(() {
          schedulesFullControl = true;
          for(NotificationPermission permission in channelPermissions){
            scheduleChannelPermissions[permission] = permissionsAllowed.contains(permission);
            schedulesFullControl = schedulesFullControl && scheduleChannelPermissions[permission]!;
          }
        })
    );
  }

  void refreshDangerousChannelPermissions(){
    AwesomeNotifications().checkPermissionList(permissions: dangerousPermissions
    ).then((List<NotificationPermission> permissionsAllowed) =>
        setState(() {
          for(NotificationPermission permission in dangerousPermissions){
            dangerousPermissionsStatus[permission] = permissionsAllowed.contains(permission);
          }
          isCriticalAlertsEnabled = dangerousPermissionsStatus[NotificationPermission.CriticalAlert]!;
          isPreciseAlarmEnabled = dangerousPermissionsStatus[NotificationPermission.PreciseAlarms]!;
          isOverrideDnDEnabled = dangerousPermissionsStatus[NotificationPermission.OverrideDnD]!;
          bool isProvisionalEnabled = dangerousPermissionsStatus[NotificationPermission.Provisional]!;
          bool isFullScreenIntentEnabled = dangerousPermissionsStatus[NotificationPermission.FullScreenIntent]!;

          debugPrint('-----------: $isCriticalAlertsEnabled, $isPreciseAlarmEnabled, $isOverrideDnDEnabled, $isProvisionalEnabled, $isFullScreenIntentEnabled');
        })
    );
  }

  void processDefaultActionReceived(ReceivedAction receivedAction) {
    debugPrint("----Action received: ${receivedAction.toString()}");

    //String targetPage;

    // Avoid to reopen the media page if is already opened
    if (receivedAction.channelKey == 'media_player') {
      //targetPage = "PAGE_MEDIA_DETAILS";
      if (Navigator.of(context).isCurrent("PAGE_MEDIA_DETAILS")) return;
      loadSingletonPage(targetPage: "PAGE_MEDIA_DETAILS", receivedAction: receivedAction);
    } else {
      //targetPage = RouteList.notificationDetails;

      openScreen(context, NotificationDetailsPage(receivedNotification: receivedAction,));
    }

  }

  void processMediaControls(actionReceived) {
    switch (actionReceived.buttonKeyPressed) {

      case 'MEDIA_CLOSE':
        //MediaPlayerCentral.stop();
        break;

      case 'MEDIA_PLAY':
      case 'MEDIA_PAUSE':
        //MediaPlayerCentral.playPause();
        break;

      case 'MEDIA_PREV':
        //MediaPlayerCentral.previousMedia();
        break;

      case 'MEDIA_NEXT':
        //MediaPlayerCentral.nextMedia();
        break;

      default:
        break;
    }

    debugPrint('---- Media: ${actionReceived.buttonKeyPressed.replaceFirst('MEDIA_', '')}');
  }

  @override
  void dispose() {
    AwesomeNotifications().createdSink.close();
    AwesomeNotifications().displayedSink.close();
    AwesomeNotifications().actionSink.close();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initializeFirebaseService() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String firebaseAppToken = await messaging.getToken(
      // https://stackoverflow.com/questions/54996206/firebase-cloud-messaging-where-to-find-public-vapid-key
      vapidKey: 'AAAAM5WJNBg:APA91bFLTHqVgWQyNAjn2pe1mzo0ibmeYTGws6OvEM1OtIleAubIP0F6ZLqk9zoxljBc4YX6lNmfrwrM8T3PiA3HPwcymeLVy2B15VvhoLstAQyqAmcgvUT6rIxPR-axYQeuzJ0NOFT-',
    ) ?? '';

    //String? firebaseAppToken = await messaging.getToken();;

    if (AwesomeStringUtils.isNullOrEmpty(firebaseAppToken, considerWhiteSpaceAsEmpty: true)) return;

    if (!mounted) {
      _firebaseAppToken = firebaseAppToken;
    } else {
      setState(() {
        _firebaseAppToken = firebaseAppToken;
      });
    }

    debugPrint('----Firebase token: $firebaseAppToken');


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('----Got a message whilst in the foreground!');
      debugPrint('----Message data: ${message.data}');

      /*if (
      // This step (if condition) is only necessary if you pretend to use the
      // test page inside console.firebase.google.com
      !AwesomeStringUtils.isNullOrEmpty(message.Notifications?.title, considerWhiteSpaceAsEmpty: true) ||
          !AwesomeStringUtils.isNullOrEmpty(message.Notifications?.body, considerWhiteSpaceAsEmpty: true)) {
        debugPrint('----Message also contained a Notifications: ${message.Notifications}');

        String? imageUrl;
        imageUrl ??= message.Notifications!.android?.imageUrl;
        imageUrl ??= message.Notifications!.apple?.imageUrl;

        // https://pub.dev/packages/awesome_notifications#notification-types-values-and-defaults
        Map<String, dynamic> notificationAdapter = {
          NOTIFICATION_CONTENT: {
            NOTIFICATION_ID: Random().nextInt(2147483647),
            NOTIFICATION_CHANNEL_KEY: 'basic_channel',
            NOTIFICATION_TITLE: message.Notifications!.title,
            NOTIFICATION_BODY: message.Notifications!.body,
            NOTIFICATION_LAYOUT:
            AwesomeStringUtils.isNullOrEmpty(imageUrl) ? 'Default' : 'BigPicture',
            NOTIFICATION_BIG_PICTURE: imageUrl
          }
        };

        AwesomeNotifications().createNotificationFromJsonData(notificationAdapter);
      } else {
        AwesomeNotifications().createNotificationFromJsonData(message.data);
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          //backgroundColor: Colors.white,
          title: const Text('Awesome Notification', style: TextStyle(fontSize: 20, color: Colors.white)),
          elevation: 2, systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          children: <Widget>[
            TextDivisor(title: 'Package name'),
            //RemarkableText(text: packageName, color: themeData.primaryColor),
            SimpleButton('Copy package name', onPressed: () {
              Clipboard.setData(ClipboardData(text: packageName));
            }),

            /* ******************************************************************** */

            TextDivisor(title: 'Push Service Status'),

            ServiceControlPanel('Firebase', !AwesomeStringUtils.isNullOrEmpty(_firebaseAppToken), themeData,
              //onPressed: () => Navigator.pushNamed(context, RouteList.notificationDetails, arguments: _firebaseAppToken),
              onPressed: (){
                openScreen(context, FirebasePushNotificationTest());
              },
            ),

            const TextNote('Is not necessary to use Firebase (or other) services to use local notifications. But all they can be used simultaneously.'),

            /* ******************************************************************** */

            TextDivisor(title: 'Global Permission to send Notifications'),

            PermissionIndicator(name: null, allowed: globalNotificationsAllowed),

            const TextNote(
                'To send local and push notifications, it is necessary to obtain the user\'s consent. Keep in mind that he user consent can be revoked at any time.\n\n'
                    '* Android: notifications are enabled by default and are considered not dangerous.\n'
                    '* iOS: notifications are not enabled by default and you must explicitly request it to the user.'),
            SimpleButton('Request permission',
                enabled: !globalNotificationsAllowed,
                onPressed: (){
                  NotificationDialogs.requestBasicPermissionToSendNotifications(context).then(
                          (isAllowed) =>
                          setState(() {
                            globalNotificationsAllowed = isAllowed;
                            refreshPermissionsIcons();
                          })
                  );
                }
            ),
            SimpleButton('Open notifications permission page',
                onPressed: () => NotificationUtils.redirectToPermissionsPage().then(
                        (isAllowed) =>
                        setState(() {
                          globalNotificationsAllowed = isAllowed;
                          refreshPermissionsIcons();
                        })
                )
            ),
            SimpleButton('Open basic channel permission page',
                enabled: !Platform.isIOS,
                onPressed: () => NotificationUtils.redirectToBasicChannelPage()
            ),

            /* ******************************************************************** */

            TextDivisor(title: 'Channel\'s Permissions'),
            Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  PermissionIndicator(name: 'Alerts', allowed: scheduleChannelPermissions[NotificationPermission.Alert]!),
                  PermissionIndicator(name: 'Sounds', allowed: scheduleChannelPermissions[NotificationPermission.Sound]!),
                  PermissionIndicator(name: 'Badges', allowed: scheduleChannelPermissions[NotificationPermission.Badge]!),
                  PermissionIndicator(name: 'Vibrations', allowed: scheduleChannelPermissions[NotificationPermission.Vibration]!),
                  PermissionIndicator(name: 'Lights', allowed: scheduleChannelPermissions[NotificationPermission.Light]!),
                  PermissionIndicator(name: 'Full Intents', allowed: scheduleChannelPermissions[NotificationPermission.FullScreenIntent]!),
                  PermissionIndicator(name: 'Critical Alerts', allowed: scheduleChannelPermissions[NotificationPermission.CriticalAlert]!),
                ]),
            const TextNote(
                'To send local and push notifications, it is necessary to obtain the user\'s consent. Keep in mind that he user consent can be revoked at any time.\n\n'
                    '* OBS: if the feature is not available on device, it will be considered enabled by default.\n'),



            /* ******************************************************************** */

            TextDivisor(title: 'Global Dangerous Permissions'),

            Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  PermissionIndicator(name: 'Critical Alerts', allowed: isCriticalAlertsEnabled),
                  PermissionIndicator(name: 'Precise Alarms', allowed: isPreciseAlarmEnabled),
                  PermissionIndicator(name: 'Override DnD', allowed: isOverrideDnDEnabled),
                ]),

            const TextNote(
                'Dangerous permissions are permissions that can be disabled by default and you must obtain the user\'s consent explicity to enable. Keep in mind that he user consent can be revoked at any time.\n\n'
                    '* Android: override DnD mode is disabled by default. When the permission is granted, the DnD device state is downgraded every time when a new critical Notifications is displayed and all notifications are being fully supressed by DnD.\n'
                    '* iOS: override DnD is automatically enabled with Critical Alert\'s permission.'),
            SimpleButton('Request Precise Alarms mode',
                enabled: !isPreciseAlarmEnabled,
                onPressed: () => NotificationUtils.requestPreciseAlarmPermission(context).then((isAllowed) =>
                    setState(() {
                      refreshPermissionsIcons();
                    })
                ),
            ),
            SimpleButton('Request Critical Alerts mode',
                enabled: !isCriticalAlertsEnabled,
                onPressed: () => NotificationUtils.requestCriticalAlertsPermission(context).then(
                        (isAllowed) =>
                        setState(() {
                          refreshPermissionsIcons();
                        })
                )
            ),
            SimpleButton('Request to Override Do not Disturb mode (Android)',
                enabled: !isOverrideDnDEnabled,
                onPressed: () => NotificationUtils.requestOverrideDndPermission(context).then(
                        (isAllowed) =>
                        setState(() {
                          refreshPermissionsIcons();
                        })
                )
            ),


            /* ******************************************************************** */

            TextDivisor(title: 'Basic Notifications'),
            const TextNote('A simple and fast Notifications to fresh start.\n\n'
                'Tap on Notifications when it appears on your system tray to go to Details page.'),
            SimpleButton('Show the most basic Notifications',
                onPressed: () => NotificationUtils.showBasicNotification(1)),
            SimpleButton('Cancel the basic Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(1)),

            /* ******************************************************************** */

            TextDivisor(title: 'Notification\'s Special Category'),
            const TextNote('The Notifications category is a group of predefined categories that best describe the nature of the Notifications and may be used by some systems for ranking, delay or filter the notifications. Its highly recommended to correctly categorize your notifications..\n\n'
                'Slide the bar above to add some delay on Notifications.'),
            //SecondsSlider(steps: 12, minValue: 0, onChanged: (newValue){ setState(() => _secondsToCallCategory = newValue ); }),
            SimpleButton('Show call Notifications',
                onPressed: () {
                  //Vibration.vibrate(duration: 100);
                  Future.delayed(Duration(seconds: _secondsToCallCategory.toInt()), () {
                    NotificationUtils.showCallNotification(1);
                  });
                }),

            SimpleButton('Stop Alarm / Call',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.stopForegroundServiceNotification()),

            /* ******************************************************************** */

            TextDivisor(title: 'Big Picture Notifications'),
            const TextNote(
                'To show any images on Notifications, at any place, you need to include the respective source prefix before the path.'
                    '\n\n'
                    'Images can be defined using 4 prefix types:'
                    '\n\n'
                    '* Asset: images access through Flutter asset method.\n\t Example:\n\t asset://path/to/image-asset.png'
                    '\n\n'
                    '* Network: images access through internet connection.\n\t Example:\n\t http(s)://url.com/to/image-asset.png'
                    '\n\n'
                    '* File: images access through files stored on device.\n\t Example:\n\t file://path/to/image-asset.png'
                    '\n\n'
                    '* Resource: images access through drawable native resources.\n\t Example:\n\t resource://url.com/to/image-asset.png'),
            SimpleButton('Show large icon Notifications',
                onPressed: () => NotificationUtils.showLargeIconNotification(2)),
            SimpleButton('Show big picture Notifications\n(Network Source)',
                onPressed: () => NotificationUtils.showBigPictureNetworkNotification(2)),
            SimpleButton('Show big picture Notifications\n(Asset Source)',
                onPressed: () => NotificationUtils.showBigPictureAssetNotification(2)),
            SimpleButton('Show big picture Notifications\n(File Source)',
                onPressed: () => NotificationUtils.showBigPictureFileNotification(2)),
            SimpleButton('Show big picture Notifications\n(Resource Source)',
                onPressed: () => NotificationUtils.showBigPictureResourceNotification(2)),
            SimpleButton(
                'Show big picture and\nlarge icon Notifications simultaneously',
                onPressed: () => NotificationUtils.showBigPictureAndLargeIconNotification(2)),
            SimpleButton('Show big picture Notifications,\n but hide large icon on expand',
                onPressed: () => NotificationUtils.showBigPictureNotificationHideExpandedLargeIcon(2)),
            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(2),
            ),

            /* ******************************************************************** */

            TextDivisor(title: 'Emojis ${Emojis.smile_alien}${Emojis.transport_air_rocket}'),
            const TextNote(
                'To send local and push notifications with emojis, use the class Emoji concatenated with your text.\n\n'
                    'Attention: not all Emojis work with all platforms. Please, test the specific emoji before using it in production.'),

            SimpleButton('Go to complete Emojis list (web)',
              onPressed: () => externalUrl(
                  'https://unicode.org/emoji/charts/full-emoji-list.html'),
            ),

            /* ******************************************************************** */

            TextDivisor(title: 'Locked Notifications (onGoing - Android)'),
            const TextNote(
                'To send local or push locked Notifications, that users cannot dismiss it swiping it, set the "locked" property to true.\n\n' +
                    "Attention: Notification's content locked property has priority over the Channel's one."),

            /* ******************************************************************** */

            TextDivisor(title: 'Android Foreground Service'),
            const TextNote('This feature is only available for Android devices.'),
            SimpleButton('Start foreground service',
                onPressed: () => NotificationUtils.startForegroundServiceNotification()),
            SimpleButton('Stop foreground service',
                onPressed: () => NotificationUtils.stopForegroundServiceNotification()),

            /* ******************************************************************** */

            TextDivisor(title: 'Notification Importance (Priority)'),
            const TextNote(
                'To change the importance level of notifications, please set the importance in the respective channel.\n\n'
                    'The possible importance levels are the following:\n\n'
                    'Max: Makes a sound and appears as a heads-up Notifications.\n'
                    'Higher: shows everywhere, makes noise and peeks. May use full screen intents.\n'
                    'Default: shows everywhere, makes noise, but does not visually intrude.\n'
                    'Low: Shows in the shade, and potentially in the status bar (see shouldHideSilentStatusBarIcons()), but is not audibly intrusive\n.'
                    'Min: only shows in the shade, below the fold.\n'
                    'None: disable the channel\n\n'
                    "Attention: Notification's channel importance can only be defined on first time."),

            /* ******************************************************************** */

            TextDivisor(title: 'Action Buttons'),
            const TextNote('Action buttons can be used in four types:'
                '\n\n'
                '* Default: after user taps, the Notifications bar is closed and an action event is fired.'
                '\n\n'
                '* InputField: after user taps, a input text field is displayed to capture input by the user.'
                '\n\n'
                '* DisabledAction: after user taps, the Notifications bar is closed, but the respective action event is not fired.'
                '\n\n'
                '* KeepOnTop: after user taps, the Notifications bar is not closed, but an action event is fired.'),
            const TextNote(
                'Since Android Nougat, icons are only displayed on media layout. The icon media needs to be a native resource type.'),

            SimpleButton('Show Big picture Notifications\nwith Action Buttons',
                onPressed: () => NotificationUtils.showBigPictureNotificationActionButtons(3)),
            SimpleButton(
                'Show Big picture Notifications\nwith Reply and Action button',
                onPressed: () =>
                    NotificationUtils.showBigPictureNotificationActionButtonsAndReply(3)),

            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(3)),

            /* ******************************************************************** */

            TextDivisor(title: 'Badge Indicator'),
            const TextNote(
                '"Badge" is an indicator of how many notifications (or anything else) that have not been viewed by the user (iOS and some versions of Android) '
                    'or even a reminder of new things arrived (Android native).\n\n'
                    'For platforms that show the global indicator over the app icon, is highly recommended to erase this annoying counter as soon '
                    'as possible and even let a shortcut menu with this option outside your app, similar to "mark as read" on e-mail. The amount counter '
                    'is automatically managed by this plugin for each individual installation, and incremented for every Notifications sent to channels '
                    'with "badge" set to TRUE.\n\n'
                    'OBS: Some Android distributions provide badge counter over the app icon, similar to iOS (LG, Samsung, HTC, Sony, etc).'
            ),

            /* ******************************************************************** */

            TextDivisor(title: 'Vibration Patterns'),
            const TextNote(
                'The NotificationModel plugin has 3 vibration patters as example, but you perfectly can create your own patter.'
                    '\n'
                    'The patter is made by a list of big integer, separated between ON and OFF duration in milliseconds.'),
            const TextNote(
                'A vibration pattern pre-configured in a channel could be updated at any time using the method NotificationModel.setChannel'),

            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(4)),

            /* ******************************************************************** */

            TextDivisor(title: 'Notification Channels'),
            const TextNote(
                'The channel is a category identifier which notifications are pre-configured and organized before sent.'
                    '\n\n'
                    'On Android, since Oreo version, the Notifications channel is mandatory and can be managed by the user on your app config page.\n'
                    'Also channels can only update his title and description. All the other parameters could only be change if you erase the channel and recreates it with a different ID.'
                    'For other devices, such iOS, Notifications channels are emulated and used only as pre-configurations.'),


            /* ******************************************************************** */

            TextDivisor(title: 'LEDs and Colors'),
            const TextNote(
                'The led colors and the default layout color are independent'),
            const TextNote('Some devices need to be locked to activate LED lights.'
                '\n'
                'If that is your case, please delay the Notifications to give to you enough time.'),
            /*CheckButton('Delay notifications for 5 seconds', delayLEDTests,
                onPressed: (value) {
                  setState(() {
                    delayLEDTests = value;
                  });
                }),*/

            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(5)),

            /* ******************************************************************** */

            TextDivisor(title: 'Wake Up Locked Screen Notifications'),
            const TextNote(
                'Wake Up Locked Screen notifications are notifications that can wake up the device screen to call the user attention, if the device is on lock screen.\n\n'
                    'To enable this feature on Android, is necessary to add the WAKE_LOCK permission into your AndroidManifest.xml file. For iOS, this is the default behavior for high priority channels.'),
            //SecondsSlider(steps: 11, onChanged: (newValue){ setState(() => _secondsToWakeUp = newValue ); }),
            SimpleButton('Schedule Notifications with wake up locked screen option',
                onPressed: () => NotificationUtils.scheduleNotificationWithWakeUp(27, _secondsToWakeUp.toInt())),
            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(27)),

            /* ******************************************************************** */

            TextDivisor(title: 'Full Screen Intent Notifications'),
            const TextNote(
                'Full-Screen Intents are notifications that can launch in full-screen mode. They are indicate since Android 9 to receiving calls and alarm features.\n\n'
                    'To enable this feature on Android, is necessary to add the USE_FULL_SCREEN_INTENT permission into your AndroidManifest.xml file and explicity request the user permission since Android 11. For iOS, this option has no effect.'),
            SimpleButton('Schedule Notifications with full screen locked screen option',
                onPressed: () => NotificationUtils.scheduleFullScrenNotification(27)),
            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(27)),

            /* ******************************************************************** */

            TextDivisor(title: 'Notification Sound'),
            SimpleButton('Show Notifications with custom sound',
                onPressed: () => NotificationUtils.showCustomSoundNotification(6)),
            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(6)),

            /* ******************************************************************** */

            TextDivisor(title: 'Silenced Notifications'),
            SimpleButton('Show Notifications with no sound',
                onPressed: () => NotificationUtils.showNotificationWithNoSound(7)),
            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(7)),


            SimpleButton(
                'Dismiss the displayed scheduled notifications without cancel the respective schedules',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.dismissNotificationsByChannelKey('scheduled')),
            SimpleButton(
                'Cancel the active schedules without dismiss the displayed notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelSchedulesByChannelKey('scheduled')),
            SimpleButton('Cancel all schedules and dismiss the respective displayed notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotificationsByChannelKey('scheduled')),

            /* ******************************************************************** */

            TextDivisor(title: 'Get Next Schedule Date'),
            const TextNote(
                'This is a simple example to show how to query the next valid schedule date. The date components follow the ISO 8601 standard.'),
            SimpleButton('Get next Monday after date', onPressed: () async {
              DateTime? referenceDate =
              await pickScheduleDate(context, isUtc: false);

              NotificationSchedule schedule = NotificationCalendar(
                  weekday: DateTime.monday, hour: 0, minute: 0, second: 0,
                  timeZone: AwesomeNotifications.localTimeZoneIdentifier);
              //NotificationCalendar.fromDate(date: expectedDate);

              DateTime? nextValidDate = await AwesomeNotifications()
                  .getNextDate(schedule, fixedDate: referenceDate);

              late String response;
              if (nextValidDate == null) {
                response = 'There is no more valid date for this schedule';
              } else {
                response = AwesomeDateUtils.parseDateToString(nextValidDate.toUtc(),
                    format: 'dd/MM/yyyy')!;
              }

              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Next valid schedule"),
                    content: SizedBox(
                        height: 50, child: Center(child: Text(response))),
                    actions: [
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop(null);
                        },
                      )
                    ],
                  ));
            }),

            /* ******************************************************************** */

            TextDivisor(title: 'Media Player'),
            const TextNote(
                'The media player its just emulated and was built to help me to check if the Notifications media control contemplates the dev demands, such as sync state, etc.'
                    '\n\n'
                    'The layout itself was built just for fun, you can use it as you wish for.'
                    '\n\n'
                    'ATTENTION: There is no media reproducing in any place, its just a Timer to pretend a time passing.'),
            SimpleButton('Show media player',
                onPressed: () =>
                    Navigator.pushNamed(context, "PAGE_MEDIA_DETAILS")),
            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(100)),

            /* ******************************************************************** */

            TextDivisor(title: 'Progress Notifications'),

            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(9)),

            /* ******************************************************************** */

            TextDivisor(title: 'Inbox Notifications'),

            SimpleButton('Cancel Notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotification(10)),

            /* ******************************************************************** */

            TextDivisor(title: 'Messaging Notifications'),

            SimpleButton('Cancel Chat Notifications by group key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotificationsByGroupKey('jhonny_group')),

            /* ******************************************************************** */

            TextDivisor(title: 'Grouped Notifications'),

            SimpleButton('Cancel grouped notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.dismissNotificationsByChannelKey('grouped')),

            /* ******************************************************************** */
            TextDivisor(),
            SimpleButton('Dismiss all notifications by channel key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.dismissNotificationsByChannelKey('scheduled')),
            SimpleButton('Dismiss all notifications by group key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.dismissNotificationsByGroupKey('grouped')),
            SimpleButton('Cancel all schedules by channel key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelSchedulesByChannelKey('scheduled')),
            SimpleButton('Cancel all schedules by group key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelSchedulesByGroupKey('grouped')),
            SimpleButton('Cancel all notifications by channel key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotificationsByChannelKey('scheduled')),
            SimpleButton('Cancel all notifications by group key',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: () => NotificationUtils.cancelNotificationsByGroupKey('grouped')),
            const SimpleButton('Dismiss all notifications',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: NotificationUtils.dismissAllNotifications),
            const SimpleButton('Cancel all active schedules',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: NotificationUtils.cancelAllSchedules),
            const SimpleButton('Cancel all notifications and schedules',
                backgroundColor: Colors.red,
                labelColor: Colors.white,
                onPressed: NotificationUtils.cancelAllNotifications),
          ],
        ));
  }
}

class PermissionIndicator extends StatelessWidget {
  const PermissionIndicator({
    Key? key,
    required this.name,
    required this.allowed
  }) : super(key: key);

  final String? name;
  final bool allowed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 125,
      child: Column(
        children: [
          (name != null) ? Text('${name!}:', textAlign: TextAlign.center) : const SizedBox(),
          Text(allowed ? 'Allowed' : 'Not allowed',
              style: TextStyle(
                  color: allowed
                      ? Colors.green
                      : Colors.red)),
          LedLight(allowed)
        ],
      ),
    );
  }
}