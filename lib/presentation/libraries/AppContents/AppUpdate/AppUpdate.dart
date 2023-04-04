import 'dart:io';

import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

import 'Dialog/flutter_update_dialog.dart';

class AppUpdate {
  UpdateDialog? dialog;

  Future<void> lookForAppUpdate(BuildContext? context) async {
    // Instantiate NewVersion manager object (Using GCP Console app as example).
    // This package check if app has new version available on app/play store by giving application id for android and bundle id for iOS
    final newVersion = NewVersion(
      iOSId: 'com.trans.twentythree',
      androidId: 'com.trans.twentythree',
    );

    final status = await newVersion.getVersionStatus();
    if (status != null && status.canUpdate) {
      //debugPrint(status.releaseNotes);
      //debugPrint(status.appStoreLink);
      //debugPrint(status.localVersion);
      //debugPrint(status.storeVersion);
      //debugPrint(status.canUpdate.toString());

      if (dialog != null && dialog!.isShowing()) {
        return;
      }
      dialog = UpdateDialog.showUpdate(
        context!,
        width: 260,
        title: "UPDATE AVAILABLE",
        updateContent: "Current version: ${status.localVersion}\nNew version: ${status.storeVersion}\n\n${AppMessages.updateDescTxt}",
        titleTextSize: 14,
        contentTextSize: 12,
        buttonTextSize: 12,
        topImage: Image.asset('assets/images/update_bg_app_top.png'),
        extraHeight: 3,
        radius: 6,
        themeColor: Colors.red,
        progressBackgroundColor: const Color(0x5AFFAC5D),
        isForce: false,
        updateButtonText: 'UPDATE',
        ignoreButtonText: 'MAYBE LATER',
        enableIgnore: true,
        onIgnore: () {
          //ToastUtils.waring('----');
          dialog!.dismiss();
        }, onUpdate: (){
        launchInBrowser(
            Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=com.dreamnext.codebell'
                : 'https://apps.apple.com/us/app/code-bell/id1598323998');
      },
      );
    }
  }

  void onUpdate() {
    /*
    double progress = 0.0;
    Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      progress = progress + 0.02;
      if (progress > 1.0001) {
        timer.cancel();
        dialog!.dismiss();
        progress = 0;
      } else {
        dialog!.update(progress);
      }
    });*/

    launchInBrowser('com.dreamnext.codebell');
  }
}