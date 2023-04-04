import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeNavBar.dart';
import 'package:flutter_spoogle_app/presentation/journeys/LeagueTable/LeagueTable.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/News.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Tweets/Tweets.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../../../data/models/AppModel/DrawerModel.dart';
import '../EventCalender/EventCalender.dart';
import '../Freakostats.dart';
import '../Gallery/ImageGallery.dart';
import '../Gallery/VideoGallery.dart';
import '../Pools/Pools.dart';
import '../Stories/Stories.dart';


class NavigationDrawer extends StatefulWidget {
  final Function(String itemTitle) onItemTap;

  const NavigationDrawer({Key? key, required this.onItemTap}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  int selectedIndex = 0;
  int selectedIndexUp = 1;
  int selectedIndexDown = -1;
  @override
  Widget build(BuildContext context) {
    List<DrawerModel> itemList = addItems();
    return Container(
      color: Colors.white,
      //padding: const EdgeInsets.only(bottom: 55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: cachedNetImgWithRadius(Strings.imgUrlPersonSmileCall1, 65, 70, AppColor.appCornerRadius, BoxFit.cover),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const TxtIcRow(txt: 'Elina White    ', txtColor: Colors.black, txtSize: 14, icon: Icons.edit_note,
                        icColor: Colors.black, isCenter: false, fontWeight: FontWeight.bold, icSize: 22,),
                      onTap: (){
                        openScreenWithoutBack(context, const EditProfilePage());
                      },
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Txt(
                        txt: '9956455335',
                        txtColor: Colors.black54,
                        txtSize: 12,
                        fontWeight: FontWeight.normal,
                        padding: 0,
                      ),
                    ),

                    const Txt(
                      txt: 'spoogle@gmail.com',
                      txtColor: Colors.black54,
                      txtSize: 12,
                      fontWeight: FontWeight.normal,
                      padding: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),*/

          Container(
            height: 97,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 36),
            child: const Text(
              "SPOOGLE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.primaryColor),
            ),
          ),
          //const Divider(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              children: List.generate(itemList.length, (index) {
                return Container(
                  height: 55,
                  //margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: index == selectedIndex ?  Colors.white : Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(index == selectedIndexUp ? 30 : 0),
                      bottomRight: Radius.circular(index == selectedIndexDown ? 30 : 0),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    dense: false,
                    title: Text(
                      index == selectedIndex ? itemList[index].title.toUpperCase() : itemList[index].title.capitalize(),
                      style: TextStyle(fontWeight: index == selectedIndex ? FontWeight.bold : FontWeight.normal, fontSize: 14, color: Colors.black),
                    ),
                    //minLeadingWidth: 16,
                    leading: SizedBox(
                      height: 50,
                      width: 55,
                      child: Row(
                        children: [
                          Container(
                            width: 5,
                            //height: 90,
                            margin: const EdgeInsets.only(top: 3, bottom: 3, right: 24),
                            decoration: BoxDecoration(
                              color: index == selectedIndex? AppColor.primaryColorLight : Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),

                          Image.asset(itemList[index].img, width: 22, height: 22, fit: BoxFit.contain),
                        ],
                      ),
                    ),

                    /*
                    subtitle: Padding(
                      padding: const EdgeInsets.only(right: 56),
                      child: Divider(color: Colors.white, thickness: 1,),
                    ),
                    */

                    onTap: () {
                      widget.onItemTap(itemList[index].title);
                      setState(() {
                        selectedIndex=0;
                        // selectedIndex = index;
                        // selectedIndexUp = index + 1;
                        // selectedIndexDown = index - 1;
                      });

                      openScreen(context, itemList[index].widget);
                    },
                  ),
                );
              }),
            ),
          ),

          Container(
            height: 70,
            color: Colors.blue.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  List<DrawerModel> addItems(){
    List<DrawerModel> itemList = [];
    itemList.add(DrawerModel(title: "Home", img: "assets/images/ic_png/menu-bar.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "NEWS", img: "assets/images/ic_png/calendar1.png", isPng: true, widget: const AllNewsList(title: "NEWS")));
    itemList.add(DrawerModel(title: "STORIES", img: "assets/images/ic_png/event.png", isPng: true, widget: const AllStoriesList(title: "STORIES")));
    itemList.add(DrawerModel(title: "TWEETS", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "FREAKOSTATS", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const FreakoStats(title: "FREAKOSTATS")));
    itemList.add(DrawerModel(title: "LIVE SCORES", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "CHEER YOUR TEAM", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "FANTASY TIPS", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "LEAGUE TABLE", img: "assets/images/ic_png/tournament.png", isPng: true, widget: const LeagueTable()));
    itemList.add(DrawerModel(title: "ONLINE GAMES", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "GAME REVIEWS", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "EVENT CALENDAR", img: "assets/images/ic_png/calendar1.png", isPng: true, widget: const EventCalender()));
    itemList.add(DrawerModel(title: "MEDAL VAULT", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "FORUM", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "POOLS", img: "assets/images/ic_png/pool.png", isPng: true, widget: const Pools()));
    itemList.add(DrawerModel(title: "VIDEO GALLERY", img: "assets/images/ic_png/highlight.png", isPng: true, widget: const VideoGallery(title: 'VIDEO GALLERY',)));
    itemList.add(DrawerModel(title: "IMAGE GALLERY", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const ImageGallery()));
    itemList.add(DrawerModel(title: "DOWN MEMORY LANE", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const FreakoStats(title: "DOWN MEMORY LANE")));
    itemList.add(DrawerModel(title: "TRANSFER DRAFTS", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "PREDICTFOX", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "CLASH OF CARDZ", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const HomeNavBar()));
    itemList.add(DrawerModel(title: "ARCHIVED NEWS", img: "assets/images/ic_png/app_logo.png", isPng: true, widget: const FreakoStats(title: "ARCHIVED NEWS")));
    return itemList;
  }
}
