import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationUtils {
  Widget showLottieAssetFiles({
    required String lottieFileName, 
    required double width, 
    required double height,
    BoxFit? fit,
  }){
    return Lottie.asset(
      lottieFileName,
      width: width,
      height: height,
      fit: fit?? BoxFit.contain,
    );
  }

  Widget showLottieNetworkFiles({
    required String lottieFileName,
    required double width,
    required double height,
    BoxFit? fit,
  }){
    return Lottie.asset(
      lottieFileName,
      width: width,
      height: height,
      fit: fit?? BoxFit.contain,
    );
  }
}