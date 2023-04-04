import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Stories/StoriesDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import '../../themes/app_color.dart';

class AlsoMayLikeNewsWidget extends StatelessWidget {
  final List<dynamic> alsoLike;
  final bool isVisible;
  final Function onTap;

  const AlsoMayLikeNewsWidget({Key? key, required this.isVisible, required this.onTap, required this.alsoLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      // padding: const EdgeInsets.only(top: 12),
      children: List.generate(alsoLike.length, (index) {
        return InkWell(
          onTap: (){
            openScreen(context, StoriesDetails(factsId: alsoLike[index].factsId.toString()));
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: cachedNetImgWithRadius(
                    alsoLike[index].image ?? '', Sizes.dimen_40.w, Sizes.dimen_40.w, AppColor.appCornerRadius4, BoxFit.cover),
              ),
              Container(
                height: Sizes.dimen_40.w / 2,
                width: Sizes.dimen_40.w,
                padding: EdgeInsets.fromLTRB(6, Sizes.dimen_10.h / 5, 6, 6),
                //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      AppColor.appCornerRadius4,
                    ),
                    bottomRight: Radius.circular(
                      AppColor.appCornerRadius4,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
                child: RichText(
                  //softWrap: false,
                  textScaleFactor: 0.5,
                  //textAlign: TextAlign.start,
                  //strutStyle: StrutStyle(),
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: alsoLike[index].title ?? '',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      TextSpan(
                          text: "\n${alsoLike[index].sportsName ?? ''} ${alsoLike[index].tournament?[0].name ?? ''}",
                          style: const TextStyle(color: Colors.white70, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
