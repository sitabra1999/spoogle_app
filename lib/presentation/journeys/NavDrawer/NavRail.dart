import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';

import '../../themes/app_color.dart';

class NavRail extends StatefulWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: getScreenHeight(context), maxWidth: 80,),
        child: IntrinsicHeight(
          child: NavigationRail(
            minWidth: 10,
            groupAlignment: 1.0,
            extended: true,
            //useIndicator: true,
            //indicatorColor: Colors.redAccent,
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              _selectedIndex = index;
              Navigator.pop(context);
            },
            labelType: NavigationRailLabelType.none,
            leading: const Padding(
              padding: EdgeInsets.only(top: 55, bottom: 16),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),
              ),
            ),
            /*trailing: const Text(
              "MENU",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black54),
            ),*/
            selectedLabelTextStyle: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 15,
              letterSpacing: 0.8,
              decoration: TextDecoration.underline,
              decorationThickness: 1.0, fontWeight: FontWeight.bold
            ),
            unselectedLabelTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              letterSpacing: 0.8,
              fontWeight: FontWeight.bold
            ),
            destinations: [
              buildRotatedTextRailDestination("NEWS"),
              buildRotatedTextRailDestination("STORIES",),
              buildRotatedTextRailDestination("TWEETS",),
              buildRotatedTextRailDestination("FREAKOSTATS", ),
              buildRotatedTextRailDestination("LIVE SCORES", ),
              buildRotatedTextRailDestination("CHEER YOUR TEAM", ),
              buildRotatedTextRailDestination("FANTASY TIPS"),
              buildRotatedTextRailDestination("STANDINGS"),
              buildRotatedTextRailDestination("ONLINE GAMES"),
              buildRotatedTextRailDestination("GAME REVIEWS"),
              buildRotatedTextRailDestination("EVENT CALENDAR"),
              buildRotatedTextRailDestination("MEDAL VAULT"),
              buildRotatedTextRailDestination("FORUM"),
              buildRotatedTextRailDestination("POOLS"),
              buildRotatedTextRailDestination("VIDEO GALLERY"),
              buildRotatedTextRailDestination("IMAGE GALLERY"),
              buildRotatedTextRailDestination("DOWN MEMORY LANE"),
              buildRotatedTextRailDestination("TRANSFER DRAFTS"),
              buildRotatedTextRailDestination("PREDICTFOX"),
              buildRotatedTextRailDestination("CLASH OF CARDZ"),
              buildRotatedTextRailDestination("ARCHIVED NEWS"),
            ],
          ),
        ),
      ),
    );
  }

  NavigationRailDestination buildRotatedTextRailDestination(String text) {
    return NavigationRailDestination(
      icon: const SizedBox.shrink(),
      label: RotatedBox(
        quarterTurns: -1,
        child: Container(
          //width: 106,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 24, right: 24),
          margin: const EdgeInsets.only(top: 12, right: 12,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
            border: Border.all(color: Colors.grey.shade300, width: 0.9),
          ),

          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
