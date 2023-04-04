import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Pools/PoolsCompletedWidget.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlipCard/FlipCard.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../../data/models/home_category_model.dart';
import '../../libraries/tab_container.dart';
import '../../themes/app_color.dart';
import 'PoolsLatestWidget.dart';

class Pools extends StatefulWidget {
  const Pools({Key? key}) : super(key: key);

  @override
  State<Pools> createState() => _PoolsState();
}

class _PoolsState extends State<Pools>  with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int _activeTabIndex = 0;

  final _tabs = [
    const Tab(text: 'LATEST'),
    const Tab(text: 'COMPLETED'),
  ];
  List<HomeCategoryModel> eventList = [];


  @override
  void initState() {
    super.initState();
    eventList = addDataInModel();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_setActiveTabIndex);
  }

  void _setActiveTabIndex() {
    setState(() {
      _activeTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: "LATEST SPORTS POLLS", bgColor: Colors.white, isCenterTitle: false),
      body: Container(
        height: getScreenHeight(context),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: TabContainer(
          color: Colors.grey.shade100,
          tabEdge: TabEdge.right,
          tabStart: 0.1,
          tabEnd: 0.6,
          isStringTabs: false,
          //childPadding: const EdgeInsets.all(0),
          tabs: getPoolSports(),
          selectedTextStyle: const TextStyle(
            color: Colors.red,
            fontSize: 14.0,
          ),
          unselectedTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12.0,
          ),
          children: getPoolsWidget(),
        ),
      ),
    );
  }

  List<Widget> getPoolsWidget() => <Widget>[
        for (int i = 0; i < 5; i++)
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: kToolbarHeight + 8.0,
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.grey.shade300,
                    ),
                    labelColor: AppColor.black,
                    unselectedLabelColor: AppColor.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal, fontSize: 12),
                    tabs: _tabs,
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemBuilder: ((context, index) {
                    return _activeTabIndex == 0 ?
                    FlipCard(
                      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front
                      direction: FlipDirection.HORIZONTAL, // default
                      front: PoolLatestWidget(index: index),
                      back: PoolCompletedWidget(index: index),
                      onFlip: (){},
                      onFlipDone: (isFliped){},
                    ) : PoolCompletedWidget(index: index);
                  }),
                ),
              ),
            ],
          ),
      ];

  List<Widget> getPoolSports() => <Widget>[
    for (int i = 0; i < 5; i++)
      SvgPicture.asset(
        eventList[i].img,
        color: i== 0? AppColor.primaryColor : AppColor.black,
        height: 25,
        width: 25,
      )
  ];

  List<HomeCategoryModel> addDataInModel() {
    List<HomeCategoryModel> eventList = [];
    eventList.add(HomeCategoryModel(title: 'Cricket', img: "assets/images/ic_svg/cricket.svg"));
    eventList.add(HomeCategoryModel(title: 'Soccer', img: "assets/images/ic_svg/soccer.svg"));
    eventList.add(HomeCategoryModel(title: 'MMA', img: "assets/images/ic_svg/MMA.svg"));
    eventList.add(HomeCategoryModel(title: 'Ice Sports', img: "assets/images/ic_svg/ice_sports.svg"));
    eventList.add(HomeCategoryModel(title: 'Golf', img: "assets/images/ic_svg/golf.svg"));
    eventList.add(HomeCategoryModel(title: 'Cycling', img: "assets/images/ic_svg/cycling.svg"));
    eventList.add(HomeCategoryModel(title: 'Chess', img: "assets/images/ic_svg/chess.svg"));
    eventList.add(HomeCategoryModel(title: 'Boxing', img: "assets/images/ic_svg/boxing.svg"));
    eventList.add(HomeCategoryModel(title: 'Basketball', img: "assets/images/ic_svg/basketball.svg"));
    return eventList;
  }
}
