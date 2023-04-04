import 'dart:async';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/AdvertisementApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/News/NewsApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/StatusMessageApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/WhatTheySaid/WhatTheySaidApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Freakostats.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/EventsWidget.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/NewsListWidget.dart';
import 'package:flutter_spoogle_app/presentation/journeys/HomeScreen/TopNewsSlider.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/NewsDetails.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/VideoDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/FirebaseNotificationImpl.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/TranslationConstants.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/TxtTxtRow.dart';

import '../../../data/data_sources/api_functions.dart';
import '../../../data/models/HomePage/AllSportsApiResModel.dart';
import '../../../data/models/News/BreakingNewsApiResModel.dart';
import '../../libraries/AppContents/NoDataWidget.dart';
import '../../libraries/AppContents/liquid_pull_to_refresh_and_internet_checker/PullToRefreshAndInternetCheckerWidget.dart';
import '../../widgets/AppDialog.dart';
import '../NewsDetails/News.dart';
import '../RefScreens/SpinCircleDemo.dart';
import 'SubCategoryListWidget.dart';
import 'WhatTheySaidSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = "yesterday", monthRange = "", firebaseToken = "", cityName = "Your location";
  late Future<bool> _future;
  bool isApiDataAvailable = false;
  int currentIndex=0;
  AdvertisementApiResModel servicesApiResModel = AdvertisementApiResModel();
  var staticImgList1 = [Strings.imgUrlAdBanner, Strings.imgUrlAdBanner2, Strings.imgUrlAdBanner3, Strings.imgUrlAdBanner4];
  var staticImgList2 = [
    Strings.imgUrlTopNews1,
    Strings.imgUrlTopNews2,
    Strings.imgUrlTopNews3,
    Strings.imgUrlTopNews4,
    Strings.imgUrlTopNews5,
    Strings.imgUrlTopNews6
  ];
  WhatTheySaidApiResModel whatTheySaid = WhatTheySaidApiResModel();
  BreakingNewsApiResModel breakingNews = BreakingNewsApiResModel();
  NewsApiResModel allNews = NewsApiResModel();
  AllSportsApiResModel sports = AllSportsApiResModel();

  Future<bool> getWhatTheySaid() async {
    await ApiFun.apiGet(ApiConstants.whatTheySaid).then((jsonData) {
      whatTheySaid = WhatTheySaidApiResModel.fromJson(jsonData);
    });
    if (whatTheySaid.status == 1) {
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  Future<bool> _getAllSports()async{
    try{
      await ApiFun.apiPostWithBody(ApiConstants.sports, {}).then((jsonData) {
        sports=AllSportsApiResModel.fromJson(jsonData);
        AppSharedPreferences().saveSportsModel(jsonData);
      });
    }
    catch(e){
      debugPrint('---- Fetch all sports api error: $e');
    }

    if(sports.status.toString()=='1'){
      return true;
    }

    return false;
  }




  @override
  void initState() {
    super.initState();
    _getAllSports();
    breakingNewsData('','');
    someNewsData();
    _future = getWhatTheySaid();
  }

  @override
  void dispose() {
    LoaderOverlay.hide();
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PullToRefreshAndInternetCheckerWidget(
          child: FutureBuilder(
            future: _future,
            builder: (context, snapShot) {
              if (snapShot.hasData && snapShot.connectionState == ConnectionState.done) {
                if (isApiDataAvailable) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // const Divider(),
                       /* SizedBox(
                          height: 42,
                          child: SubCategoryListWidget(
                            selectedIndex: currentIndex,
                            onTap: (sportsId,name) async{
                                breakingNewsData(sportsId,name);
                            },
                          ),
                        ),*/
                        /*InkWell(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 6),
                            child: TxtTxtRow(
                              text1: 'TOP NEWS',
                              text2: 'VIEW ALL',
                              text2Size: 13.5,
                              text1Size: 14,
                              text1Color: Colors.black,
                              text2Color: AppColor.primaryColor,
                              isTxt1Bold: true,
                              isTxt2Bold: true,
                            ),
                          ),
                          onTap: () {
                            //openScreen(context,  WorkoutDetailsPage());\
                          },
                        ),*/
                        if((breakingNews.response??[]).isNotEmpty)
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(right: 16, left: 8),
                            height: Sizes.dimen_22.h,
                            child: TopNewsSliderCarousel(
                              model: breakingNews,
                            ),
                          ),
                          onTap: () {
                            openScreen(
                                context,
                                const NewsDetails(
                                 newsId: '',
                                ),
                            );
                          },
                        ),
                        EventsWidget(onTap: (index) {

                        }),
                        InkWell(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 6),
                            child: TxtTxtRow(
                              text1: 'WHAT THEY SAID',
                              text2: 'VIEW ALL',
                              text2Size: 13.5,
                              text1Size: 14,
                              text1Color: Colors.black,
                              text2Color: AppColor.primaryColor,
                              isTxt1Bold: true,
                              isTxt2Bold: true,
                            ),
                          ),
                          onTap: () {
                            //openScreen(context, const TableViewDemo1());
                            openScreen(context, SpinCircleDemo());
                          },
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(16, 4, 16, 5),
                            height: Sizes.dimen_10.h,
                            width: double.infinity,
                            child: WhatTheySaidSlider(
                              model: whatTheySaid,
                            ),
                          ),
                          onTap: () {
                            openScreen(context,  const VideoDetails(
                              url: 'https://youtu.be/8S5lApwP3yo',
                              videoId: '8S5lApwP3yo',
                            ));
                          },
                        ),
                        InkWell(
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: TxtTxtRow(
                              text1: 'NEWS',
                              text2: 'VIEW ALL',
                              text2Size: 13.5,
                              text1Size: 14,
                              text1Color: Colors.black,
                              text2Color: AppColor.primaryColor,
                              isTxt1Bold: true,
                              isTxt2Bold: true,
                            ),
                          ),
                          onTap: () {
                            openScreen(context, const AllNewsList(title: 'News',));
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                          height: 700,
                          //width: double.infinity,
                          child: NewsListWidget(
                            news: allNews,
                            onTap: () {
                              openScreen(
                                  context,
                                  const NewsDetails(
                                   newsId: '',
                                  ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return NoDataFound(
                    txt: TranslationConstants.noDataTryAgain.t(context),
                    onRefresh: () {
                      setState(() {
                        isApiDataAvailable = false;
                        _future = getWhatTheySaid();
                      });
                    },
                  );
                }
              } else {
                return showSimpleLoaderOverlay();
              }
            },
          ),
          onReload: () {
            setState(() {
              isApiDataAvailable = true;
              _future = getWhatTheySaid();
            });
          },
        ),
      ),
    );
  }


  void breakingNewsData(String sportsId,String categoryName) async {
    await ApiFun.apiGet(ApiConstants.breakingNews).then((jsonData) {
      breakingNews = BreakingNewsApiResModel.fromJson(jsonData);
    });
    if ((breakingNews.response??[]).isNotEmpty) {
      currentIndex = await getSelectedSportIndex(sportsId);
      staticImgList2.clear();
      breakingNews.response?.forEach((element) {
        staticImgList2.add(element.image??'');
      });
      setState(() {

      });
    }
    else{
      if(mounted){
        showToast(context,"No news found in $categoryName");
      }
    }

  }
  void someNewsData() async {
    String url='${ApiConstants.news}?sport_id=&tournament&page_no=1&page_limit=10';
    await ApiFun.apiGet(url).then((jsonData) {
      allNews = NewsApiResModel.fromJson(jsonData);
    });
    if (allNews.status == 1) {
      staticImgList2.clear();
      allNews.response?.allNews?.forEach((element) {
        staticImgList2.add(element.image??'');
      });
      setState(() {

      });
    }

  }


  Future<int> getSelectedSportIndex(String id) async {
    AllSportsApiResModel allSports = await AppSharedPreferences().getSportsModel();
    for (int i = 0; i < (allSports.response?.length ?? 0); i++) {
      if (allSports.response?[i].sportId.toString() == id) {
        return i;
      }
    }
    return 0;
  }

  Future<bool> showExitPopup(context) async{
    return await showDialog(context: context, builder: (BuildContext context) => AppDialog(
      title: 'Do you want to exit ?',
      description: '',
      isBtn1Visible: true,
      button1Text: 'No',
      button2Text: 'Yes',
      onPositiveBtnPressed: (){
        exit(0);
      },
    ),
    );
  }

