import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data/models/AdvertisementApiResModel.dart';
import '../../../data/models/WhatTheySaid/WhatTheySaidApiResModel.dart';
import '../../themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import '../../widgets/IcTxtRow.dart';

class WhatTheySaidSlider extends StatelessWidget {
  final WhatTheySaidApiResModel model;

  WhatTheySaidSlider({Key? key, required this.model}) : super(key: key);

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: (model.response??[]).map((item) => getWidget(item)).toList(),
      carouselController: _controller,
      options: CarouselOptions(
        aspectRatio: 3.0,
        viewportFraction: 0.65,
        padEnds: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(milliseconds: 1600),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {},
      ),
    );
  }

  Widget getWidget(dynamic item) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            fit: StackFit.passthrough,
            alignment : AlignmentDirectional.center,
            children: [
              cachedNetImgWithRadius(item.poster, 75, 75, AppColor.appCornerRadius, BoxFit.cover),
              const Icon(Icons.play_circle_fill_rounded, size: 24, color: Colors.white,)
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.only(left: 12.0),
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.04),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppColor.appCornerRadius),
                bottomRight: Radius.circular(AppColor.appCornerRadius),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColor.textColor),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  dense:true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.all(0),
                  /*leading: Text(
                    "PLAY ▶",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: AppColor.black),
                  ),*/

                  leading: Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColor.textColor, fontSize: 11),
                    TextSpan(
                      children: [
                        WidgetSpan(child: Icon(Icons.thumb_up_alt, size: 16, color: AppColor.textColor,)),
                        TextSpan(text: ' ${item.likes}'),
                        TextSpan(text: '  '),
                        WidgetSpan(child: Icon(Icons.visibility, size: 16, color: AppColor.textColor,)),
                        TextSpan(text: ' ${item.views}  '),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/*

                      TextButton.icon(     // <-- TextButton
                        onPressed: () {},
                        icon: Icon(
                          Icons.download,
                          size: 24.0,
                        ),
                        label: Text('Download'),
                      ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: IcTxtRow(txt: "0", txtColor: Colors.black54, txtSize: 12, fontWeight: FontWeight.normal,
                          icon: Icons.thumb_up_alt_rounded, icSize: 18, icColor: Colors.black54, isCenter: false),
                    ),

                    IcTxtRow(txt: "47", txtColor: Colors.black54, txtSize: 12, fontWeight: FontWeight.normal,
                        icon: Icons.remove_red_eye, icSize: 18, icColor: Colors.black54, isCenter: false),

 */
