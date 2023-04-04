import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/ButtonOutlined.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationDialogs{
  static Future<bool> requestBasicPermissionToSendNotifications(BuildContext context) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if(!isAllowed){
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xfffbfbfb),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    padding: const EdgeInsets.only(left: 34, bottom: 12),
                    icon: const Icon(Icons.close, color: Colors.black38, size: 23,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),

                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(3, 0, 3, 12),
                  child: Lottie.asset('assets/animations/Notifications-permission.json',
                    fit: BoxFit.cover,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 18.0, bottom: 26),
                  child: Text( AppMessages.requireNotificationPermissionTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black,)),
                ),

                const Text(
                  AppMessages.requireBasicNotificationPermissionDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),

                //Turn on notification
                ButtonOutlined(text: 'Turn on Notifications', height: 35, width: 230, bgColor: Colors.white, onPressed: () async {
                  isAllowed = await AwesomeNotifications().requestPermissionToSendNotifications();
                  Navigator.pop(context);
                }, txtColor: AppColor.black,),

                TextButton(
                    onPressed: (){ Navigator.pop(context); },
                    child: const Text(
                      "Not Now",
                      style: TextStyle(color: Colors.black38, fontSize: 13),
                    )
                ),
              ],
            ),
          )
      );
    }
    return isAllowed;
  }


  static Future<List<NotificationPermission>> lockedPermissionDialog(BuildContext context, String? channelKey, List<NotificationPermission> lockedPermissions) async {
    List<NotificationPermission> permissionsAllowed = [];
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xfffbfbfb),
          titlePadding: const EdgeInsets.only(top: 45),
          title: const Text('Notifications\nneeds your permission',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/animations/Notifications-permission.json',
                fit: BoxFit.cover,
              ),

              Text('To proceed, you need to enable the permissions above${channelKey?.isEmpty ?? true ? '' : ' on channel $channelKey'}:',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                lockedPermissions.join(', ').replaceAll('NotificationPermission.', ''),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: (){ Navigator.pop(context); },
                child: const Text(
                  'Deny',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                )
            ),
            TextButton(
              onPressed: () async {
                // Request the permission through native resources. Only one page redirection is done at this point.
                await AwesomeNotifications().requestPermissionToSendNotifications(
                    channelKey: channelKey,
                    permissions: lockedPermissions
                );

                // After the user come back, check if the permissions has successfully enabled
                permissionsAllowed = await AwesomeNotifications().checkPermissionList(
                    channelKey: channelKey,
                    permissions: lockedPermissions
                );

                Navigator.pop(context);
              },
              child: const Text(
                'Allow    ',
                style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
    ),
    );

    return permissionsAllowed;
  }
}