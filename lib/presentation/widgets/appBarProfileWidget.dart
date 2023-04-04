import 'package:flutter_spoogle_app/common/constants/route_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/PopupButton.dart';
import 'package:flutter_spoogle_app/presentation/widgets/IcTxtRow.dart';
import 'package:flutter/material.dart';

import '../../common/extensions/CommonFun.dart';
import '../libraries/Languages/TranslationConstants.dart';
import '../themes/app_color.dart';
import 'AppDialog.dart';

PreferredSizeWidget appBarProfile(BuildContext context, String text, Function(String menuItem) onTapOnPopUp,) {
  return AppBar(
    toolbarHeight: 65,
    centerTitle: true,
    elevation: 0,
    //title: Image.asset('assets/icons/ic_png/app_logo.png', width: 160, height: 100,),
    title: Text(
      TranslationConstants.myProfile.t(context).toUpperCase(),
      textAlign: TextAlign.left,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black,),
    ),
    backgroundColor: AppColor.bgColor,
    automaticallyImplyLeading: false,
    leading: GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 22,
        ),
      ),
      onTap: (){
        Navigator.pop(context);
      },
    ),

   /* actions: [
      *//*IconButton(
        padding: const EdgeInsets.only(right: 8.0),
        icon: const Icon(
          Icons.search,
          size: 25,
          color: Colors.black87,
        ),
        onPressed: () {},
      ),*//*

      PopupMenuButton(
        padding: const EdgeInsets.only(right: 12.0),
        color: AppColor.bgColor,
        icon: const Icon(
          Icons.more_vert_rounded,
          size: 25,
          color: Colors.black87,
        ),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 0,
            child: IcTxtRow(txt: "Logout", txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.normal,
              icon: Icons.logout, icSize: 22, icColor: Colors.black, isCenter: false,
            ),
          ),
          const PopupMenuItem(
            value: 1,
            child: IcTxtRow(txt: "Delete Account", txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.normal,
              icon: Icons.delete_outline_rounded, icSize: 22, icColor: Colors.black, isCenter: false,
            ),
          ),
        ],

        onSelected: (value) {
          debugPrint('---- Pop up item: $value');
          switch(value.toString()){
            case '0':
              showIosDialog(
                  context,
                  'LOGOUT ?', "Are you sure you want to logout?",
                  'Cancel',
                  'Logout', (){
                // Navigator.of(context).pushReplacementNamed(RouteList.login);
                // AppSharedPreferences().clearPreferenceData();
              }
              );
              break;

            case '1':
              openDeleteDialog(context);
              break;
          }
        },
      )
    ],*/
  );
}

void openDeleteDialog(BuildContext context) {
  showDialog(context: context, builder: (BuildContext context) => AppDialog(
    title: TranslationConstants.deleteAc.t(context),
    description: TranslationConstants.deleteAcDialogContent.t(context),
    isBtn1Visible: true,
    button1Text: TranslationConstants.cancel.t(context),
    button2Text: TranslationConstants.delete.t(context),
    onPositiveBtnPressed: (){
      Navigator.pop(context);
    },
  ),
  );
}
