import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Auth/LoginScreen.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/TranslationConstants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/constants/route_constants.dart';
import '../../data/data_sources/data_source_shared_preferences.dart';
import '../themes/app_color.dart';
import 'AppContents/edge_alerts/edge_alerts.dart';

class PopupBtn extends StatelessWidget {
  const PopupBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.only(right: 12.0),
      color: AppColor.bgColor,
      icon: const Icon(
        Icons.format_list_bulleted_sharp,
        size: 25,
        color: Colors.black87,
      ),
      itemBuilder: (context) => [
         PopupMenuItem(
          value: 0,
          child: Text( !kIsWeb? TranslationConstants.home.t(context): TranslationConstants.scanner.t(context),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
         PopupMenuItem(
          value: 1,
          child: Text(TranslationConstants.profile.t(context),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
         PopupMenuItem(
          value: 2,
          child: Text(TranslationConstants.setting.t(context),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),

        if (!kIsWeb)
          PopupMenuItem(
            value: 3,
            child: Text(TranslationConstants.logout.t(context),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
      ],

      onSelected: (value) {
        //debugPrint('---- Pop up item: $value');
        switch(value.toString()){
          case '0':
            Navigator.pushNamed(context, RouteList.homeScreen);
            break;

          case '1':
            !kIsWeb? Navigator.pushNamed(context, RouteList.profile):
            showAlert(context, TranslationConstants.profile.t(context));
            break;

          case '2':
            !kIsWeb? Navigator.pushNamed(context, RouteList.appSetting):
            showAlert(context, TranslationConstants.setting.t(context));
            break;

          case '3':
            AppSharedPreferences().removeUserSfData();
            openScreenWithoutBack(context, const LoginScreen());
            break;
        }
      },
    );
  }

  void showAlert(BuildContext context, String title){
    edgeAlert(context, title: AppMessages.message.toLowerCase(),
        description: "$title ${TranslationConstants.allFeatureAvailOnMob.t(context)}",
    );
  }
}
