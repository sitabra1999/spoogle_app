import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/constants/strings.dart';
import '../../../common/extensions/CommonFun.dart';
import 'ImageFadePreview.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  var imageList = [
    Strings.imgUrlTopNews1,
    Strings.imgUrlTopNews2,
    Strings.imgUrlTopNewsPortrait6,
    Strings.imgUrlTopNews3,
    Strings.imgUrlTopNews4,
    Strings.imgUrlTopNews5,
    Strings.imgUrlTopNews6,
    Strings.imgUrlTopNews1,
    Strings.imgUrlTopNewsPortrait6,
    Strings.imgUrlTopNews2,
    Strings.imgUrlTopNews3,
    Strings.imgUrlTopNews4,
    Strings.imgUrlTopNews5,
    Strings.imgUrlTopNews6,
    Strings.imgUrlTopNewsPortrait6,
    Strings.imgUrlTopNews1,
    Strings.imgUrlTopNews2,
    Strings.imgUrlTopNews3,
    Strings.imgUrlTopNews4,
    Strings.imgUrlTopNewsPortrait6,
    Strings.imgUrlTopNews5,
    Strings.imgUrlTopNews6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarIcBack(context: context, text: "Image Gallery", bgColor: Colors.white, isCenterTitle: false),
      body: MasonryGridView.count(
        itemCount: imageList.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        // the number of columns
        crossAxisCount: 2,
        // vertical gap between two items
        mainAxisSpacing: 4,
        // horizontal gap between two items
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              InkWell(
                child: cachedNetImage(imageList[index]),
                onTap: () {
                  openScreen(context, ImageFadePreview(imageList: imageList));

                  // ImagePreview(imgUrl: imageList[index], externalUrlLink: 'www.google.com');
                },
              ),

              Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      margin: const EdgeInsets.only(top: 1, left: 3, bottom: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        //border: Border.all(color: i == 1 ? Colors.white : Colors.white, width: 0.9),
                      ),

                      child: Text(
                        i == 0 ? "General" : "Cricket",
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

/*

 Stack(
              alignment: Alignment.bottomLeft,
              children: [
                cachedNetImage(imageList[index]),

                Container(
                  height: Sizes.dimen_15.h,
                  width: getScreenWidth(context),
                  padding: const EdgeInsets.only(left: 8, bottom: 6),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(AppColor.appCornerRadius4,),
                      bottomRight: Radius.circular(AppColor.appCornerRadius4,),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withAlpha(0),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: RichText(
                    //softWrap: false,
                    textScaleFactor: 0.5,
                    //textAlign: TextAlign.start,
                    //strutStyle: StrutStyle(),
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Most goals in World cup, ost goals in goals in the...\n\n",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        TextSpan(text: "Soccer, General", style: TextStyle(color: Colors.white70, fontSize: 24)),
                      ],
                    ),
                  ),
                ),
              ],
            )
 */
