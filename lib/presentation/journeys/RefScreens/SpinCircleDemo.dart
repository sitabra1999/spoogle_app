import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/parallax_image.dart';
import 'package:flutter_spoogle_app/presentation/libraries/spincircle_bottom_bar/SpinCircleBottomBar.dart';
import 'package:flutter_spoogle_app/presentation/libraries/spincircle_bottom_bar/modals.dart';

class SpinCircleDemo extends StatelessWidget {
  final _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("RetroPortal Studio"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        //Adding SpinCircleBottomBarHolder to body of Scaffold
        body: SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(
              circleColors: [Colors.white, Colors.orange, Colors.redAccent],
              iconTheme: const IconThemeData(color: Colors.black45),
              activeIconTheme: const IconThemeData(color: Colors.orange),
              backgroundColor: Colors.white,
              titleStyle: const TextStyle(color: Colors.black45,fontSize: 12),
              activeTitleStyle: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
              actionButtonDetails: SCActionButtonDetails(
                  color: Colors.redAccent,
                  icon: const Icon(
                    Icons.expand_less,
                    color: Colors.white,
                  ),
                  elevation: 6),
              elevation: 8.0,
              items: [
                // Suggested count : 4
                SCBottomBarItem(icon: Icons.verified_user, title: "User", onPressed: () {}),
                SCBottomBarItem(icon: Icons.supervised_user_circle, title: "Details", onPressed: () {}),
                SCBottomBarItem(icon: Icons.notifications, title: "Notifications", onPressed: () {}),
                SCBottomBarItem(icon: Icons.details, title: "New Data", onPressed: () {}),
              ],
              circleItems: [
                //Suggested Count: 3
                SCItem(icon: const Icon(Icons.add), onPressed: () {}),
                SCItem(icon: const Icon(Icons.print), onPressed: () {}),
                SCItem(icon: const Icon(Icons.map), onPressed: () {}),
                SCItem(icon: const Icon(Icons.add), onPressed: () {}),
                SCItem(icon: const Icon(Icons.print), onPressed: () {}),
              ],
              bnbHeight: 80 // Suggested Height 80
          ),
          child: Container(
            color: Colors.orangeAccent.withAlpha(55),
            child: ListView(controller: _controller, children: [
            ParallaxImage(
              image: AssetImage('assets/images/bg/ad-bg.png'),
              // Extent of this widget in scroll direction.
              // In this case it is vertical scroll so extent defines
              // the height of this widget.
              // The image is scaled with BoxFit.fitWidth which makes it
              // occupy full width of this widget.
              // After image is scaled it should normally have height greater
              // than this value to allow for parallax effect to be
              // visible.
              extent: 100.0,
              // Optionally specify child widget.
              child: Text('January'),
              // Optinally specify scroll controller.
              controller: _controller,
            ),
            // ...add more list items
          ])
          ),
        ),
      ),
    );
  }
}