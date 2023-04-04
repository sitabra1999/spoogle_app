import 'dart:convert';
import 'package:flutter_spoogle_app/data/models/AdvertisementApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/HomePage/AllSportsApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/LoginApiResModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/AppModel/CountryModel.dart';
import '../models/AppModel/SettingsPrefModel.dart';

class AppSharedPreferences {
  SharedPreferences? _preferences;

  // Constant.key Name
  saveModelData(dynamic model, String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(model));
  }

  Future<dynamic> getModelData(dynamic model, String key) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(prefs.getString(key)!);
    return model.fromJson(jsonData);
  }


  // Save sports model
  saveSportsModel(dynamic model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('sports', jsonEncode(model));
  }

  Future<AllSportsApiResModel> getSportsModel() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(prefs.getString('sports')!);
    return AllSportsApiResModel.fromJson(jsonData);
  }


  saveUserDetails(model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('UserDetails', jsonEncode(model));
  }

  Future<LoginApiResModel> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(prefs.getString('UserDetails')!);
    return LoginApiResModel.fromJson(jsonData);
  }


  saveAdDetails(model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('AdDetails', jsonEncode(model));
  }

  Future<AdvertisementApiResModel> getAds() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(prefs.getString('AdDetails')!);
    return AdvertisementApiResModel.fromJson(jsonData);
  }

  void saveUserId(String userId) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.setString("UserId", userId);
  }

  Future<String?> getUserId() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.containsKey("UserId")) {
      String? value = _preferences!.getString("UserId");
      return value;
    }
    else {
      return "";
    }
  }

  void saveFirebaseToken(String token) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.setString("token", token);
  }

  Future<String?> getFirebaseToken() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.containsKey("token")) {
      String? value = _preferences!.getString("token");
      return value;
    }
    else {
      return "";
    }
  }



  saveCounty(model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('CountryModel', jsonEncode(model));
  }

  Future<CountryModel> getCounty() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(prefs.getString('CountryModel')!);
    return CountryModel.fromJson(jsonData);
  }


  saveSettingsData(model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('SettingsData', jsonEncode(model));
  }

  Future<SettingsPrefModel> getSettingsData() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> jsonData = jsonDecode(prefs.getString('SettingsData')!);
    return SettingsPrefModel.fromJson(jsonData);
  }

  void saveCartItemCount(int cartItemCount) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.setInt("cartItemCount", cartItemCount);
  }

  Future<int?> getCartItemCount() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.containsKey("cartItemCount")) {
      int? key = _preferences!.getInt("cartItemCount");
      return key;
    }
    else {
      return 0;
    }
  }

  void removeUserSfData() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences?.remove("UserId");
    _preferences?.remove("UserDetails");
  }

  void clearPreferenceData() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.clear();
  }
}
