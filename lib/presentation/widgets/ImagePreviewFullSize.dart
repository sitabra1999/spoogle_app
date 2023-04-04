import 'package:flutter/material.dart';

import '../../common/extensions/CommonFun.dart';
import '../libraries/CachedNetworkImage/cached_net_img.dart';
import '../themes/app_color.dart';

class FullSizeImagePreview extends StatelessWidget {
  final String imgUrl;

  const FullSizeImagePreview({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  Container(
            margin: const EdgeInsets.only(top: 16, left: 16),
            height: 30,
            width: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                child: Container(
                  //padding: EdgeInsets.only(top: 12, left: 12),
                  color: Colors.black12,
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColor.white,
                    size: 22,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        body: InteractiveViewer(
          minScale: 0.1,
          maxScale: 1.5,
          child: InkWell(
            child: cachedNetImgWithCustomRadius(imgUrl, getScreenWidth(context),
                getScreenHeight(context), 0, BoxFit.contain),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
