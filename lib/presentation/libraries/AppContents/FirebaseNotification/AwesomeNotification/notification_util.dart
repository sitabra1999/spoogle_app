import 'dart:math';

import 'package:awesome_notifications/android_foreground_service.dart';
// TO AVOID CONFLICT WITH MATERIAL DATE UTILS CLASS
import 'package:awesome_notifications/awesome_notifications.dart'
    hide AwesomeDateUtils;
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_functions.dart';
import 'notification_dialogs.dart';

/* *********************************************
    LARGE TEXT FOR OUR NOTIFICATIONS TESTS
************************************************ */

String lorenIpsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut '
    'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip '
    'ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat '
    'nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit'
    'anim id est laborum';

Future<void> externalUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

int createUniqueID(int maxValue){
  Random random = new Random();
  return random.nextInt(maxValue);
}

/* *********************************************
    PERMISSIONS
************************************************ */

class NotificationUtils {

  static Future<bool> redirectToPermissionsPage() async {
    await AwesomeNotifications().showNotificationConfigPage();
    return await AwesomeNotifications().isNotificationAllowed();
  }
  
  static Future<void> redirectToBasicChannelPage() async {
    await AwesomeNotifications().showNotificationConfigPage(channelKey: 'basic_channel');
  }

  static Future<List<NotificationPermission>> requestUserPermissions(
      BuildContext context,{
      // if you only intends to request the permissions until app level, set the channelKey value to null
      required String? channelKey,
      required List<NotificationPermission> permissionList}
    ) async {

    // Check if the basic permission was conceived by the user
    if(!await NotificationDialogs.requestBasicPermissionToSendNotifications(context)) {
      return [];
    }

    // Check which of the permissions you need are allowed at this time
    List<NotificationPermission> permissionsAllowed = await AwesomeNotifications().checkPermissionList(
        channelKey: channelKey,
        permissions: permissionList
    );

    // If all permissions are allowed, there is nothing to do
    if(permissionsAllowed.length == permissionList.length) {
      return permissionsAllowed;
    }

    // Refresh the permission list with only the disallowed permissions
    List<NotificationPermission> permissionsNeeded =
      permissionList.toSet().difference(permissionsAllowed.toSet()).toList();

    // Check if some of the permissions needed request user's intervention to be enabled
    List<NotificationPermission> lockedPermissions = await AwesomeNotifications().shouldShowRationaleToRequest(
        channelKey: channelKey,
        permissions: permissionsNeeded
    );

    // If there is no permitions depending of user's intervention, so request it directly
    if(lockedPermissions.isEmpty){

      // Request the permission through native resources.
      await AwesomeNotifications().requestPermissionToSendNotifications(
          channelKey: channelKey,
          permissions: permissionsNeeded
      );

      // After the user come back, check if the permissions has successfully enabled
      permissionsAllowed = await AwesomeNotifications().checkPermissionList(
          channelKey: channelKey,
          permissions: permissionsNeeded
      );
    } else {
      // If you need to show a rationale to educate the user to conceed the permission, show it
      NotificationDialogs.lockedPermissionDialog(context , channelKey, lockedPermissions).then((value){
        permissionsAllowed = value;
      });
    }

    // Return the updated list of allowed permissions
    return permissionsAllowed;
  }

  static Future<bool> requestCriticalAlertsPermission(BuildContext context) async {

    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.CriticalAlert
    ];

