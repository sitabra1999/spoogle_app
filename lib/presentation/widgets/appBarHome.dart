
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../libraries/SlideDrawer/flutter_slider_drawer.dart';
import '../themes/app_color.dart';


PreferredSizeWidget appBarHome(BuildContext context, GlobalKey<SliderDrawerState> key, String text) {
  return AppBar(
    titleSpacing: 0,
    centerTitle: true,
    elevation: 0.3,
    toolbarHeight: 65,
    title: Image.asset("assets/images/app/app_logo.png", width: 90, height: 45, fit: BoxFit.contain),
    backgroundColor: AppColor.white,
    leading: IconButton(
      icon: const Icon(Icons.notes, color: AppColor.black, size: 26,),
      onPressed: (){
        if (key.currentState != null) {
          key.currentState!.isDrawerOpen? key.currentState!.closeSlider(): key.currentState!.openSlider();
        }
      },
    ),
    actions: [
      IconButton(
        //padding: const EdgeInsets.only(right: 8.0),
        icon: const Icon(
          CupertinoIcons.search_circle_fill,
          color: Colors.black,
          size: 27,
        ),
        onPressed: () {
           // openScreen(context, MessagesScreen());
        },
      ),
    ],
  );
}
