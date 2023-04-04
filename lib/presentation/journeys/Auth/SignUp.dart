import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/validation.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/LoginApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/AppContent/Permissions/Permission.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Auth/ForgotPassword.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeNavBar.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/widgets/IcCircleBorder.dart';
import 'package:flutter_spoogle_app/presentation/widgets/button.dart';
import 'package:flutter_spoogle_app/presentation/widgets/if_pass_show_hide.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants/AppMessages.dart';
import '../../../common/extensions/CommonFun.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../libraries/Languages/TranslationConstants.dart';
import '../../themes/app_color.dart';
import '../../widgets/socialLogInButtons.dart';
import '../../widgets/txt_input_field_icon.dart';
import '../HomeScreen/HomeScreen.dart';
import 'LoginScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isCnfPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    LoaderOverlay.hide();
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    cnfPasswordController.dispose();
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
                  Text('Sign Up', style: GoogleFonts.inter(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 36))),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text('Full Name', style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 13,color: AppColor.greyColor8))),
                  ),
                  TxtIfIcon(
                    txt: "",
                    controller: nameController,
                    hint: nameController.text.isEmpty ? "Enter name here" : nameController.text,
                    validationFunc: (text){
                      return validateName(nameController.text);
                    },
                    maxLine: 1,
                    isReadOnly: false,
                    textInputType: TextInputType.name,
                    leftPadding: 0,
                    rightPadding: 0,
                    isIconVisible: false,
                    contentPadding: const EdgeInsets.only(left: 10),
                    prefixIc: Icons.phone_android_sharp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 20),
                    child: Text('Email', style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 13,color: AppColor.greyColor8))),
                  ),
                  TxtIfIcon(
                    txt: "",
                    controller: emailController,
                    hint: emailController.text.isEmpty ? "Enter email here" : emailController.text,
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0, top: 20),
                    child:
                    Text('Password',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(fontSize: 13,color: AppColor.greyColor8))),
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
                          isPasswordVisible=!isPasswordVisible;
                        });
                      },
                    ),
                  ), Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 20),
                    child:
                    Text('Confirm Password',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(fontSize: 13,color: AppColor.greyColor8))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 3),
                    child: IfPasswordShowHide(
                      txt: "",
                      controller: cnfPasswordController,
                      topPadding: 0,
                      contentPadding: const EdgeInsets.only(left: 10),
                      hint: cnfPasswordController.text.isEmpty ? "Enter confirm password here" : cnfPasswordController.text,
                      isCallForwarded: false,
                      isIconVisible: false,
                      isPasswordVisible: isCnfPasswordVisible,
                      textInputType: TextInputType.phone,
                      leftPadding: 0,
                      rightPadding: 0,
                      onTapOnView: (isPassVisible) {
                        setState(() {
                          isCnfPasswordVisible =! isCnfPasswordVisible ;
                        });
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 24),
                    child: Button(
                      buttonMargin: const EdgeInsets.symmetric(horizontal: 0),
                      btnColor: AppColor.blueColor1,
                      height: 42,
                      text: "Sign Up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          doRegister();
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
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: "Already have an account?  ", style: GoogleFonts.inter(
                                  textStyle: TextStyle(fontSize: 28,color: AppColor.grey))),
                              TextSpan(
                                  text: "Log In",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Color(0xff5873FF)))),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                            return LoginScreen();
                          }));
                          //openScreen(context, const LoginScreen());
                        }),
                  ),
                  /*SizedBox(
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IcCircleBorder(ic: Icons.facebook_outlined, icColor: Colors.white, onTap: () {},bgColor: Color(0xff3B5998),borderRadius: 33),
                        SizedBox(width: 20,),
                        IcCircleBorder(ic: Icons.g_mobiledata_rounded, icColor: Colors.white, onTap: () {},bgColor: Color(0xffDC4E41),borderRadius: 33),
                      ],
                    ),
                  ),*/
                  SocialLogInButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void doRegister() async {
    try {
      showCustomLoaderOverlay(context);
      bool isInternetAvailable = await isInternetConnectionAvailable();
      if (!isInternetAvailable && mounted) {
        showInternetNotAvailableMessage(context);
      } else {
        Map<String, dynamic> body = {};
        body['name'] = nameController.text;
        body['email'] = emailController.text;
        body['password'] = passController.text;
        body['password_confirmation'] = cnfPasswordController.text;
        await ApiFun.apiPostWithBody(ApiConstants.resgister, body).then((jsonDecodeData) {
          LoginApiResModel model = LoginApiResModel.fromJson(jsonDecodeData);
          if (model.status == 1 ) {
            edgeAlert(context,
                icon: Icons.check_circle,
                title: TranslationConstants.welcome.t(context),
                description: model.message.toString());
            //String s = phoneController.text.trim();

            openScreen(context, const LoginScreen());
          } else {
            edgeAlert(context, title: AppMessages.message, description: model.message ?? "");
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