    List<NotificationPermission> permissionsAllowed =
    await requestUserPermissions(
        context,
        channelKey: null,
        permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  static Future<bool> requestFullIntentPermission(BuildContext context) async {

    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.CriticalAlert
    ];

    List<NotificationPermission> permissionsAllowed =
    await requestUserPermissions(
        context,
        channelKey: null,
        permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  static Future<bool> requestPreciseAlarmPermission(BuildContext context) async {

    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.PreciseAlarms
    ];

    List<NotificationPermission> permissionsAllowed =
    await requestUserPermissions(
        context,
        channelKey: null,
        permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  static Future<bool> requestOverrideDndPermission(BuildContext context) async {

    List<NotificationPermission> requestedPermissions = [
      NotificationPermission.OverrideDnD
    ];

    List<NotificationPermission> permissionsAllowed =
    await requestUserPermissions(
        context,
        channelKey: null,
        permissionList: requestedPermissions);

    return permissionsAllowed.isNotEmpty;
  }

  /* *********************************************
      BASIC NOTIFICATIONS
  ************************************************ */
  
  static Future<void> showBasicNotification(int id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
        customSound: 'resource://raw/res_morph_power_rangers'
      )
    );
  }

  
  /* *********************************************
      ACTION BUTTONS NOTIFICATIONS
  ************************************************ */

  static Future<void> showNotificationWithActionButtonsForCall({required String callerName, required String callerImg, required Map<String, String> payload}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: getRandomNumberInRange(),
            channelKey: 'basic_channel',
            title: 'Incoming Call',
            body: callerName,
            icon: 'resource://drawable/ic_notification',
            largeIcon: callerImg,
            //largeIcon: 'asset://assets/icons/ic_png/app_logo_without_txt.png',
            bigPicture: callerImg,
            roundedLargeIcon: true,
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            //category: NotificationCategory.Call,
            //criticalAlert: true,
            displayOnForeground: true,
            displayOnBackground: true,
            payload: payload),
        actionButtons: [
          NotificationActionButton(
              key: 'ACCEPT',
              label: 'ACCEPT ',
              color: Colors.green,
              autoDismissible: false
          ),
          NotificationActionButton(
              key: 'REJECT',
              label: 'REJECT',
              isDangerousOption: false,
              autoDismissible: false
          ),
          NotificationActionButton(
              key: 'VIEW',
              label: 'VIEW ',
              color: Colors.green,
              autoDismissible: false
          ),
        ]);
  }


  /* *********************************************
      NOTIFICATION'S SPECIAL CATEGORIES
  ************************************************ */

  static Future<void> showCallNotification(int id) async {
    AndroidForegroundService.startForeground(
    //await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'call_channel',
            title: 'Incoming Call',
            body: 'from Little Mary',
            category: NotificationCategory.Call,
            largeIcon: 'asset://assets/icons/ic_png/app_logo_without_txt.png',
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            payload: {
              'username': 'Little Mary'
            }
        ),
        actionButtons: [
          NotificationActionButton(
              key: 'ACCEPT',
              label: 'Accept',
              color: Colors.green,
              autoDismissible: true
          ),
          NotificationActionButton(
              key: 'REJECT',
              label: 'Reject',
              isDangerousOption: true,
              autoDismissible: true
          ),
        ]
    );
  }

  static Future<void> showMissedCallNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: "Strings.peerId",
            body: 'Missed video call',
            largeIcon: 'asset://assets/icons/ic_png/missed-call.png',
            wakeUpScreen: true,
            autoDismissible: true,
            payload: {'uuid': 'user-profile-uuid'}),
       /* actionButtons: [
          NotificationActionButton(
            key: 'MissedCall',
            label: 'Call Back',
            autoDismissible: true,
          )
        ]*/
    );
  }
  
  static Future<void> startForegroundServiceNotification() async {
    await AndroidForegroundService.startForeground(
        content: NotificationContent(
            id: 2341234,
            body: 'Service is running!',
            title: 'Android Foreground Service',
            channelKey: 'basic_channel',
            bigPicture: 'asset://assets/icons/ic_png/app_logo.png',
            notificationLayout: NotificationLayout.BigPicture,
            category: NotificationCategory.Service
        ),
        actionButtons: [
          NotificationActionButton(
              key: 'SHOW_SERVICE_DETAILS',
              label: 'Show details'
          )
        ]
    );
  }
  
  static Future<void> stopForegroundServiceNotification() async {
    await AndroidForegroundService.stopForeground();
  }
  
  /* *********************************************
      CUSTOM SOUND NOTIFICATIONS
  ************************************************ */
  
  static Future<void> showCustomSoundNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "custom_sound",
            title: 'It\'s time to morph!',
            body: 'It\'s time to go save the world!',
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture: 'asset://assets/icons/ic_png/app_logo.png',
            largeIcon: 'asset://assets/icons/ic_png/app_logo_without_txt.png',
            color: Colors.yellow,
            payload: {
          'secret': 'the green ranger and the white ranger are the same person'
        }));
  }
  
  /* *********************************************
      WAKE UP LOCK SCREEN NOTIFICATIONS
  ************************************************ */
  
  static Future<void> scheduleNotificationWithWakeUp(int id, int seconds) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Hey! Wake up!!',
            body: 'Its time to wake up!',
            wakeUpScreen: true,
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture: 'asset://assets/icons/ic_png/app_logo.png',
            color: Colors.blueGrey,
            category: NotificationCategory.Alarm,
        ),
        schedule: NotificationInterval(interval: seconds, preciseAlarm: true));
  }
  
  /* *********************************************
      FULL SCREEEN INTENT NOTIFICATIONS
  ************************************************ */
  
  static Future<void> scheduleFullScrenNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: 'scheduled',
          title: 'Hey! Wake up!!',
          body: 'Its time to wake up!',
          fullScreenIntent: true,
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/images/melted-clock.png',
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationInterval(interval: 5, preciseAlarm: true));
  }
  
  /* *********************************************
      SILENCED NOTIFICATIONS
  ************************************************ */
  
  static Future<void> showNotificationWithNoSound(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "silenced",
            title: 'Silence, please!',
            body: 'Shhhhhh!!!',
            notificationLayout: NotificationLayout.BigPicture,
            bigPicture:
            'https://image.freepik.com/fotos-gratis/medico-serio-mostrando-o-gesto-de-silencio_1262-17188.jpg',
            color: Colors.blueGrey,
            payload: {'advice': 'shhhhhhh'}));
  }
  
  /* *********************************************
      BIG PICTURE NOTIFICATIONS
  ************************************************ */
  
  static Future<void> showBigPictureNetworkNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 11,
            channelKey: 'big_picture',
            title: 'Big picture (Network)',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            bigPicture: 'https://media.wired.com/photos/598e35994ab8482c0d6946e0/master/w_2560%2Cc_limit/phonepicutres-TA.jpg',
            notificationLayout: NotificationLayout.BigPicture));
  }
  
  static Future<void> showBigPictureAssetNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big picture (Asset)',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            bigPicture: 'asset://assets/icons/ic_png/app_logo.png',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'uuid': 'uuid-test'}));
  }
  
  /// Just to simulates a file already saved inside device storage
  static Future<void> showBigPictureFileNotification(int id) async {
    String newFilePath = await downloadAndSaveImageOnDisk(
        'https://images.freeimages.com/images/large-previews/be7/puppy-2-1456421.jpg',
        'newTestImage.jpg');
  
    //String newFilePath = await saveImageOnDisk(AssetImage('assets/images/happy-dogs.jpg'),'newTestImage.jpg');
    newFilePath = newFilePath.replaceFirst('/', '');
    String finalFilePath = 'file://$newFilePath';
  
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big picture (File)',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            bigPicture: finalFilePath,
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'uuid': 'uuid-test'}));
  }
  
  static Future<void> showBigPictureResourceNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big picture (Resource)',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            bigPicture: 'resource://drawable/res_mansion',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'uuid': 'uuid-test'}));
  }
  
  static Future<void> showLargeIconNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big picture title',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            largeIcon:
                'https://image.freepik.com/vetores-gratis/modelo-de-logotipo-de-restaurante-retro_23-2148451519.jpg',
            roundedLargeIcon: true,
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'uuid': 'uuid-test'}));
  }
  
  static Future<void> showBigPictureAndLargeIconNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big <b>BIG</b> picture title',
            summary: 'Summary <i>text</i>',
            body: '$lorenIpsumText<br><br>$lorenIpsumText<br><br>$lorenIpsumText',
            largeIcon:
                'https://image.freepik.com/vetores-gratis/modelo-de-logotipo-de-restaurante-retro_23-2148451519.jpg',
            bigPicture: 'https://media-cdn.tripadvisor.com/media/photo-s/15/dd/20/61/al-punto.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'uuid': 'uuid-test'}));
  }
  
  static Future<void> showBigPictureNotificationActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big <b>BIG</b> picture title',
            summary: 'Summary <i>text</i>',
            body: '$lorenIpsumText<br><br>$lorenIpsumText<br><br>$lorenIpsumText',
            largeIcon:
                'https://image.freepik.com/vetores-gratis/modelo-de-logotipo-de-restaurante-retro_23-2148451519.jpg',
            bigPicture: 'https://media-cdn.tripadvisor.com/media/photo-s/15/dd/20/61/al-punto.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            color: Colors.indigoAccent,
            payload: {'uuid': 'uuid-test'}),
        actionButtons: [
          NotificationActionButton(
              key: 'READ', label: 'Mark as read', autoDismissible: true),
          NotificationActionButton(
              key: 'REMEMBER', label: 'Remember-me later', autoDismissible: false)
        ]);
  }
  
  static Future<void> showBigPictureNotificationActionButtonsAndReply(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            title: 'Big <b>BIG</b> picture title',
            summary: 'Summary <i>text</i>',
            category: NotificationCategory.Promo,
            body: '$lorenIpsumText<br><br>$lorenIpsumText<br><br>$lorenIpsumText',
            largeIcon:
                'https://image.freepik.com/vetores-gratis/modelo-de-logotipo-de-restaurante-retro_23-2148451519.jpg',
            bigPicture: 'https://media-cdn.tripadvisor.com/media/photo-s/15/dd/20/61/al-punto.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            color: Colors.indigoAccent,
            payload: {'uuid': 'uuid-test'}),
        actionButtons: [
          NotificationActionButton(
              key: 'REPLY',
              label: 'Reply',
              autoDismissible: true,
              buttonType: ActionButtonType.InputField),
          NotificationActionButton(
              key: 'REMEMBER', label: 'Remember-me later', autoDismissible: true)
        ]);
  }
  
  static Future<void> showBigPictureNotificationHideExpandedLargeIcon(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_picture",
            category: NotificationCategory.Promo,
            title: 'Big <b>BIG</b> picture title',
            summary: 'Summary <i>text</i>',
            body: '$lorenIpsumText<br><br>$lorenIpsumText<br><br>$lorenIpsumText',
            hideLargeIconOnExpand: true,
            largeIcon:
                'https://img.itdg.com.br/tdg/images/blog/uploads/2019/05/hamburguer.jpg',
            bigPicture: 'https://img.itdg.com.br/tdg/images/blog/uploads/2019/05/hamburguer.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            color: Colors.indigoAccent,
            payload: {'uuid': 'uuid-test'}));
  }
  
  /* *********************************************
      BIG TEXT NOTIFICATIONS
  ************************************************ */
  
  static Future<void> showBigTextNotification(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_text",
            title: 'Big text title',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            notificationLayout: NotificationLayout.BigText,
            payload: {'uuid': 'uuid-test'}));
  }
  
  static Future<void> showBigTextNotificationWithDifferentSummary(int id) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: "big_text",
            title: 'Big text title',
            summary: 'Notification summary loren ipsum',
            body: '$lorenIpsumText\n\n$lorenIpsumText\n\n$lorenIpsumText',
            notificationLayout: NotificationLayout.BigText,
            payload: {'uuid': 'uuid-test'}));
  }

  static Future<void> removeChannel() async {
    AwesomeNotifications().removeChannel('updated_channel');
  }

  static Future<void> dismissNotification(int id) async {
    await AwesomeNotifications().dismiss(id);
  }

  static Future<void> cancelSchedule(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }
  
  static Future<void> cancelNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }
  
  static Future<void> dismissNotificationsByChannelKey(String channelKey) async {
    await AwesomeNotifications().dismissNotificationsByChannelKey(channelKey);
  }
  
  static Future<void> dismissNotificationsByGroupKey(String groupKey) async {
    await AwesomeNotifications().dismissNotificationsByGroupKey(groupKey);
  }
  
  static Future<void> cancelSchedulesByChannelKey(String channelKey) async {
    await AwesomeNotifications().cancelSchedulesByChannelKey(channelKey);
  }
  
  static Future<void> cancelSchedulesByGroupKey(String groupKey) async {
    await AwesomeNotifications().cancelSchedulesByGroupKey(groupKey);
  }
  
  static Future<void> cancelNotificationsByChannelKey(String channelKey) async {
    await AwesomeNotifications().cancelNotificationsByChannelKey(channelKey);
  }
  
  static Future<void> cancelNotificationsByGroupKey(String groupKey) async {
    await AwesomeNotifications().cancelNotificationsByGroupKey(groupKey);
  }

  static Future<void> dismissAllNotifications() async {
    await AwesomeNotifications().dismissAllNotifications();
  }

  static Future<void> cancelAllSchedules() async {
    await AwesomeNotifications().cancelAllSchedules();
  }
  
  static Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
  
  String toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }

}