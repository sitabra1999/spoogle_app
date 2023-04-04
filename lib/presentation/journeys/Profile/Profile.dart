
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/ProfileApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/StatusMessageApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Auth/LoginScreen.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/FirebaseNotificationImpl.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/NoDataWidget.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/widgets/appBarHome.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';

import '../../libraries/Languages/TranslationConstants.dart';
import '../../themes/app_color.dart';
import '../../widgets/AppBarCartBack.dart';
import '../../widgets/AppDialog.dart';
import '../../widgets/ReferBoxWidget.dart';
import 'edit_profile.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController callForwardController = TextEditingController();

  bool isChangePassword = false;
  bool isCallForwarded = false;

  late File? xFile = File('');
  String base64Image = '' , userImage = '', qrImage = '', userId = '';
  String callForwardedId = '', callForwardUser = '', callForwardImage = '', callFrwdDeviceToken = '';

  late Future<bool> _future;
  late bool isApiDataAvailable = true;
  ProfileApiResModel model = ProfileApiResModel();

  @override
  void initState() {
    super.initState();

    _future = getDataFromApi();
  }

  Future<bool> getDataFromApi() async {
    try{
      userId = await AppSharedPreferences().getUserId()?? '';
      //debugPrint('----userId : $userId');

      Map<String, dynamic> body = {};
      body["user_id"] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.profile, body).then((jsonDecodeData) {
        model = ProfileApiResModel.fromJson(jsonDecodeData);
        nameController.text = model.response?.name ?? '';
        emailController.text = model.response?.email ?? '';
        phoneController.text = model.response?.mobile ?? '';
        addressController.text = model.response?.address ?? '';
        callForwardedId = model.response?.callFrwdToUserId ?? '';
        callForwardUser = model.response?.callFrwdToUsername ?? '';
        callForwardImage = model.response?.callFrwdImage ?? '';
        callFrwdDeviceToken = model.response?.callFrwdDeviceToken ?? '';

        qrImage = model.response?.qrcode ?? '';

        model.response?.callFlag == 1? callForwardController.text = "$callForwardUser (${model.response?.callFrwdPhone})" : callForwardController.text = "";

        if (model.response!.image == null || model.response!.image!.isEmpty) {
          userImage = Strings.imgUrlNotFoundYellowAvatar;
        } else {
          userImage = model.response?.image ?? '';
        }

        if (model.response?.callFlag == 1) {
          isCallForwarded = true;
        } else {
          isCallForwarded = false;
        }
      });

      if(model.status == 1) {
        isApiDataAvailable = true;
      }

      /*
      userImage = Strings.imgUrlQrCode;
      nameController.text = 'Jhon Doa';
      emailController.text = 'jhondoa@gamail.com';
      phoneController.text = '+91 9564636088';
      addressController.text = 'Webel It Park, Mob-203, Rajarhat, New Town, Kolkata, West Bengal, India, Pin-7000156';
      */

    } catch(error){
      debugPrint("Error: $error");
    }
    return isApiDataAvailable;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarHome(context, "Settings"),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData && snapShot.connectionState == ConnectionState.done){
            if(isApiDataAvailable){
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Elina White",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: AppColor.black),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 5),
                        child: Text(
                          "957634037",
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: AppColor.appTextSize, color: AppColor.black),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 8),
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.shade100,
                        ),
                      ),

                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 24, 6),
                              child: Hero(
                                tag: "UserProfileImg",
                                child: cachedNetImgWithRadius(Strings.imgUrlPersonSmileCall1,
                                  85, 100, AppColor.appCornerRadius, BoxFit.fill,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Name",
                                    style: TextStyle(fontSize: 12, color: AppColor.grey),
                                  ),
                                  Text(
                                    "Elina White",
                                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: AppColor.black),
                                  ),

                                  SizedBox(height: 6,),

                                  Text(
                                    "Email",
                                    style: TextStyle(fontSize: 12, color: AppColor.grey),
                                  ),
                                  Text(
                                    "k@gmail.com",
                                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: AppColor.black),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Phone",
                                  style: TextStyle(fontSize: 12, color: AppColor.grey),
                                ),
                                Text(
                                  "9564636037",
                                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: AppColor.black),
                                ),

                                SizedBox(height: 6,),

                                Text(
                                  "Emergency contact",
                                  style: TextStyle(fontSize: 12, color: AppColor.grey),
                                ),
                                Text(
                                  "7980342323",
                                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: AppColor.black),
                                ),
                              ],
                            ),
                          ],
                        ),

                        onTap: (){

                        },
                      ),


                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.shade100,
                        ),
                      ),


                      InkWell(
                        child: const Text(
                          "UPDATE PROFILE\n",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppColor.appTextSize, color: AppColor.black, letterSpacing: 1.3),
                        ),

                        onTap: (){
                          openScreen(context, const EditProfilePage());
                        },
                      ),

                      InkWell(
                        child: const Text(
                          "LOGOUT\n",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppColor.appTextSize, color: AppColor.black, letterSpacing: 1.3),
                        ),
                        onTap: (){
                          openLogoutDialog(context);
                        },
                      ),

                      InkWell(
                        child: const Text(
                          "DELETE ACCOUNT",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppColor.appTextSize, color: AppColor.black, letterSpacing: 1.3),
                        ),
                        onTap: (){
                          openDeleteDialog(context);
                        },
                      ),

                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.shade100,
                        ),
                      ),

                      ReferBoxWidget(
                        txt1: 'Invite Friends',
                        txt2: 'If you love what we are doing, please\nspread the world!',
                        btnTxt: 'Invite',
                        btnIc: Icons.share,
                        onTap:(){
                          //Share.share(Strings.shareTxt, subject: 'Look what I made!');
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.shade100,
                        ),
                      ),

                      ReferBoxWidget(txt1: 'Contact Us',
                        txt2: 'For any queries',
                        btnTxt: 'Call Us',
                        btnIc: Icons.call,
                        onTap:(){
                          launchDialer('0222465654353');
                        },
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.shade100,
                        ),
                      ),

                      const Text(
                        "Mail us at help@laundryking.in",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: AppColor.black70),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey.shade100,
                        ),
                      ),

                      const Text(
                        "App Version v1.0.0",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: AppColor.appTextSize, color: AppColor.black60),
                      ),
                    ],
                  ),
                ),
              );
            }

            else { return NoDataFound(txt: TranslationConstants.noDataFound.t(context), onRefresh: (){
              isApiDataAvailable = false;
              _future = getDataFromApi();
            });}
          } else {
            return showSimpleLoaderOverlay();
          }
        },
      ),
    );
  }

  void openLogoutDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) => AppDialog(
      title:'${TranslationConstants.logoutCaps.t(context)} ?',
      description: TranslationConstants.logoutDialogContent.t(context),
      isBtn1Visible: true,
      button1Text: TranslationConstants.cancel.t(context),
      button2Text: TranslationConstants.logout.t(context),
      onPositiveBtnPressed: (){
        AppSharedPreferences().removeUserSfData();
        openScreenWithoutBack(context, const LoginScreen());
      },
    ),
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
        doDelete();
      },
    ),
    );
  }

  void doDelete() async {
    try {
      showCustomLoaderOverlay(context);
      String? userId = await AppSharedPreferences().getUserId();

      Map<String, dynamic> data = {};
      data["user_id"] = userId;
      await ApiFun.apiPostWithBody(ApiConstants.deleteProfile, data).then((jsonDecodeData){
            StatusMessageApiResModel model = StatusMessageApiResModel.fromJson(jsonDecodeData);
            edgeAlert(context, title: TranslationConstants.message.t(context), description: model.message??"");
            AppSharedPreferences().removeUserSfData();
            debugPrint('----Login Res : ${model.message}');
            openScreenWithoutBack(context, const LoginScreen());
      });
      hideSimpleLoaderOverlay();
    } catch (e) {
      hideSimpleLoaderOverlay();
      debugPrint("Error: $e");
    }
  }

  void removeUser(String callFrwdId, Function(bool isRemoved) callback) async {
    if (callFrwdId.isNotEmpty) {
      try {
        showCustomLoaderOverlay(context);
        Map<String, dynamic> data = {};
        data["user_id"] = userId;
        data["call_frwd_id"] = callFrwdId;

        await ApiFun.apiPostWithBody(ApiConstants.removeCallFrwdUser, data).then((jsonDecodeData){
          StatusMessageApiResModel model = StatusMessageApiResModel.fromJson(jsonDecodeData);
          edgeAlert(context, title: TranslationConstants.message.t(context), description: model.message?? "");
          if (model.status == 1) {
            AwesomeAndFirebaseNotificationImpl.sendBasicPushNotificationByFirebase(
                firebaseAppToken: callFrwdDeviceToken,
                title: TranslationConstants.callForwardRemoved.t(context),
                body: "${nameController.text} ${TranslationConstants.callForwardRemovedDesc.t(context)}",
                payload: {});
            callback(true);
          }
          hideSimpleLoaderOverlay();
        });
      } catch (e) {
        hideSimpleLoaderOverlay();
        debugPrint("Error: $e");
      }
    } else {
      edgeAlert(context, title: TranslationConstants.message.t(context), description: TranslationConstants.somethingWentWrong.t(context));
    }
  }
}

/*
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 24, 20.0, 12),
                      child: Button(
                        text: 'UPDATE',
                        onPressed: () {
                          *//*if (nameController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (emailController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (phoneController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (genderController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (dob.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else *//*

                          if (isChangePassword && oldPasswordController.text.isEmpty) {
                            edgeAlert(context, title: 'Warning', description: 'Enter old password');
                          } else if (isChangePassword && newPasswordController.text.isEmpty) {
                            edgeAlert(context, title: 'Warning', description: 'Enter new password');
                          } else if (isChangePassword && newPasswordController.text != confirmPasswordController.text) {
                            edgeAlert(context, title: 'Warning', description: 'Old password and new password did not matched');
                          } else {
                            doUpdate();
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 16),
                      child: Button(
                        text: 'LOGOUT',
                        onPressed: () {
                          showIosDialog(
                              context,
                              'LOGOUT ?', "Are you sure you want to logout?",
                              'Cancel',
                              'Logout',
                                  (){
                                Navigator.of(context).pushNamed(RouteList.login);
                                AppSharedPreferences().clearPreferenceData();
                              }
                          );
                        },
                      ),
                    ),*/
