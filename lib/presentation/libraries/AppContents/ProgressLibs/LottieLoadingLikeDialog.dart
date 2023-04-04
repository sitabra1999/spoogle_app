import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';


/*
LoaderOverlay.show(context,
  isSafeAreaOverlay: true,
  progressIndicator:  const LottieLoadingLikeDialog(txt: 'CREATING YOUR WALLET',
      lottieFileName: 'assets/animations/wallet-create.json',
      width: 170, height: 170),

);

* */

class LottieLoadingLikeDialog extends StatelessWidget {
  final String txt;
  final String lottieFileName;
  final double width;
  final  double height;

  const LottieLoadingLikeDialog({Key? key, required this.txt, required this.lottieFileName,
    required this.width, required this.height}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: ZoomIn(
        preferences: const AnimationPreferences(duration: Duration(milliseconds: 800), autoPlay: AnimationPlayStates.Forward),
        child: Center(
          child: Container(
            height: 500,
            width: getScreenWidth(context) - 30,
            //margin: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.accentColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.orange),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12.0,
                  offset: Offset(5.0, 5.0),
                ),
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(lottieFileName,
                  fit: BoxFit.cover, width: width, height: height,),

                Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
                    maxLines: 8,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'PLEASE WAIT...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black87),
                    maxLines: 8,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}