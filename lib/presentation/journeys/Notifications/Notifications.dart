import 'dart:async';

import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/NotificationApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/StatusMessageApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/NoDataWidget.dart';
import 'package:flutter_spoogle_app/presentation/widgets/IcTxtRow.dart';

import '../../themes/app_color.dart';
import '../../widgets/ImgTxtRow.dart';
import 'NotificationListWidget.dart';
import 'appbar_notification.dart';

// Page details: List of Notifications showing in this screen that has sent to user device.

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<bool> _future;
  bool isApiDataAvailable = true;
  NotificationApiResModel model = NotificationApiResModel();
  

  @override
  void initState() {
    super.initState();
    _future = getDataFromApi();
  }

  Future<bool> getDataFromApi() async {
    try{
      String? userId = await AppSharedPreferences().getUserId();
      Map<String, dynamic> body = {};
      body['user_id'] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.notifications, body).then((jsonDecodeData) => {
        model = NotificationApiResModel.fromJson(jsonDecodeData),
      });

      if(model.status == 1) {
        isApiDataAvailable = true;
      }
    } catch(error){
      if (kDebugMode) {
        print("Error: $error");
      }
    }
    return isApiDataAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarNotification(context, (){
        Future.delayed(const Duration(seconds: 10), () {
          hideSimpleLoaderOverlay();
        });
      }),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData  && snapShot.connectionState == ConnectionState.done){
            if(isApiDataAvailable){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    //backgroundColor: Colors.grey.shade200,
                    appBar: TabBar(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      labelPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      indicatorColor: AppColor.primaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        //border: Border.all(color: AppColor.grey),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red.shade100,
                      ),
                      tabs: const [
                        ImgTxtRow(txt: "All", txtColor: Colors.black, txtSize: 16, fontWeight: FontWeight.bold,
                            icon: "assets/images/ic_png/hamburger.png", icSize: 25, ),
                        ImgTxtRow(txt: "Order", txtColor: Colors.black, txtSize: 16, fontWeight: FontWeight.bold,
                            icon: "assets/images/ic_png/washing_machine.png", icSize: 25, ),
                        ImgTxtRow(txt: "Promotion", txtColor: Colors.black, txtSize: 16, fontWeight: FontWeight.bold,
                            icon: "assets/images/ic_png/offer.png", icSize: 25,),
                      ],
                    ),
                    body: const TabBarView(
                      children: <Widget>[
                        NotificationListWidget(),
                        NotificationListWidget(),
                        NotificationListWidget(),
                      ],
                    ),
                  ),
                ),
              );
            }
            else { return NoDataFound(txt: 'Notification not found', onRefresh: (){});}
          } else {return showSimpleLoaderOverlay();}
        },
      ),
    );
  }

  void clearAllNotification() async {
    try{
      //showLottieLoadingDialog(context, 'Loading...','assets/animations/lottie-imageon');
      String? userId = await AppSharedPreferences().getUserId();
      Map<String, dynamic> body = {};
      body['user_id'] = userId;

      await ApiFun.apiPostWithBody(ApiConstants.notifications, body).then((jsonDecodeData) {
        StatusMessageApiResModel statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!);
      });
      isApiDataAvailable = false;
      setState(() {
        _future = getDataFromApi();});
    } catch(error){
      if (kDebugMode) {
        print("Error: $error");
      }
    }
  }
}