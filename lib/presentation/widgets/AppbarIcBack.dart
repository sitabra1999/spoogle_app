import 'package:flutter/material.dart';

import '../themes/app_color.dart';

PreferredSizeWidget appBarIcBack ({required BuildContext context, required String text, required Color bgColor,
  required bool isCenterTitle}){
  return AppBar(
    elevation: 0,
    centerTitle: isCenterTitle,
    title: Text(
      text, style: const TextStyle(color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w500),
    ),
    backgroundColor: bgColor,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.black,
        size: 18,
      ),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
  );
}