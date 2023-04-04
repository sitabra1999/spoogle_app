import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget cachedNetImage(String url) => CachedNetworkImage(
  fit: BoxFit.cover,
  //placeholder: (context, url) => CircularProgressIndicator(),
  imageUrl: url,
  progressIndicatorBuilder: (context, url, downloadProgress) =>
      Center(child: Lottie.asset('assets/animations/lottie-image-loading-improved.json', fit: BoxFit.cover, width: 300, height: 250),),
  errorWidget: (context, url, error) => Image.asset("assets/images/app/app_logo_hori_white_bg.png", fit: BoxFit.cover),
);

Widget cachedNetImgWithRadius(String url, double width, double height, double radius, BoxFit boxFit) => ClipRRect(
  borderRadius: BorderRadius.circular(radius),
  child: CachedNetworkImage(
    height: height,
    width: width,
    fit: boxFit,
    //placeholder: (context, url) => CircularProgressIndicator(),
    imageUrl: url,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        Center(child: Lottie.asset('assets/animations/lottie-image-loading-improved.json', fit: BoxFit.contain, width: 250, height: 250),),
    errorWidget: (context, url, error) => Image.asset("assets/images/ic_svg/no_preview.jpg", fit: BoxFit.cover ,),
  ),
);


Widget cachedNetImgWithCustomRadius(String url, double width, double height, double radius, BoxFit boxFit) => ClipRRect(
  borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
  child: CachedNetworkImage(
    height: height,
    width: width,
    fit: boxFit,
    //placeholder: (context, url) => CircularProgressIndicator(),
    imageUrl: url,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        Center(child: Lottie.asset('assets/animations/lottie-image-loading-improved.json', fit: BoxFit.cover, width: 300, height: 250),),
    errorWidget: (context, url, error) => Image.asset("assets/images/app/app_logo_hori_white_bg.png", fit: BoxFit.cover ,),
  ),
);
