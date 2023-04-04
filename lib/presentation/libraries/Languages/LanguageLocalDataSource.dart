import 'package:shared_preferences/shared_preferences.dart';

class LanguageLocalDataSource {
  SharedPreferences? _preferences;

  void updateLanguage(String languageCode) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.setString("languageCode", languageCode);
  }

  Future<String?> getPreferredLanguage() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.containsKey("languageCode")) {
      String? value = _preferences!.getString("languageCode");
      return value?? 'en';
    }
    else {
      return "en";
    }
  }
}

