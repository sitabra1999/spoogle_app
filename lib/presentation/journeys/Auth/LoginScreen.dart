import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/LoginApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/AppContent/Permissions/Permission.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Auth/ForgotPassword.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Auth/SignUp.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeNavBar.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/Button3d.dart';
import 'package:flutter_spoogle_app/presentation/widgets/IcCircleBorder.dart';
import 'package:flutter_spoogle_app/presentation/widgets/button.dart';
import 'package:flutter_spoogle_app/presentation/widgets/if_pass_show_hide.dart';
import 'package:flutter_spoogle_app/presentation/widgets/socialLogInButtons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/AppMessages.dart';
import '../../../common/extensions/CommonFun.dart';
import '../../../common/extensions/validation.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../libraries/Languages/TranslationConstants.dart';
import '../../widgets/txt_input_field_icon.dart';
import '../HomeScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final bool _isChecked = false;
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    LoaderOverlay.hide();
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 27, right: 27, top: 60),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(

                      padding: const EdgeInsets.only(top: 0, bottom: 24),
                      child: Lottie.asset(
                        'assets/animations/sports_auth.json',
                        height: 200,
                      ),
                    ),
                  ),
                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        runSpacing: 30,
                        direction: Axis.vertical,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: 'LogIn'.split("").map((string) => Text(string, style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,height: 1.2),textAlign: TextAlign.center,)).toList(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 24),
                          child: Lottie.asset(
                            'assets/animations/sports_auth.json',
                            height: 200,
                          ),
                        ),
                      ),
                    ],
                  ),*/
                  Text('Log In', style: GoogleFonts.inter(textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 36))),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Email', style: TextStyle(fontSize: 13, color: Color(0xffABA8BC))),
                  ),
                  TxtIfIcon(
                    txt: "",
                    controller: emailController,
                    hint: emailController.text.isEmpty ? "Enter email here" : emailController.text,
                    isCallForwarded: false,
                    validationFunc: (text){
                      return validateEmail(emailController.text);
                    },
                    maxLine: 1,
                    isReadOnly: false,
                    textInputType: TextInputType.emailAddress,
                    leftPadding: 0,
                    rightPadding: 0,
                    isIconVisible: false,
                    contentPadding: const EdgeInsets.only(left: 10),
                    prefixIc: Icons.phone_android_sharp,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0, top: 20),
                    child:
                        Text('Password', style: TextStyle(fontSize: 13, color: Color(0xffABA8BC))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 3),
                    child: IfPasswordShowHide(
                      txt: "",
                      controller: passController,
                      topPadding: 0,
                      contentPadding: const EdgeInsets.only(left: 10),
                      hint: passController.text.isEmpty ? "Enter password here" : passController.text,
                      isCallForwarded: false,
                      isIconVisible: false,
                      isPasswordVisible: isPasswordVisible,
                      textInputType: TextInputType.phone,
                      leftPadding: 0,
                      rightPadding: 0,
                      onTapOnView: (isPassVisible) {
                        setState(() {
                          isPassVisible ? isPasswordVisible = false : isPasswordVisible = true;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          side: BorderSide(color: AppColor.greyColor8),
                          value: _isChecked,
                          onChanged: (value) {
                          },
                          checkColor: AppColor.appTxtGrey,
                          activeColor: AppColor.greyColor7,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text(
                        'Remember me',
                        style: TextStyle(fontSize: 13),
                      ),
                      Expanded(
                        child: InkWell(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Text(
                              'Forgot Password ?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: AppColor.primaryColorAuth,
                              ),
                            ),
                          ),
                          onTap: () {
                            openScreen(context, const ForgotPassword());
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 24),
                    child: Button(
                      buttonMargin: const EdgeInsets.symmetric(horizontal: 0),
                      btnColor:  AppColor.primaryColorAuth,
                      height: 42,
                      text: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          doLogin();
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                        child: RichText(
                          softWrap: false,
                          textScaleFactor: 0.5,
                          textAlign: TextAlign.center,
                          //strutStyle: StrutStyle(),
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: "Don't have account?  ", style: TextStyle(color: Colors.black54, fontSize: 28)),
                              TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(color: AppColor.primaryColorAuth, fontWeight: FontWeight.bold, fontSize: 28)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                            return SignUp();
                          }));
                          //openScreen(context, const SignUp());
                        }),
                  ),
                  SocialLogInButton()
                ],
              ),
            ),
          ),
        ),
      ),
      /*bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ic_png/facebook.png',width: 40,),
              const SizedBox(width: 20,),
              Image.asset('assets/images/ic_png/google-plus.png',width: 40,)
             ],
          ),
        ),
      ),*/
    );
  }

  void doLogin() async {
    try {
      showCustomLoaderOverlay(context);
      bool isInternetAvailable = await isInternetConnectionAvailable();
      if (!isInternetAvailable && mounted) {
        showInternetNotAvailableMessage(context);
      } else {
        Map<String, dynamic> body = {};
        body['email'] = emailController.text;
        body['password'] = passController.text;
        await ApiFun.apiPostWithBody(ApiConstants.login, body).then((jsonDecodeData) {
          LoginApiResModel model = LoginApiResModel.fromJson(jsonDecodeData);
          if (model.status == 1 ) {
            edgeAlert(context,
                icon: Icons.check_circle,
                title: TranslationConstants.welcome.t(context),
                description: model.message.toString());
            //String s = emailController.text.trim();
            AppSharedPreferences().saveUserId(model.response?.userId.toString()??'');
            AppSharedPreferences().saveUserDetails(model);
            openScreen(context, const HomeNavBar());
          } else {
            edgeAlert(context, title:  model.message ?? "");
          }
        });
      }
      hideSimpleLoaderOverlay();
    } catch (error) {
      hideSimpleLoaderOverlay();
      debugPrint("Error: $error");
    }
  }

  Future<bool> checkPermissionAndOpenNextScreen() async {
    bool isStoragePermissionAllowed = await Permission.storage.isGranted;
    bool isCameraPermissionAllowed = await Permission.camera.isGranted;
    bool isMicrophonePermissionAllowed = await Permission.microphone.isGranted;
    //bool isMediaLocPermissionAllowed = await Permission.accessMediaLocation.isGranted;
    //debugPrint('----Allowed : ${isStoragePermissionAllowed && isCameraPermissionAllowed && isMicrophonePermissionAllowed}');

    return isStoragePermissionAllowed && isCameraPermissionAllowed && isMicrophonePermissionAllowed;
  }
}
