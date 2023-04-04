import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:lottie/lottie.dart';

import '../../themes/app_color.dart';

class NewsImageWidget extends StatelessWidget {
  final String imgUrl;
  final double icSize;
  final double txtSize;
  final String? upVote;
  final String? downVote;
  final bool isUpDownBtnShowing;
  final String? vote;
  final Function(String vote)? onTap;

  const NewsImageWidget(
      {super.key, required this.imgUrl, required this.onTap, required this.icSize, required this.txtSize, required this.isUpDownBtnShowing, this.vote, this.upVote, this.downVote});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            //placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: imgUrl,
            height: double.infinity,
            width: double.infinity,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: Lottie.asset('assets/animations/lottie-image-loading-improved.json',
                  fit: BoxFit.cover, width: 250, height: 250),
            ),
            errorWidget: (context, url, error) => Image.asset(
             Strings.errorImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if(isUpDownBtnShowing)
        Positioned(
          top: 8,
          right: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap:(){
                  if(onTap!=null){
                    onTap!('up');
                  }
                },
                child: Container(
                  //padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  height: icSize,
                  width: icSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38,
                  ),
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: icSize,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                upVote??"98",
                style: TextStyle(fontSize: txtSize, color: Colors.black26),
              ),
              InkWell(
                onTap:(){
                  if(onTap!=null){
                     onTap!('down');
                  }
                },
                child: Container(
                  //padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  height: icSize,
                  width: icSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38,
                  ),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: icSize,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
               downVote?? "02",
                style: TextStyle(fontSize: txtSize, color: Colors.black26),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
