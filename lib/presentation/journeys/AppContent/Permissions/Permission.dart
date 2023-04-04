
import 'package:flutter_spoogle_app/presentation/journeys/AppContent/Permissions/PermissionContentWidget.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/TranslationConstants.dart';
import 'package:flutter_spoogle_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../common/constants/AppMessages.dart';
import '../../../../common/constants/route_constants.dart';
import '../../../../common/constants/size_constants.dart';
import 'UserPermissionUtils.dart';
import '../../../widgets/AppDialog.dart';
import '../../../widgets/txt.dart';


class PermissionScreen extends StatefulWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  State<PermissionScreen> createState() => _SetUpPermissionScreenState();
}

//TODO: App crashing
class _SetUpPermissionScreenState extends State<PermissionScreen> {
  bool isWhatsAppAlertChecked = false;
  bool isStoragePermissionAllowed = false;
  bool isMicrophonePermissionAllowed = false;
  bool isCameraPermissionAllowed = false;
  bool isMediaLocPermissionAllowed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1)).then((value){
        checkIfPermission();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
             Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset('assets/icons/ic_png/app_logo.png', width: 160, height: 100,),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 45),
                child: Text(
                  TranslationConstants.needSomePermission.t(context),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  maxLines: 4,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              PermissionContentWidget(
                title: TranslationConstants.camera.t(context),
                subtitle: AppMessages.requireCameraPermission,
                ic: Icons.camera_alt_rounded,
                isPermissionAllowed: isCameraPermissionAllowed,
                onTap: (){
                  try {
                    requestPermission('Camera').then((isPermissionGranted) {
                                        setState(() {
                                          isCameraPermissionAllowed = isPermissionGranted;
                                        });
                                      });
                  } catch (e) {
                    print(e);
                  }
                },
              ),


              PermissionContentWidget(
                title: TranslationConstants.storage.t(context),
                subtitle: AppMessages.requireStoragePermission,
                ic: Icons.storage,
                isPermissionAllowed: isStoragePermissionAllowed,
                onTap: (){
                  try {
                    requestPermission('Storage').then((isPermissionGranted) {
                                        setState(() {
                                          isStoragePermissionAllowed = isPermissionGranted;
                                        });
                                      });
                  } catch (e) {
                    print(e);
                  }
                },
              ),

              PermissionContentWidget(
                title: TranslationConstants.microphone.t(context),
                subtitle: AppMessages.requireMicrophonePermission,
                ic: Icons.mic,
                isPermissionAllowed: isMicrophonePermissionAllowed,
                onTap: (){
                  try {
                    requestPermission('Microphone').then((isPermissionGranted) {
                                        setState(() {
                                          isMicrophonePermissionAllowed = isPermissionGranted;
                                        });
                                      });
                  } catch (e) {
                    print(e);
                  }
                },
              ),

              /*PermissionContentWidget(
                title: 'Access Media Location',
                subtitle: AppMessages.requireMediaLocPermission,
                ic: Icons.photo,
                isPermissionAllowed: isMediaLocPermissionAllowed,
                onTap: (){
                  requestPermission('AccessMediaLocation').then((isPermissionGranted) {
                    setState(() {
                      isMediaLocPermissionAllowed = isPermissionGranted;
                    });
                  });
                },
              ),*/

              const SizedBox(height: 36,)
            ],
          ),
        ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 160,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24,),
                child: Button(text: TranslationConstants.continues.t(context), onPressed: (){
                    if (!isStoragePermissionAllowed) {
                      edgeAlert(context, title: TranslationConstants.warning.t(context), description: TranslationConstants.requireStoragePermission.t(context));
                    } else if (!isMicrophonePermissionAllowed) {
                      edgeAlert(context, title: TranslationConstants.warning.t(context), description: TranslationConstants.requireMicrophonePermission.t(context));
                    } else if (!isCameraPermissionAllowed) {
                      edgeAlert(context, title: TranslationConstants.warning.t(context), description: TranslationConstants.requireCameraPermission.t(context));
                    }
                    /*else if (!isWhatsAppAlertChecked) {
                      showDialog(context: context, builder: (BuildContext context) => AppDialog(
                        title: "What's App Alerts",
                        description: "Are you sure you don't want to receive what's app alerts from Code Bell?",
                        button1Text: 'No',
                        isBtn1Visible: true,
                        button2Text: 'Yes',
                        onPositiveBtnPressed: () {
                          Navigator.pushNamed(context, RouteList.registrationScreen);
                        },
                      ),
                      );
                    } */
                    else {
                      Navigator.pushNamed(context, RouteList.homeScreen);
                    }
                })
              ),


              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 36, right: 36, bottom: 24),
                  child: Txt(txt: TranslationConstants.dataSecureTxt.t(context),
                      txtColor: Colors.black54, txtSize: 11, fontWeight: FontWeight.normal, padding: 0),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void checkIfPermission() async {
    isStoragePermissionAllowed = await Permission.storage.isGranted;
    isCameraPermissionAllowed = await Permission.camera.isGranted;
    isMicrophonePermissionAllowed = await Permission.microphone.isGranted;
    isMediaLocPermissionAllowed = await Permission.accessMediaLocation.isGranted;
    setState(() {});
  }
}
