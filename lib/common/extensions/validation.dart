
import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter/material.dart';

import '../../presentation/libraries/Languages/TranslationConstants.dart';

String? validateEmptyString(String value) {
  if (value.isEmpty) {
    return "Field is required!";
  }
  return null;
}

String validateEmptyDouble(double value) {
  if (value == 0) {
    return "Field is required!";
  }
  return '';
}

String? validateName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validateMobile(String value) {
  if (value.isEmpty) {
    return "Mobile number is Required";
  } else if (value.length < 7) {
    return "Please enter valid mobile number";
  }
  return null;
}

String? validateMobileNumWithRgx(String value) {
  String patterns = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patterns);
  if (value.isEmpty) {
    return AppMessages.mobRequired;
  } else if (!regExp.hasMatch(value)) {
    return AppMessages.enterValidMobNo;
  }
  return null;
}

String? validateZipCode(String value) {
  if (value.isEmpty) {
    return "Zip code is required";
  } else if (value.length < 5) {
    return "Please enter valid zip code";
  }
  return null;
}

String? validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "Email is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid Email";
  } else {
    return null;
  }
}

bool isValidateEmailId(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    //"Email is Required"
    return false;
  } else if (!regExp.hasMatch(value)) {
    //"Invalid Email"
    return false;
  } else {
    //"Valid Email";
    return true;
  }
}

String? validatePass(String value) {
  if (value.isEmpty) {
    return 'Password is Required';
  }
  return null;
}