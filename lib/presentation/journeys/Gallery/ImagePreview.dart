import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String imgUrl;
  final String externalUrlLink;

  const ImagePreview({Key? key, required this.imgUrl, required this.externalUrlLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 23,
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: InkWell(
          child: cachedNetImgWithCustomRadius(
              imgUrl,
              getScreenWidth(context),
              getScreenHeight(context),
              0, BoxFit.fill),

          onTap: (){
            launchUniversalLinkIos(externalUrlLink);
          },
        ),
      ),
    );
  }
}