/* void initAwesomeAndFirebaseNotification() {
    try {
      AwesomeAndFirebaseNotificationImpl().checkBasicNotificationPermission(context);

      //Init firebase Notifications for token
      AwesomeAndFirebaseNotificationImpl().initFirebaseNotificationImpl(context, (firebaseAppToken) async {
        debugPrint('----firebaseAppToken at HomeScreen : $firebaseAppToken');

        //save Firebase Token In Local Db
        AppSharedPreferences().saveFirebaseToken(firebaseAppToken);

        String? userId = await AppSharedPreferences().getUserId();

        if (userId != null || userId!.isNotEmpty) {
          // Send firebaseAppToken to server
          Map<String, dynamic> body = {};
          body['user_id'] = userId;
          body['device_type'] = Platform.isAndroid ? "Android" : "iOS";
          body['device_token'] = firebaseAppToken;
          body['device_information'] = "";

          //debugPrint('---- : $userId , $firebaseAppToken ${Platform.isAndroid? "Android" : "iOS"}');

          await ApiFun.apiPostWithBody(ApiConstants.updateDeviceToken, body).then((jsonDecodeData) {
            StatusMessageApiResModel statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
            debugPrint('----updateDeviceToken msg : ${statusMessageApiResModel.message}');
            // edgeAlert(context, title: AppMessages.message, description: statusMessageApiResModel.message!);
          });
        }
      });
    } catch (error) {
      debugPrint("initAwesomeAndFirebaseNotification Error: $error");
    }
  }*/
}
