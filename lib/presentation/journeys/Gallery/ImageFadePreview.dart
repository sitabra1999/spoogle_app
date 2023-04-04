import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/libraries/image_fade.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../../widgets/Button3d.dart';
import '../../widgets/NewsCategoryWidget.dart';

class ImageFadePreview extends StatefulWidget {
  final List<String> imageList;

  const ImageFadePreview({Key? key, required this.imageList}) : super(key: key);

  @override
  State<ImageFadePreview> createState() => _ImageFadePreviewState();
}

class _ImageFadePreviewState extends State<ImageFadePreview> {
  int _index = 0;
  String  url = "";

  void _nextImg() {
    setState(() {
      _index = (_index + 1) % widget.imageList.length;
    });
  }

  void _previousImg() {
    setState(() {
      _index = (_index - 1) % widget.imageList.length;
    });
  }

  @override
  void initState() {
    super.initState();
    url = widget.imageList[_index];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(alignment: Alignment.bottomLeft, children: <Widget>[
        Positioned.fill(
          child: ImageFade(
            // whenever the image changes, it will be loaded, and then faded in:
            image: NetworkImage(url),

            // slow-ish fade for loaded images:
            duration: const Duration(milliseconds: 900),

            // if the image is loaded synchronously (ex. from memory), fade in faster:
            syncDuration: const Duration(milliseconds: 150),

            // supports most properties of Image:
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            scale: 2,

            // shown behind everything:
            placeholder: Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: const Icon(Icons.photo, color: Colors.white30, size: 128.0),
            ),

            // shows progress while loading an image:
            loadingBuilder: (context, progress, chunkEvent) =>
                Center(child: CircularProgressIndicator(value: progress)),

            // displayed when an error occurs:
            errorBuilder: (context, error) => Container(
              color: const Color(0xFF6F6D6A),
              alignment: Alignment.center,
              child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
            ),
          ),
        ),

        Positioned(
          top: 40,
          right: 8,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: Sizes.dimen_20.h,
            width: getScreenWidth(context),
            padding: const EdgeInsets.only(left: 12, bottom: 6, top: 24),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  AppColor.appCornerRadius4,
                ),
                bottomRight: Radius.circular(
                  AppColor.appCornerRadius4,
                ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Most goals in World cup, ost goals in goals in the cup, ost goals in goals in the...",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: NewsCategoryWidget(
                    height: 20,
                    boxSpace: 8,
                    corner: 12,
                    textSpace: 12,
                  ),
                ),
                Text.rich(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColor.white, fontSize: 11),
                  TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.thumb_up_outlined,
                        size: 18,
                        color: AppColor.white,
                      )),
                      TextSpan(text: ' 10'),
                      TextSpan(text: '  '),
                      WidgetSpan(
                          child: Icon(
                        Icons.visibility_outlined,
                        size: 18,
                        color: AppColor.white,
                      )),
                      TextSpan(text: ' 500'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // cachedNetImage(imageList[index]),
      ]),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: _previousImg,
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: _nextImg,
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
