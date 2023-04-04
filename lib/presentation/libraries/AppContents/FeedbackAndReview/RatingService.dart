import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const KEY = 'FIRST_TIME_OPEN';

class RatingService {
  late SharedPreferences _prefs;

  Future<bool> isSecondTimeOpen() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      dynamic isSecondTime = _prefs.getBool(KEY) as bool;
      if (isSecondTime != null && !isSecondTime) {
        _prefs.setBool(KEY, false);
        return false;
      } else if (isSecondTime != null && isSecondTime) {
        _prefs.setBool(KEY, false);
        return true;
      } else {
        _prefs.setBool(KEY, true);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> showRating() async {
    try {
      final InAppReview inAppReview = InAppReview.instance;
      final available = await inAppReview.isAvailable();
      print('----inAppReview available: ${available}');
      if (available) {
        inAppReview.requestReview();
      } else {
        inAppReview.openStoreListing(
          appStoreId: 'come.dreamnext.codebell',
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  void openStore() async {
    try {
      final InAppReview inAppReview = InAppReview.instance;
      inAppReview.openStoreListing(
        appStoreId: 'come.dreamnext.codebell',
        microsoftStoreId: 'come.dreamnext.codebell',
      );
    } catch (e) {
      debugPrint('---- : $e');
    }
  }
}