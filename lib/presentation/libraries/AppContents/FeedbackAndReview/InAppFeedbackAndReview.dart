
import 'dart:io';
import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FeedbackAndReview/RatingService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/AppbarIcBack.dart';
import '../liquid_pull_to_refresh_and_internet_checker/PullToRefreshAndInternetCheckerWidget.dart';
import 'ButtonSqNeumorphic.dart';
import 'ReviewSliderSmiley.dart';

// ignore: constant_identifier_names
const KEY = 'FIRST_TIME_OPEN';

class InAppFeedbackAndReview extends StatefulWidget {
  const InAppFeedbackAndReview({Key? key}) : super(key: key);

  @override
  State<InAppFeedbackAndReview> createState() => _InAppFeedbackAndReviewState();
}

class _InAppFeedbackAndReviewState extends State<InAppFeedbackAndReview> {
  final RatingService _ratingService = RatingService();
  bool isFeedbackGiven = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      //"Your opinion matter to us"
      //appBar: appBarIcBack(context, '', Colors.transparent, true,),
      body: PullToRefreshAndInternetCheckerWidget(
        onReload: () {  },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: getScreenWidth(context),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 55),
                  child: Lottie.asset('assets/animations/review-ratings.json',
                      width: getScreenWidth(context) - 100,
                    height: getScreenHeight(context)/4,
                  ),
                ),

                const Text("Feedback", style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.deepOrangeAccent),),

                const Padding(
                  padding: EdgeInsets.fromLTRB(22, 12, 22, 35),
                  child: Text(AppMessages.feedbackTxt,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black54),),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: ReviewSlider(
                      initialValue: 4,
                      circleDiameter: 50,
                      optionStyle: const TextStyle(fontSize: 11),
                      onChange: (int input){
                        // active value is an int number from 0 to 4, where:
                        // 0 is the worst review value
                        // and 4 is the best review value
                        debugPrint("----Feedback input: $input");

                        setState(() {
                          isFeedbackGiven = true;
                        });
                      },
                  ),
                ),

                Text(!isFeedbackGiven ? "Select One" : "Thank You!\n\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                      color: isFeedbackGiven? Colors.deepOrangeAccent : Colors.black54),
                ),

                Visibility(
                  visible: isFeedbackGiven,
                  child: Text("Mind Giving Us A\n5 Start Rating On ${Platform.isAndroid? "Google Play Store": "Apple App Store"} ?",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black54),),
                ),

                //const Text("Code BEll", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Visibility(
        visible: isFeedbackGiven,
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Visibility(
                  visible: Platform.isAndroid,
                  child: InkWell(child: Image.asset('assets/icons/ic_png/playstore.png', width: 170, height: 80, fit: BoxFit.contain,),
                    onTap: (){
                      //launchInBrowser('https://play.google.com/store/search?q=dreamnext&c=apps&hl=en');
                      _ratingService.openStore();
                    },
                  ),
                ),

                Visibility(
                  visible: Platform.isIOS,
                  child: InkWell(child: Image.asset('assets/icons/ic_png/appstore.png', width: 170, height: 80, fit: BoxFit.contain,),
                    onTap: (){
                      //launchUniversalLinkIos('https://play.google.com/store/search?q=dreamnext&c=apps&hl=en');
                      _ratingService.openStore();
                    },
                  ),
                ),


                SizedBox(
                  width: 170,
                  //margin:  const EdgeInsets.only(left: 5),
                  child: ButtonSqNeumorphic(onTap: (){
                    //debugPrint('---- _availability: ${_availability}');
                    _ratingService.isSecondTimeOpen().then((secondOpen) {
                      if (secondOpen) {
                        _ratingService.showRating();
                      }
                    });

                  },),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
