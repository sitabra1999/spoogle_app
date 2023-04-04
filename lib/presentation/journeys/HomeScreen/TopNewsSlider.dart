import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/models/News/BreakingNewsApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import '../../libraries/LayerHalfShadow.dart';
import '../../themes/app_color.dart';

class TopNewsSliderCarousel extends StatelessWidget {
  final BreakingNewsApiResModel model;
  final List<String>? staticImgList;

  TopNewsSliderCarousel({Key? key, required this.model, this.staticImgList}) : super(key: key);

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: model.response?.map((item) => getWidget(item)).toList(),
      carouselController: _controller,
      options: CarouselOptions(
        aspectRatio: 2.3,
        viewportFraction: 0.78,
        padEnds: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 14),
        autoPlayAnimationDuration: const Duration(milliseconds: 1600),
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {},
      ),
    );
  }

  Widget getWidget(dynamic item) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: cachedNetImgWithRadius(item.image??'', double.infinity, 170, AppColor.appCornerRadius, BoxFit.cover),
        ),
        LayerHalfShadow(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             Text(
              "${item.title?.substring(0,50)??''}...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColor.white),
            ),
           /* ListTile(
              dense: true,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading:  Text(
                "${item.sportsName??''}, ${item.tournament?[0].name??''}",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: AppColor.white),
              ),
              trailing: Text.rich(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
                TextSpan(
                  children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.white70,
                    ),
                    ),
                    TextSpan(text: "  ${item.posted??''}"),
                  ],
                ),
              ),
            ),*/
          ]),
        ),
      ],
    );
  }
}
