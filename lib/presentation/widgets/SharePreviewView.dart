import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';

import '../../common/extensions/CommonFun.dart';
import '../themes/app_color.dart';
import 'IcCircleBorder.dart';
import 'ImagePreviewFullSize.dart';

class SharePreviewViewWidget extends StatelessWidget {
  final String? previewLink;
  final String? readMoreLink;
  final String? title;
  final String? text;
  final String? link;
  const SharePreviewViewWidget({Key? key, this.previewLink, this.readMoreLink, this.title, this.text, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.bounceIn,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
              child: IcCircleBorder(
                  ic: Icons.public_sharp,
                  height: 30,
                  borderRadius: 33,
                  borderColor: AppColor.white,
                  text: 'Read More',
                  padding: EdgeInsets.zero,
                  onTap: () {
                    launchInBrowser(
                      readMoreLink??Strings.websiteLink
                    );
                  },
                  bgColor: AppColor.black20,
                  icColor: AppColor.white)),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: IcCircleBorder(
                  ic: Icons.image,
                  height: 28,
                  borderRadius: 33,
                  borderColor: AppColor.white,
                  padding: EdgeInsets.zero,
                  text: 'Preview',
                  onTap: () {
                  openScreen(context,   FullSizeImagePreview(
                      imgUrl: previewLink??Strings.defaultImage)
                  );
                  },
                  bgColor: AppColor.black20,
                  icColor: AppColor.white)),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: IcCircleBorder(
                  ic: Icons.share_rounded,
                  height: 28,
                  borderRadius: 33,
                  borderColor: AppColor.white,
                  padding: EdgeInsets.zero,
                  text: 'Share',
                  onTap: () async {
                    await FlutterShare.share(
                        title: title??'Spoogle',
                        text: text??'Spoogle text',
                        linkUrl: link?? Strings.websiteLink);
                  },
                  bgColor: AppColor.black20,
                  icColor: AppColor.white)),
        ],
      ),
    );
  }
}
