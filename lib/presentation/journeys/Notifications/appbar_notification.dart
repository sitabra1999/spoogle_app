import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

PreferredSizeWidget appBarNotification (BuildContext context,  Function() onTapOnPositiveBtn){
  return AppBar(
    centerTitle: false,
    elevation: 1,
    title: const Text(
      'Notification', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    backgroundColor: AppColor.white,
    leading: GestureDetector(
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.black,
        size: 22,
      ),
      onTap: (){
        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: const Icon(
            Icons.clear_all,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            onTapOnPositiveBtn();
          },
        ),
      ),
    ],
  );
}