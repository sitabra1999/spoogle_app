import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/models/home_category_model.dart';
import 'package:flutter_spoogle_app/presentation/journeys/EventCalender/EventCalender.dart';
import 'package:flutter_spoogle_app/presentation/journeys/FeaturedEvent/FeaturedEvent.dart';
import 'package:flutter_spoogle_app/presentation/journeys/LeagueTable/LeagueTable.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/VideoDetails.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Pools/Pools.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/txt.dart';

import '../../../common/constants/strings.dart';

class EventsWidget extends StatelessWidget {
  final Function(int index) onTap;

  const EventsWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<HomeCategoryModel> eventList = addDataInModel();

    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.06),
        borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
        //border: Border.all(color: Colors.white),
      ),
      child: GridView.count(
        shrinkWrap: false,
        crossAxisCount: 4,
        childAspectRatio: 1.2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(eventList.length, (index) {
          return InkWell(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
                // color: getRandomColor().withOpacity(0.06),
                // border: Border.all(color: Colors.grey.shade50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(eventList[index].img, width: 28, height: 28, fit: BoxFit.contain),
                  ),

                  Txt(
                    txt: eventList[index].title.toUpperCase(), txtColor: Colors.black, txtSize: 11, fontWeight: FontWeight.bold, padding: 0,
                  ),
                ],
              ),
            ),
            onTap: () {
              //onTap(index);
              getScreen(context, index);
            },
          );
        }),
      ),
    );
  }
  
  List<HomeCategoryModel> addDataInModel() {
    List<HomeCategoryModel> eventList = [];
    eventList.add(HomeCategoryModel(title: 'Calendar', img: "assets/images/ic_png/calendar1.png"));
    eventList.add(HomeCategoryModel(title: 'Event', img: "assets/images/ic_png/events.png"));
    eventList.add(HomeCategoryModel(title: 'Pool', img: "assets/images/ic_png/pool.png"));
    eventList.add(HomeCategoryModel(title: 'League Table', img: "assets/images/ic_png/tournament.png"));
    eventList.add(HomeCategoryModel(title: 'Highlight', img: "assets/images/ic_png/highlight.png"));
    eventList.add(HomeCategoryModel(title: 'More', img: "assets/images/ic_png/league.png"));
    eventList.add(HomeCategoryModel(title: 'More', img: "assets/images/ic_png/leagueTable.png"));
    eventList.add(HomeCategoryModel(title: 'More', img: "assets/images/ic_png/tournament.png"));

    return eventList;
  }

  void getScreen(BuildContext context, int index) {
    late Widget screen;
    switch(index){
      case 0:
        screen = const EventCalender();
        break;
      case 1:
        screen = const FeaturedEvent();
        break;
      case 2:
        screen = const Pools();
        break;
      case 3:
        screen = const LeagueTable();
        break;
      case 4:
        screen =  const VideoDetails(url: Strings.youTubeVideo1, videoId: '8S5lApwP3yo',);
        break;
      case 5:
        screen = const LeagueTable();
        break;
    }

    openScreen(context, screen);
  }
}
