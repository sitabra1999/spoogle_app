import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/widgets/NewsCategoryWidget.dart';
import 'package:flutter_spoogle_app/presentation/widgets/txt_ic_row.dart';
import '../../../common/constants/strings.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/data_sources/data_source_shared_preferences.dart';
import '../../../data/models/LikeApiResModel.dart';
import '../../../data/models/LoginApiResModel.dart';
import '../../../data/models/StatusMessageApiResModel.dart';
import '../../../data/models/Stories/StoriesDetailsApiResModel.dart';
import '../../libraries/AppContents/edge_alerts/edge_alerts.dart';
import '../../libraries/comments_tree/uses/ChatInputField.dart';
import '../../themes/app_color.dart';
import '../../widgets/SharePreviewView.dart';
import '../NewsDetails/AlsoMayLikeNewsWidget.dart';
import '../RefScreens/NewsComments.dart';

class StoriesDetails extends StatefulWidget {
  final String factsId;
  final String? sportsId;
  final List<String>? listOfTournament;

  const StoriesDetails({
    super.key,
    required this.factsId,
    this.listOfTournament,
    this.sportsId,
  });

  @override
  State<StoriesDetails> createState() => _StoriesDetailsState();
}

class _StoriesDetailsState extends State<StoriesDetails> {
  bool isShowOptionView = false;
  late Future<bool> _future;
  StoriesDetailsApiResModel storiesDetails = StoriesDetailsApiResModel();
  final ScrollController _hideButtonController = ScrollController();
  bool _isVisible = true;
  bool isApiDataAvailable = false;
  String profileImage = '';

  Future<bool> getStoriesDetails() async {
    showSimpleLoaderOverlay();
    try {
      Map<String, dynamic> body = {};
      body['facts_id'] = widget.factsId;
      await ApiFun.apiPostWithBody(ApiConstants.storiesDetails, body).then((jsonData) {
        storiesDetails = StoriesDetailsApiResModel.fromJson(jsonData);
      });
      if (storiesDetails.status.toString() == '1') {
        isApiDataAvailable = true;
      }
    } catch (e) {
      debugPrint('---- Stories details api error: $e');
    }
    hideSimpleLoaderOverlay();
    return isApiDataAvailable;
  }

  @override
  void initState() {
    super.initState();
    getProfileImage();
    _future = getStoriesDetails();
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
                physics: const BouncingScrollPhysics(),
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
                          setState(() {
                            isShowOptionView = !isShowOptionView;
                          });
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            cachedNetImgWithRadius(
                              storiesDetails.response?.details?.image ?? '',
                              double.infinity,
                              double.infinity,
                              AppColor.appCornerRadius,
                              BoxFit.cover,
                            ),
                            isShowOptionView
                                ? SharePreviewViewWidget(
                                    previewLink: storiesDetails.response?.details?.image ?? '',
                                    readMoreLink: storiesDetails.response?.details?.externalLink ?? '',
                                    title: storiesDetails.response?.details?.title ?? '',
                                    text: storiesDetails.response?.details?.title ?? '',
                                    link:
                                        '${Strings.websiteLink}${ApiConstants.storiesDetails}/${storiesDetails.response?.details?.articlesSlug ?? ''}')
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
                                              onTap: () {
                                                giveLikeOnStory();
                                              },
                                              child: const Icon(
                                                Icons.thumb_up_outlined,
                                                size: 20,
                                                color: AppColor.white,
                                              ),
                                            ),
                                          ),
                                          TextSpan(text: '  ${storiesDetails.response?.details?.likes ?? ''}'),
                                          const TextSpan(text: '    '),
                                          const WidgetSpan(
                                              child: Icon(
                                            Icons.visibility,
                                            size: 20,
                                            color: AppColor.white,
                                          )),
                                          TextSpan(text: '  ${storiesDetails.response?.details?.views ?? ''}'),
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
                              storiesDetails.response?.details?.title ?? '',
                              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12, bottom: 8),
                              child: NewsCategoryWidget(
                                height: 20,
                                list: widget.listOfTournament,
                                sportId: widget.sportsId,
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
                                  TextSpan(text: "  ${storiesDetails.response?.details?.posted ?? ''}"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              parseHtmlString(
                                (storiesDetails.response?.details?.longDescription ?? '').replaceAll("<p>", '\n'),
                              ),
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const TxtIcRow(
                              icon: Icons.comment_rounded,
                              icColor: AppColor.primaryColor,
                              txtColor: AppColor.black,
                              txt: 'Comment',
                              txtSize: 16,
                              isCenter: false,
                              icSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            if ((storiesDetails.response?.details?.comments ?? []).isNotEmpty)
                              SizedBox(
                                height: (storiesDetails.response?.details?.comments?.length ?? 0) * 120.toDouble() > 399
                                    ? 400
                                    : (storiesDetails.response?.details?.comments?.length ?? 0) * 120.toDouble(),
                                child: NewsComments(
                                  profilePicture: profileImage,
                                  reloadData: () {
                                    debugPrint('---- Reload comment');
                                    _future = getStoriesDetails();
                                    setState(() {});
                                  },
                                  comment: storiesDetails.response?.details?.comments ?? [],
                                  factsId: storiesDetails.response?.details?.factsId.toString() ?? '',
                                ),
                              ),
                            ChatInputField(
                              profileImage: profileImage,
                              onSend: (val1, val2) {
                                sendComment(val1);
                                debugPrint('---- Val1: $val1');
                                // debugPrint('---- parent id: ${data.parentId??''}');
                              },
                            )
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
                  alsoLike: storiesDetails.response?.otherFacts ?? [],
                  isVisible: _isVisible,
                  onTap: () {},
                ),
              ));
        }
        return Scaffold(
          body: showSimpleLoaderOverlay(),
        );
      },
    ); //MaterialApp
  }

  void getProfileImage() async {
    LoginApiResModel loginApiResModel = await AppSharedPreferences().getUserDetails();
    profileImage = loginApiResModel.response?.image ?? '';
    debugPrint('---- : $profileImage');
    setState(() {});
  }

  void sendComment(String comment) async {
    try {
      StatusMessageApiResModel status = StatusMessageApiResModel();
      Map<String, dynamic> body = {};
      body['facts_id'] = storiesDetails.response?.details?.factsId.toString() ?? '';
      body['parent_id'] = '0';
      body['user_id'] = await AppSharedPreferences().getUserId() ?? '0';
      body['comment'] = comment;
      await ApiFun.apiPostWithBody(ApiConstants.storiesComment, body).then((jsonData) {
        status = StatusMessageApiResModel.fromJson(jsonData);
      });

      if (status.status == 1) {
        _future = getStoriesDetails();
        setState(() {});
        debugPrint('---- Message: ${status.message}');
      }
    } catch (e) {
      debugPrint('---- Stories comment api error: $e');
    }
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

  void giveLikeOnStory() async {
    try {
      Map<String, dynamic> body = {};
      body['facts_id'] = widget.factsId;
      LikeApiResModel likeApiResModel = LikeApiResModel();
      await ApiFun.apiPostWithBody(ApiConstants.storiesLike, body).then((jsonData) {
        likeApiResModel = LikeApiResModel.fromJson(jsonData);
      });
      if (mounted) {
        edgeAlert(context, title: likeApiResModel.message.toString());
      }
    } catch (e) {
      debugPrint('---- News Like api error: $e');
    }
  }
}
