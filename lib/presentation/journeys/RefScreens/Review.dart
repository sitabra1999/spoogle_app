import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/star_rating.dart';

import '../../../data/data_sources/data_source_shared_preferences.dart';
import '../../../data/models/AdvertisementApiResModel.dart';
import '../../../data/models/StatusMessageApiResModel.dart';
import '../../libraries/AppContents/NoDataWidget.dart';
import '../../libraries/AppContents/ProgressLibs/LottieLoading.dart';
import '../../libraries/AppContents/flutter_animator/flutter_animator.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import '../../widgets/AppbarIcBack.dart';
import '../../widgets/txt.dart';


class Review extends StatefulWidget {
  static const String routeName = '/review';

  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {

  late Future<bool> _future;
  late bool isApiDataAvailable = true;
  StatusMessageApiResModel statusMsgModel = StatusMessageApiResModel();


  @override
  void initState() {
    super.initState();

    //_future = getDataFromApi();
  }


  Future<bool> getDataFromApi() async {
    try {
      await ApiFun.apiGet(ApiConstants.advertisements).then((jsonDecodeData){
        statusMsgModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
      });
    } catch (error) {
      debugPrint("----Error: $error");
    }
    return isApiDataAvailable;
  }



  @override
  Widget build(BuildContext context) {
    _future = getDataFromApi();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appBarIcBack(context: context, text: 'Reviews', bgColor: Colors.white, isCenterTitle: true),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData){
            if(isApiDataAvailable && snapShot.connectionState == ConnectionState.done){
              return buildUi([]);
            }
            else { return NoDataFound(txt: "Review or rating is not given yet", onRefresh: (va){

            });}
          } else {
            return const LottieLoading();
          }
        },
      ),
    );
  }

  Widget buildUi(List<Response> response) {
    return FadeInUpBig(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, top: 8),
        //color: Colors.white,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            //itemCount: response.length,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 3),
                          child: cachedNetImgWithRadius(Strings.imgUrlNotFoundYellowAvatar, 50, 50, 3, BoxFit.cover),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(6, 5, 5, 0),
                              child: Text(
                                'Title',
                                style: TextStyle( fontSize: 14, color: Colors.black87, letterSpacing: 0.5),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 3, 8, 0),
                                  child: StarRating(
                                    rating: double.parse("4"),
                                    color: Colors.amber,
                                    //iconSize: 20,
                                    onRatingChanged: (double rating) {  },
                                  ),
                                ),

                                const Text(
                                  "300",
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 12, left: 3),
                      child: Text(
                        'Review',
                        style: TextStyle( fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "review By",
                          style: TextStyle( fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
                        ),

                        /*const Text(
                                '25 jan, 2021',
                                style: TextStyle( fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54),
                       ),*/
                      ],
                    ),

                    InkWell(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 8, left: 4,),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent.withOpacity(0.1),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        alignment: Alignment.center,
                        child: const Txt(
                          txt: 'Delete',
                          txtColor: Colors.black,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                        ),
                      ),
                      onTap: () async {
                        // deleteReview(response[index].reviewId.toString());
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }



  void deleteReview(String reviewId) async {
    try{
      showCustomLoaderOverlay(context);

      Map<String, dynamic> body = {};
      body["review_id"] = reviewId;

      await ApiFun.apiPostWithBody(ApiConstants.getVisitors, body).then((jsonDecodeData) => {
        statusMsgModel = StatusMessageApiResModel.fromJson(jsonDecodeData),
        edgeAlert(context, title: 'Message', description: statusMsgModel.message!),
      });

      if (statusMsgModel.status == 1) {
        setState(() {
          _future = getDataFromApi();
        });
      }
    } catch(error){
      print("Error: $error");
    }
  }
}