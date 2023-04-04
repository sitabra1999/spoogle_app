import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/models/home_category_model.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/NewsDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import '../../../common/extensions/RandomColorHelper.dart';
import '../../themes/app_color.dart';
import '../../widgets/AppbarIcBack.dart';

class FeaturedEvent extends StatefulWidget {
  const FeaturedEvent({Key? key}) : super(key: key);

  @override
  State<FeaturedEvent> createState() => _FeaturedEventState();
}

class _FeaturedEventState extends State<FeaturedEvent> {
  List<HomeCategoryModel> sportList = [];

  @override
  void initState() {
    super.initState();

    sportList = addDataInModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: "Featured Event", bgColor: Colors.white, isCenterTitle: false),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
        itemCount: sportList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (_, index) {
          Color color = RandomHexColorBlueAndRed().colorRandom();
          return InkWell(
            child: Container(
              margin: const EdgeInsets.all(8),
              //padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: const BorderRadius.all(
                    Radius.circular(
                        AppColor.appCornerRadius)),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: AppColor.white),
                      color: AppColor.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 12,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: index == 1 || index == 3 || index == 4 || index == 6 ? cachedNetImage("https://spoogle.in/uploads/tournament/ICC_T20_World_Cup_2022_Official_logo-1663055212.jpg") :
                    Text(
                      sportList[index].title.isNotEmpty ? sportList[index].title[0] : "",
                      textAlign: TextAlign.center,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      sportList[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: AppColor.black70),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              openScreen(context, const NewsDetails(newsId: '',));
            },
          );
          },
      ),
    );
  }

  List<HomeCategoryModel> addDataInModel() {
    List<HomeCategoryModel> eventList = [];
    eventList.add(HomeCategoryModel(title: 'Highlight', img: "assets/images/ic_svg/cricket.svg"));
    eventList.add(HomeCategoryModel(title: "ICC Women's T20 World Cup 2023", img: "assets/images/ic_svg/soccer.svg"));
    eventList.add(HomeCategoryModel(title: 'Big Bash League', img: "assets/images/ic_svg/MMA.svg"));
    eventList.add(HomeCategoryModel(title: '2022 World Series', img: "assets/images/ic_svg/ice_sports.svg"));
    eventList.add(HomeCategoryModel(title: "Men's Rugby League World Cup 2022", img: "assets/images/ic_svg/golf.svg"));
    eventList.add(HomeCategoryModel(title: "Women's Rugby World Cup 2022", img: "assets/images/ic_svg/cycling.svg"));
    eventList.add(HomeCategoryModel(title: "T20 World Cup 2022", img: "assets/images/ic_svg/chess.svg"));
    eventList.add(HomeCategoryModel(title: "UEFA Champions League", img: "assets/images/ic_svg/boxing.svg"));
    return eventList;
  }
}
