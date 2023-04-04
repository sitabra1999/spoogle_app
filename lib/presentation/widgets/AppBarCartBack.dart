
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Notifications/Notifications.dart';
import 'package:provider/provider.dart';
import '../libraries/Badges/badges.dart';
import '../themes/app_color.dart';


PreferredSizeWidget appBarCart(BuildContext context, String text) {
  return AppBar(
    centerTitle: false,
    elevation: 0,
    toolbarHeight: 65,
    title: Text(text, style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
    backgroundColor: AppColor.white,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
    actions: [
      IconButton(
        //padding: const EdgeInsets.only(right: 8.0),
        icon: const Icon(
          CupertinoIcons.search,
          size: 25,
          color: Colors.black,
        ),
        onPressed: () {

        },
      ),

      IconButton(
        //padding: const EdgeInsets.only(right: 8.0),
        icon: const Icon(
          Icons.notifications_none,
          size: 25,
          color: Colors.black,
        ),
        onPressed: () {
          openScreen(context, const Notifications());
        },
      ),

      IconButton(
        icon: const Icon(CupertinoIcons.shopping_cart, color: Colors.black,),
        onPressed: () {
          //openScreen(context, const Cart());
        },
      ),
    ],
  );
}
