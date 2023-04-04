import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/presentation/journeys/AppContent/ContactUs/AdboutUs.dart';
import 'package:flutter_spoogle_app/presentation/journeys/AppContent/ContactUs/ContactDetails.dart';
import 'package:flutter_spoogle_app/presentation/journeys/AppContent/ContactUs/LocationWidget.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}


class _ContactUsState extends State<ContactUs> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  void dispose() {
    super.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    // overlays: SystemUiOverlay.values);  // to re-show bars
  }

  static final List<Tab> _tabs = [
    tabWidget("Contacts", Icons.phone),
    tabWidget("Location", Icons.my_location),
    tabWidget("About Us", Icons.info_rounded),
  ];

  static const List<Widget> _views = [
    ContactDetails(),
    Location(),
    AboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: Colors.grey.shade800,
          centerTitle: true,
          title: Padding(padding: const EdgeInsets.only(bottom: 24, top: 16),
            child: RichText(
              textAlign : TextAlign.center,
              softWrap: true,
              //strutStyle: StrutStyle(),
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Get in touch!\n\n\n',
                    style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: Strings.txtLoremIpsumSmall,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      )),
                ],
              ),
              textScaleFactor: 0.5,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            labelStyle: const TextStyle(fontWeight: FontWeight.normal),
            //unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal),
            indicatorWeight: 2,
            indicatorColor: AppColor.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(5),
            indicator: BoxDecoration(
              border: Border.all(color: AppColor.white),
              borderRadius: BorderRadius.circular(6),
              color: AppColor.white,
            ),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            onTap: (int index) {
              debugPrint('Tab $index is tapped');
            },
            enableFeedback: true,
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            tabs: _tabs,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(24, 24, 24, 45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: const TabBarView(
            physics: BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            children: _views,
          ),
        ),
      ),
    );
  }
}
