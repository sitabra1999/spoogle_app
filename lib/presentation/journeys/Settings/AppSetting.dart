import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/BlockedUsersApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/LoginApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/widgets/appBarHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/AppModel/SettingsPrefModel.dart';
import '../../libraries/AppContents/NoDataWidget.dart';
import '../../libraries/AppContents/ProgressLibs/LottieLoading.dart';
import '../../libraries/AppContents/edge_alerts/edge_alerts.dart';
import '../../libraries/Languages/AppLanguage.dart';
import '../../libraries/Languages/TranslationConstants.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  String userId = '';
  String userName = '';

  String langTxt = 'Select Language';
  String ringtoneTxt = 'Select Ringtone';
  String dropdownBlockedUser = '';
  String dropdownRingtone = 'Ringtone 3';
  String ringtoneName = "";
  var _isVibrationEnabled = false;
  var _isRingtoneEnabled = true;
  double ringtoneVolume = 10.0;

  BlockedUsersApiResModel model = BlockedUsersApiResModel();

  late Future<bool> _future;
  late bool isApiDataAvailable = false;
  late AppLanguage appLanguage;

  @override
  void initState() {
    getAppLanguage();
    super.initState();
    _future = getDataFromApi();
  }

  Future<bool> getDataFromApi() async {
    try {

      //ringtoneTxt = TranslationConstants.selectRingtone.t(context);
      //langTxt = TranslationConstants.selectLang.t(context);

      LoginApiResModel loginApiResModel = await AppSharedPreferences().getUserDetails();
      userId = loginApiResModel.response?.userId.toString() ?? "";
      userName = loginApiResModel.response?.name ?? Strings.appName;
      debugPrint('----userId-userName: $userId - $userName');

      Map<String, dynamic> body = {};
      body["user_id"] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.getBlockUsers, body).then((jsonDecodeData) {
        model = BlockedUsersApiResModel.fromJson(jsonDecodeData);
      });

      getSettingsFromPref();

      isApiDataAvailable = true;
    } catch (error) {
      debugPrint("Error: $error");
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarHomeBackArrow(context, '', (menuItem) {}),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.connectionState == ConnectionState.done) {
            if (isApiDataAvailable) {
              return const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                /*child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 22),
                        child: SizedBox(
                          width: getScreenWidth(context),
                          child: Text(
                            TranslationConstants.setting.t(context).toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
                          ),
                        ),
                      ),
                      Text(
                        TranslationConstants.name.t(context),
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                      ),
                      Neumorphic(
                        margin: const EdgeInsets.only(top: 22, bottom: 22),
                        padding: const EdgeInsets.all(16),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          depth: 3,
                          surfaceIntensity: 0.0,
                          lightSource: LightSource.topLeft,
                          shadowLightColor: Colors.white,
                          color: AppColor.bgColor,
                        ),
                        child: SizedBox(
                          width: getScreenWidth(context),
                          child: Text(
                            userName,
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      Text(
                        TranslationConstants.language.t(context),
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                      ),
                      Neumorphic(
                        margin: const EdgeInsets.only(top: 22, bottom: 22),
                        padding: const EdgeInsets.only(left: 24),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          depth: 3,
                          surfaceIntensity: 0.0,
                          lightSource: LightSource.topLeft,
                          shadowLightColor: Colors.white,
                          color: AppColor.bgColor,
                        ),
                        child: TxtIconRow(
                            txt: langTxt,
                            onTap: () {
                              List<String> dataList = [
                                'English',
                                'Hindi',
                              ];
                              List<DialogListModel> dialogListModel = [];
                              for (int i = 0; i < dataList.length; i++) {
                                dialogListModel.add(DialogListModel(
                                  i.toString(),
                                  dataList[i],
                                  dataList[i],
                                ));
                              }
                              showDropDownLisRadioBtn(context, TranslationConstants.language.t(context),
                                  TranslationConstants.ok.t(context).toUpperCase(), dialogListModel, (value, index) {
                                //print('---- Language 1: $value');
                                appLanguage.changeLanguage(Locale(value == 'Hindi' ? "hi" : "en"));
                                SchedulerBinding.instance.addPostFrameCallback((_) {
                                  setState(() {
                                    //debugPrint('----language 2: $value');
                                    langTxt = value;
                                  });
                                });
                              });
                            }),
                      ),
                      Text(
                        TranslationConstants.ringtone.t(context),
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                      ),
                      Neumorphic(
                        margin: const EdgeInsets.only(top: 22, bottom: 22),
                        padding: const EdgeInsets.only(left: 24),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          depth: 3,
                          surfaceIntensity: 0.0,
                          lightSource: LightSource.topLeft,
                          shadowLightColor: Colors.white,
                          color: AppColor.bgColor,
                        ),
                        child: TxtIconRow(
                            txt: ringtoneTxt,
                            onTap: () {
                              List<String> dataList = ['Code Bell phone ringtone'];
                              List<DialogListModel> dialogListModel = [];
                              for (int i = 0; i < dataList.length; i++) {
                                dialogListModel.add(DialogListModel(
                                  i.toString(),
                                  dataList[i],
                                  dataList[i],
                                ));
                              }

                              showDropDownLisRadioBtn(context, TranslationConstants.ringtone.t(context), TranslationConstants.ok.t(context).toUpperCase(), dialogListModel, (value, index) {
                                //print('---- Language 1: $value');
                                setState(() {
                                  ringtoneTxt = value;
                                });
                                saveSettingsInPref();
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22, bottom: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              TranslationConstants.ringtoneVol.t(context),
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                            ),
                            Flexible(
                              child: NeumorphicSlider(
                                  height: 17,
                                  value: ringtoneVolume,
                                  min: 0,
                                  max: 10,
                                  style: SliderStyle(
                                      depth: 5,
                                      accent: Colors.orange,
                                      variant: Colors.deepOrangeAccent,
                                      border: const NeumorphicBorder(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      thumbBorder: NeumorphicBorder(
                                        color: Colors.grey.shade300,
                                        width: 3,
                                      ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      ringtoneVolume = value;
                                    });
                                    saveSettingsInPref();
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22, bottom: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                TranslationConstants.vibration.t(context),
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                              ),
                            ),
                            NeumorphicSwitch(
                              value: _isVibrationEnabled,
                              height: 25,
                              style: const NeumorphicSwitchStyle(
                                  thumbShape: NeumorphicShape.concave,
                                  // concave or flat with elevation
                                  activeTrackColor: Colors.orange,
                                  inactiveTrackColor: Colors.white,
                                  activeThumbColor: Colors.deepOrange,
                                  inactiveThumbColor: Colors.grey),
                              onChanged: (value) {
                                setState(() {
                                  _isVibrationEnabled = value;
                                });
                                saveSettingsInPref();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 55, right: 16),
                              child: Text(
                                TranslationConstants.ring.t(context),
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                              ),
                            ),
                            NeumorphicSwitch(
                              value: _isRingtoneEnabled,
                              height: 25,
                              style: const NeumorphicSwitchStyle(
                                  thumbShape: NeumorphicShape.convex,
                                  // concave or flat with elevation
                                  activeTrackColor: Colors.orange,
                                  inactiveTrackColor: Colors.white,
                                  activeThumbColor: Colors.deepOrange,
                                  inactiveThumbColor: Colors.grey),
                              onChanged: (value) {
                                setState(() {
                                  _isRingtoneEnabled = value;
                                });
                                saveSettingsInPref();
                              },
                            ),
                          ],
                        ),
                      ),
                      Neumorphic(
                        margin: const EdgeInsets.only(top: 22, bottom: 22),
                        padding: const EdgeInsets.only(left: 14),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          depth: 3,
                          surfaceIntensity: 0.0,
                          lightSource: LightSource.topLeft,
                          shadowLightColor: Colors.white,
                          color: AppColor.bgColor,
                        ),
                        child: SizedBox(
                          width: getScreenWidth(context),
                          child: TxtIconRow(
                            txt: TranslationConstants.blockedUsers.t(context),
                            onTap: () {
                              try {
                                if (model.status == 1) {
                                  List<DialogListModel> dialogListModel = [];
                                  for (int i = 0; i < model.response!.length; i++) {
                                    dialogListModel.add(DialogListModel(
                                      model.response![i].id!.toString(),
                                      model.response![i].userId!.toString(),
                                      model.response![i].blockUserId!.toString(),
                                    ));
                                  }
                                  showDropDownLisRadioBtn(context, TranslationConstants.blockedUsers.t(context), TranslationConstants.unblock.t(context), dialogListModel, (blockUserId, index) {
                                        debugPrint('---- Dialog selected value: $blockUserId');
                                        getUnblockedUsers(blockUserId);
                                  });
                                } else {
                                  edgeAlert(context, title: TranslationConstants.message.t(context), description: "You one is blocked by you.");
                                }
                              } catch (e) {
                                debugPrint('----Blocked Users tap error : $e');
                              }
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),*/
              );
            } else {
              return NoDataFound(
                  txt: TranslationConstants.noDataTryAgain.t(context),
                  onRefresh: () {
                    getSettingsFromPref();
                    _future = getDataFromApi();
                  },
              );
            }
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }

  saveSettingsInPref() {
    SettingsPrefModel settingsModel = SettingsPrefModel(
      ringtoneName: ringtoneName,
      ringtoneVolume: ringtoneVolume,
      isVibrationOn: _isVibrationEnabled,
      isRingOn: _isRingtoneEnabled,
    );
    AppSharedPreferences().saveSettingsData(settingsModel);
  }

  getSettingsFromPref() async {
    try {
      SettingsPrefModel settingsModel = await AppSharedPreferences().getSettingsData();
      ringtoneName = settingsModel.ringtoneName ?? ringtoneTxt;
      ringtoneVolume = settingsModel.ringtoneVolume ?? ringtoneVolume;
      _isVibrationEnabled = settingsModel.isVibrationOn ?? _isVibrationEnabled;
      _isRingtoneEnabled = settingsModel.isRingOn ?? _isRingtoneEnabled;
      //debugPrint("----settingsModel isRingOn: ${settingsModel.isRingOn}");
    } catch (e) {
      debugPrint('----getSettingsFromPref Error : $e');
    }
  }

  void getUnblockedUsers(String blockUserId) async {
    try {
      showCustomLoaderOverlay(context);
      String userId = await AppSharedPreferences().getUserId() ?? '';
      bool isInternetAvailable = await isInternetConnectionAvailable();
      if (!isInternetAvailable && mounted) {
        showInternetNotAvailableMessage(context);
      } else {
        Map<String, dynamic> body = {};
        body['user_id'] = userId;
        body['block_user_id'] = blockUserId;

        await ApiFun.apiPostWithBody(ApiConstants.unblockUser, body).then((jsonDecodeData) {
          model = BlockedUsersApiResModel.fromJson(jsonDecodeData);
          edgeAlert(context, title: TranslationConstants.message.t(context), description: model.message??"");
        });
      }
      hideSimpleLoaderOverlay();
    } catch (error) {
      hideSimpleLoaderOverlay();
      debugPrint("Error: $error");
    }
  }

  void getAppLanguage(){
    appLanguage = Provider.of<AppLanguage>(context, listen: false);
    appLanguage.appLocal.languageCode == 'en' ? langTxt = "English" : langTxt = "Hindi";
  }
}
