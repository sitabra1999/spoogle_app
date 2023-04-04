import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/models/AdvertisementApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import '../themes/app_color.dart';

final List<String> imgList = [];

class HomeSliderCarouselWithIndicator extends StatefulWidget {
  final AdvertisementApiResModel model;
  final List<String> staticImgList;

  const HomeSliderCarouselWithIndicator({Key? key, required this.model, required this.staticImgList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<HomeSliderCarouselWithIndicator> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    imgList.clear();
    /*for(int i =0; i<widget.model.response!.length; i++){
      imgList.add(widget.model.response![i].image!);
    }*/

    imgList.addAll(widget.staticImgList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          //fit : StackFit.passthrough,
          //clipBehavior : Clip.none,
          children: [
            CarouselSlider(
              items: imgList
                  .map((item) =>
                      cachedNetImgWithRadius(item, double.infinity, double.infinity, AppColor.appCornerRadius, BoxFit.fill))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                aspectRatio: 16 / 6.3,
                viewportFraction: 1,
                initialPage: 0,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.fromLTRB(3, 12, 4, 16),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: _current == entry.key ? AppColor.primaryColor : AppColor.black30),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ]),
    );
  }
}
