import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme{
  const AppTheme._();

  static InputDecorationTheme inputDecorationTheme(){
    return  const InputDecorationTheme(
      counterStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      // errorText: "Error",   //'Error message',
      floatingLabelStyle: TextStyle(color: AppColor.labelColor, fontSize: 16),
      hintStyle: TextStyle(color: AppColor.hintColor, fontSize: 13),
      //errorStyle: TextStyle(color: AppColor.hintColor),
      filled: true,
      fillColor: Colors.white,
      iconColor: Colors.black,
      prefixIconColor: Colors.black,
      suffixIconColor: Colors.black,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.black87, width: 1),
      ),
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.blue, width: 1),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    );
  }
}