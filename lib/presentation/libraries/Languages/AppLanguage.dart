import 'package:flutter/material.dart';
import 'LanguageLocalDataSource.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    String? lang = await LanguageLocalDataSource().getPreferredLanguage();
    debugPrint('----fetchLocale locale: $lang');
    _appLocale = Locale(lang!);
    notifyListeners();
  }


  void changeLanguage(Locale locale) async {
    debugPrint('----changeLanguage locale: ${locale.languageCode}');
    if (_appLocale == locale) {
      return;
    }
    if (locale == const Locale("hi")) {
      _appLocale = const Locale("hi");
      LanguageLocalDataSource().updateLanguage('hi');
    } else {
      _appLocale = const Locale("en");
      LanguageLocalDataSource().updateLanguage('en');
    }
    notifyListeners();
  }
}