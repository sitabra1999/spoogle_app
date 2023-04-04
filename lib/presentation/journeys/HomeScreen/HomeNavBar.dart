import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Auth/LoginScreen.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/HomeScreen.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/SlideDrawer/flutter_slider_drawer.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../../data/data_sources/data_source_shared_preferences.dart';
import '../../libraries/Languages/TranslationConstants.dart';
import '../../widgets/AppDialog.dart';
import '../NavDrawer/navigation_drawer.dart' as navDrawer;
import '../SpoogleWidgets/SpoogleWidgets.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  int _selectedIndex = 0;
  final GlobalKey<SliderDrawerState> _sliderDrawerStateKey = GlobalKey<SliderDrawerState>();

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _sliderDrawerStateKey,
        sliderOpenSize: 200,
        //slideDirection : SlideDirection.TOP_TO_BOTTOM,
        //sliderShadow : SliderShadow.,
        appBar: SliderAppBar(
          appBarColor: Colors.white,
          appBarHeight: 90,
          appBarPadding: const EdgeInsets.only(top: 36, left: 6, right: 6),
          title: Image.asset("assets/images/app/app_logo.png", width: 100, height: 50, fit: BoxFit.contain),
          /*drawerIcon: !_sliderDrawerStateKey.currentState!.isDrawerOpen ? Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset("assets/images/ic_png/menu-bar.png", width: 25, height: 25, fit: BoxFit.contain),
          ) : const CloseButton(),*/
          trailing: IconButton(
            //padding: const EdgeInsets.only(right: 8.0),
            icon: const Icon(
              CupertinoIcons.search_circle_fill,
              color: Colors.black,
              size: 29,
            ),
            onPressed: () {
              // openScreen(context, MessagesScreen());
            },
          ),
        ),
        slider: navDrawer.NavigationDrawer(
          onItemTap: (String itemTitle) {
            _sliderDrawerStateKey.currentState!.closeSlider();
            setState(() {

              //this.itemTitle = itemTitle;
            });
          },
        ),
        child: Center(child: _pages.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: SizedBox(
            height: 60,
            child: BottomAppBar(
              notchMargin: 12,
              color: Theme.of(context).primaryColor.withAlpha(255),
              elevation: 12,
              // ← removes slight shadow under FAB, hardly noticeable
              shape: const CircularNotchedRectangle(),
              // ← carves notch for FAB in BottomAppBar
              child: BottomNavigationBar(
                elevation: 0,
                // 0 removes ugly rectangular NavBar shadow
                selectedItemColor: AppColor.secondaryColor,
                unselectedItemColor: Colors.black,
                backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
                selectedFontSize: 12,
                unselectedFontSize: 10,
                showUnselectedLabels: true,
                unselectedLabelStyle: const TextStyle(color: Colors.black54),
                selectedIconTheme: const IconThemeData(size: 25),
                unselectedIconTheme: const IconThemeData(size: 22),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball_rounded),
                    label: 'Sports Central',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_search),
                    label: 'Browse',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
      // CRITICAL for body flowing under FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openLogoutDialog(context);

          //showSpoogleWidgetsDialog(context);

         /* Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => const SpoogleWidgets(),
            ),
          );*/
        },
        backgroundColor: Colors.white,
        tooltip: 'Home',
        elevation: 6,
        splashColor: Colors.grey,
        //child: Icon(Icons.category, color: Colors.blue,),
        child: Image.asset("assets/images/app/app_logo.png", width: 45, height: 45, fit: BoxFit.contain),
      ),
    );
  }

  void openLogoutDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) => AppDialog(
      title:'${TranslationConstants.logoutCaps.t(context)} ?',
      description: TranslationConstants.logoutDialogContent.t(context),
      isBtn1Visible: true,
      button1Text: TranslationConstants.cancel.t(context),
      button2Text: TranslationConstants.logout.t(context),
      onPositiveBtnPressed: (){
        AppSharedPreferences().removeUserSfData();
        openScreenWithoutBack(context, const LoginScreen());
      },
    ),
    );
  }
}
