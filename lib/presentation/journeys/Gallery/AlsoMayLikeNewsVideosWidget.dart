import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/models/MediaVideo/VideoDetailsApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/VideoDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';

import '../../libraries/CachedNetworkImage/cached_net_img.dart';
import '../../themes/app_color.dart';


class AlsoMayLikeNewsVideosWidget extends StatelessWidget {
  final List<OtherVideo> alsoLike;
  const AlsoMayLikeNewsVideosWidget({Key? key,
    required this.alsoLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(alsoLike.length, (index) {
        return InkWell(
          onTap: (){
            openScreen(context, VideoDetails(
              url: alsoLike[index].mainVideo.toString(),
              videoId: alsoLike[index].videoid.toString()
            ));
          },
          child: Container(
            height: Sizes.dimen_20.h,
            width: getScreenWidth(context)/1.7,
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    cachedNetImgWithRadius(alsoLike[index].poster ?? '',
                        MediaQuery.of(context).size.width, 140, 0, BoxFit.cover),
                    const Positioned(
                        top: 50,
                        left: 85,
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColor.white,
                          size: 50,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        alsoLike[index].title ?? '',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppColor.black),
                      ),
                      Container(
                        height: 22,
                        padding: const EdgeInsets.fromLTRB(0, 5, 4, 4,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: AppColor.black, fontSize: 10),
                              TextSpan(
                                children: [
                                  const WidgetSpan(child: Icon(Icons.thumb_up_outlined, size: 12, color: AppColor.black,)),
                                  TextSpan(text: ' ${alsoLike[index].likes.toString() ?? ''}'),
                                  const TextSpan(text: '  '),
                                  const WidgetSpan(child: Icon(Icons.visibility_outlined, size: 12, color: AppColor.black,)),
                                  TextSpan(text: ' ${alsoLike[index].views.toString() ?? ''}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}