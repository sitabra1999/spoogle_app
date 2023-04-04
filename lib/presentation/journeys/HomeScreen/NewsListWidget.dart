import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/models/News/NewsApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/NewsImageWidget.dart';
import 'package:flutter_spoogle_app/presentation/widgets/NewsCategoryWidget.dart';

import '../../themes/app_color.dart';


class NewsListWidget extends StatelessWidget {
  final List<String>? dataList;
  final Function onTap;
  final NewsApiResModel news;
  const NewsListWidget({Key? key,  this.dataList, required this.onTap, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 12),
      children: List.generate(news.response?.allNews?.length??0, (index) {
        return Container(
          height: 90,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: const BoxDecoration(
            //color: Colors.blueAccent.withOpacity(0.04),
            //border: Border.all(color: Colors.blue.shade50),
            //border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey.shade100),),
            //borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: NewsImageWidget(imgUrl: news.response?.allNews?[index].image??'', onTap: (isIncremented){}, icSize: 16, txtSize: 12, isUpDownBtnShowing: false,),
                ),
              ),

              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    /*const Text.rich(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      TextSpan(
                        children: [
                          TextSpan(text: "Djokovic pays tribute to federer in heart tribute to federer in heart ",),
                          TextSpan(text: " ...read more", style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),

                    const Text.rich(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54, fontSize: 11),
                      TextSpan(
                        children: [
                          WidgetSpan(
                              child: Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.black54,
                              ),
                          ),
                          TextSpan(text: "  Posted 5 hr ago"),
                        ],
                      ),
                    ),*/

                    Text(news.response?.allNews?[index].title??'',
                        style: const TextStyle(color: Colors.black, fontFamily: 'BalsamiqSans_Regular'),
                    ),

                     NewsCategoryWidget(height: 16),

                    /*const Text(
                      Strings.txtLoremIpsumMid,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: AppColor.black50),
                    ),*/

                    Text.rich(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColor.textColor, fontSize: 11),
                      TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.thumb_up_outlined, size: 18, color: AppColor.textColor,)),
                          TextSpan(text: ' ${news.response?.allNews?[index].likes??''}'),
                          TextSpan(text: '  '),
                          WidgetSpan(child: Icon(Icons.visibility_outlined, size: 18, color: AppColor.textColor,)),
                          TextSpan(text: ' ${news.response?.allNews?[index].views??''}'),
                          TextSpan(text: '  '),/*
                          WidgetSpan(child: Icon(Icons.textsms_outlined, size: 16, color: AppColor.textColor,)),
                          TextSpan(text: ' ${news.response?.allNews?[index].views??''}'),*/
                          TextSpan(text: '                                                   '),
                          /*WidgetSpan(child: Icon(Icons.next_plan_outlined, size: 15, color: AppColor.textColor,)),
                          TextSpan(text: ' share  '),*/
                          WidgetSpan(
                            child: Icon(
                              Icons.access_time_outlined,
                              size: 14,
                              color: AppColor.textColor,
                            ),
                          ),
                          TextSpan(text: " ${news.response?.allNews?[index].posted??''}", ),
                        ],
                      ),
                    ),

                    //Divider(color: Colors.blue.shade100, height: 1)
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

}
