import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/data/models/LikeApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/widgets/NewsCategoryWidget.dart';

import '../../../common/constants/strings.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/models/News/NewsDetailsApiResModel.dart';
import '../../themes/app_color.dart';
import '../../widgets/SharePreviewView.dart';
import 'AlsoMayLikeNewsWidget.dart';

class NewsDetails extends StatefulWidget {
  final String newsId;
  final List<String>? listOfTournament;
  const NewsDetails({
    super.key,
    required this.newsId, this.listOfTournament,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late Future<bool> _future;
  NewsDetailsApiResModel newsDetails = NewsDetailsApiResModel();
  final ScrollController _hideButtonController = ScrollController();
  bool isShowViewOption = false;
  bool _isVisible = true;
  bool isApiDataAvailable = false;

  Future<bool> getNewsDetails() async {

    Map<String, dynamic> body = {};
    body['news_id'] = widget.newsId;
    await ApiFun.apiPostWithBody(ApiConstants.newsDetails, body).then((jsonData) {
      newsDetails = NewsDetailsApiResModel.fromJson(jsonData);
    });
    if (newsDetails.status.toString() == '1') {
      isApiDataAvailable = true;
    }
    return isApiDataAvailable;
  }

  @override
  void initState() {
    super.initState();
    _future = getNewsDetails();
    _isVisible = true;
    initListener();
  }

  @override
  void dispose() {
    _hideButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              body: CustomScrollView(
                controller: _hideButtonController,
                slivers: <Widget>[
                  SliverAppBar(
                    snap: true,
                    //pinned: true,
                    floating: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    expandedHeight: Sizes.dimen_30.h,
                    //backgroundColor: Colors.pinkAccent[400],
                    flexibleSpace: FlexibleSpaceBar(
                      /*centerTitle: false,
                    title: const Text(
                      "Cricket",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),*/
                      background: InkWell(
                        onTap: () {
                          isShowViewOption = !isShowViewOption;
                          setState(() {});
                          debugPrint('---- : TAPPED');
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            cachedNetImgWithRadius(
                              newsDetails.response?.details?.image ?? '',
                              double.infinity,
                              double.infinity,
                              AppColor.appCornerRadius,
                              BoxFit.cover,
                            ),
                            isShowViewOption
                                ? SharePreviewViewWidget(
                                    previewLink: newsDetails.response?.details?.image ?? '',
                                    readMoreLink: newsDetails.response?.details?.externalLink ?? '',
                                    title: newsDetails.response?.details?.title ?? '',
                                    text: newsDetails.response?.details?.title ?? '',
                                    link: '${Strings.websiteLink}${ApiConstants.newsDetails}/${newsDetails.response?.details?.newsSlug ?? ''}')
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 12, right: 12),
                                    child: Text.rich(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: AppColor.white, fontSize: 13),
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: InkWell(
                                              child: const Icon(
                                                Icons.thumb_up_outlined,
                                                size: 20,
                                                color: AppColor.white,
                                              ),
                                              onTap: () {
                                                giveLikeOnNews(newsDetails.response?.details?.id.toString()??'');
                                              },
                                            ),
                                          ),
                                          TextSpan(text: '  ${newsDetails.response?.details?.likes ?? ''}'),
                                          const TextSpan(text: '    '),
                                          const WidgetSpan(
                                              child: Icon(
                                            Icons.visibility,
                                            size: 20,
                                            color: AppColor.white,
                                          )),
                                          TextSpan(text: '  ${newsDetails.response?.details?.views ?? ''}'),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    leading: Container(
                      margin: const EdgeInsets.only(top: 16, left: 16),
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          child: Container(
                            //padding: EdgeInsets.only(top: 12, left: 12),
                            color: Colors.black12,
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColor.white,
                              size: 22,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    /*actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],*/
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              newsDetails.response?.details?.title ?? '',
                              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12, bottom: 8),
                              child: NewsCategoryWidget(
                                sportId: '',
                                height: 20,
                                list:widget.listOfTournament,
                              ),
                            ),
                            Text.rich(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black54, fontSize: 11),
                              TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.access_time,
                                      size: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(text: "  ${newsDetails.response?.details?.posted ?? ''}"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              parseHtmlString(
                                newsDetails.response?.details?.longDescription ?? '',
                              ),
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(left: 16, bottom: 8, top: 3),
                height: _isVisible ? Sizes.dimen_16.h : 0,
                child: AlsoMayLikeNewsWidget(
                  alsoLike: newsDetails.response?.youMayAlsoLike ?? [],
                  isVisible: _isVisible,
                  onTap: () {},
                ),
              ));
        }
        return Scaffold(body: showSimpleLoaderOverlay());
      },
    ); //MaterialApp
  }

  void initListener() {
    _hideButtonController.addListener(() {
      debugPrint("listener");
      if (_hideButtonController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          debugPrint("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          debugPrint("**** $_isVisible down");
        });
      }
    });
  }

  void giveLikeOnNews(String id) async {
    try {
      Map<String, dynamic> body = {};
      body['news_id'] = id;
      LikeApiResModel likeApiResModel = LikeApiResModel();
      await ApiFun.apiPostWithBody(ApiConstants.newsLikes, body).then((jsonData) {
        likeApiResModel = LikeApiResModel.fromJson(jsonData);
      });
      if(mounted){
        edgeAlert(context, title: likeApiResModel.message.toString());
      }
    } catch (e) {
      debugPrint('---- News Like api error: $e');
    }
  }
}
