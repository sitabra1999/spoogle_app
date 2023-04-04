import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/NewsDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/drop_shadow.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';

import '../../common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../widgets/NewsCategoryWidget.dart';
import 'HomeScreen/NewsImageWidget.dart';

class FreakoStats extends StatefulWidget {
  final String title;
  const FreakoStats({super.key, required this.title});

  @override
  State<FreakoStats> createState() => _FreakoStatsState();
}

class _FreakoStatsState extends State<FreakoStats> {

  var staticImgList = [Strings.imgUrlTopNews1, Strings.imgUrlTopNews2, Strings.imgUrlTopNews3, Strings.imgUrlTopNews4,
    Strings.imgUrlTopNews5, Strings.imgUrlTopNews6];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: widget.title, bgColor: Colors.white, isCenterTitle: false),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        children: List.generate(staticImgList.length, (index) {
          return InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropShadow(
                  blurRadius: 6,
                  offset: const Offset(0.0, 5),
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration:  BoxDecoration(
                      color: Colors.transparent,
                      // border: Border.all(color: index == 3 ?  AppColor.primaryColor : AppColor.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: NewsImageWidget(imgUrl: staticImgList[index], onTap: (isIncremented) {}, icSize: 22, txtSize: 12, isUpDownBtnShowing: true,),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4, left: 16),
                  child: Text(
                    "Most goals in World cup, ost goals in goals in the World cup, ost goals in goals in the...",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 10, left: 16),
                  child: NewsCategoryWidget(height: 16),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 24, left: 16),
                  child: Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColor.textColor, fontSize: 11),
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.thumb_up_outlined,
                          size: 18,
                          color: AppColor.textColor,
                        )),
                        TextSpan(text: ' 10'),
                        TextSpan(text: '    '),
                        WidgetSpan(
                            child: Icon(
                          Icons.visibility_outlined,
                          size: 18,
                          color: AppColor.textColor,
                        )),
                        TextSpan(text: ' 500'),
                        TextSpan(text: '    '),
                        WidgetSpan(
                            child: Icon(
                          Icons.textsms_outlined,
                          size: 16,
                          color: AppColor.textColor,
                        )),
                        TextSpan(text: ' 10'),
                        TextSpan(text: '    '),
                        WidgetSpan(child: Icon(Icons.share, size: 15, color: AppColor.textColor)),
                        //TextSpan(text: ' share  '),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              openScreen(context, const NewsDetails(newsId: '',));
            },
          );
        }),
      ),
    );
  }
}
