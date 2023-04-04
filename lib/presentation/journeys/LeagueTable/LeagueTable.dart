import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/models/home_category_model.dart';
import 'package:flutter_spoogle_app/presentation/journeys/LeagueTable/LeagueTableDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/models/StandingList/StandingListApiResModel.dart';
import '../../themes/app_color.dart';
import '../../widgets/AppbarIcBack.dart';

class LeagueTable extends StatefulWidget {
  const LeagueTable({Key? key}) : super(key: key);

  @override
  State<LeagueTable> createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  List<HomeCategoryModel> sportList = [];
  late Future<bool> _future;
  bool isApiDataAvailable = false;
  StandingListApiResModel standingList = StandingListApiResModel();

  Future<bool> getDataFromApi() async {
    await ApiFun.apiGet(ApiConstants.standings).then((jsonData) {
      standingList = StandingListApiResModel.fromJson(jsonData);
    });
    if (standingList.status == 1) {
      sportList = addDataInModel(standingList);
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  @override
  void initState() {
    super.initState();
    sportList.clear();
    _future = getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: "League Table", bgColor: Colors.white, isCenterTitle: false),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
                itemCount: sportList.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (_, index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      //padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                        //border: Border.all( color: selectedIndex == index ? Colors.red : Colors.grey, width: 0.5),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bg/blueCornerWave.png'),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 16,
                            color: AppColor.black.withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6, right: 6),
                              child: SvgPicture.network(
                                sportList[index].img,
                                color: Colors.white,
                                height: 45,
                                width: 45,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, bottom: 12),
                              child: Text(
                                sportList[index].title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColor.textColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      openScreen(context, const LeagueTableDetails());
                    },
                  );
                },
              );
            }
            return showSimpleLoaderOverlay();
          }),
    );
  }

  List<HomeCategoryModel> addDataInModel(StandingListApiResModel model) {
    List<HomeCategoryModel> eventList = [];
    model.response?.sportsData?.forEach((element) {
      eventList.add(HomeCategoryModel(title: element.sportsName ?? '', img: element.image ?? ''));
    }); /*
    eventList.add(HomeCategoryModel(title: 'Cricket', img: "assets/images/ic_svg/cricket.svg"));
    eventList.add(HomeCategoryModel(title: 'Soccer', img: "assets/images/ic_svg/soccer.svg"));
    eventList.add(HomeCategoryModel(title: 'MMA', img: "assets/images/ic_svg/MMA.svg"));
    eventList.add(HomeCategoryModel(title: 'Ice Sports', img: "assets/images/ic_svg/ice_sports.svg"));
    eventList.add(HomeCategoryModel(title: 'Golf', img: "assets/images/ic_svg/golf.svg"));
    eventList.add(HomeCategoryModel(title: 'Cycling', img: "assets/images/ic_svg/cycling.svg"));
    eventList.add(HomeCategoryModel(title: 'Chess', img: "assets/images/ic_svg/chess.svg"));
    eventList.add(HomeCategoryModel(title: 'Boxing', img: "assets/images/ic_svg/boxing.svg"));
    eventList.add(HomeCategoryModel(title: 'Basketball', img: "assets/images/ic_svg/basketball.svg"));*/
    return eventList;
  }
}
