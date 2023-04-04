import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Gallery/VideoGallery.dart';

import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/libraries/comments_tree/uses/ComentsUtils.dart';
import 'package:flutter_spoogle_app/presentation/libraries/comments_tree/uses/comments_step_one_widget.dart';
import 'package:flutter_spoogle_app/presentation/widgets/NewsCategoryWidget.dart';
import 'package:flutter_spoogle_app/presentation/widgets/TxtTxtRow.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/models/MediaVideo/VideoDetailsApiResModel.dart';
import '../../libraries/AppContents/NoDataWidget.dart';
import '../../libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import '../../libraries/Languages/TranslationConstants.dart';
import '../../themes/app_color.dart';
import '../Gallery/AlsoMayLikeNewsVideosWidget.dart';
import 'user_thought_widget.dart';



class VideoDetails extends StatefulWidget {
  final String url;
  final String videoId;

  const VideoDetails({super.key, required this.url, required this.videoId});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late YoutubePlayerController ytController;
  late Future<bool> _future;
  bool isApiDataAvailable = false;
  VideoDetailsApiResModel allVideosDetails = VideoDetailsApiResModel();

  Future<bool> getMediaVideoDetailsData() async {

    Map<String, dynamic> body = {};
    body['video_id'] = widget.videoId;
    await ApiFun.apiPostWithBody(ApiConstants.mediaVideoDetails, body).then((jsonData) {
      allVideosDetails = VideoDetailsApiResModel.fromJson(jsonData);
    });
    if (allVideosDetails.status == 1) {
      isApiDataAvailable = true;
      initListener();
    }
    return isApiDataAvailable;
  }

  @override
  void initState() {
    super.initState();
    _future = getMediaVideoDetailsData();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            if (isApiDataAvailable) {
              return SafeArea(
                child: Scaffold(
                  body: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        snap: true,
                        //pinned: true,
                        floating: true,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        expandedHeight: Sizes.dimen_26.h,
                        //backgroundColor: Colors.pinkAccent[400],
                        flexibleSpace: FlexibleSpaceBar(
                          background: YoutubePlayer(
                            controller: ytController,
                            showVideoProgressIndicator: true,
                            progressColors: const ProgressBarColors(
                              playedColor: Colors.red,
                              handleColor: Colors.redAccent,
                            ),
                            onReady: () {
                              ytController.play();
                            },
                            thumbnail: Image.network(allVideosDetails.response?.details?.poster ?? '', fit: BoxFit.cover,),
                          ),
                        ),
                        leading: Container(
                          margin: const EdgeInsets.only(top: 16, left: 16),
                          // height: 20,
                          // width: 20,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            // color: getRandomColor().withOpacity(0.06),
                            // border: Border.all(color: Colors.grey.shade50),
                          ),
                          child: InkWell(
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColor.white,
                              size: 22,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),

                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (context, index) =>
                              Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(allVideosDetails.response?.details?.title ?? '',
                                      style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.only(top: 16, bottom: 8),
                                      child: NewsCategoryWidget(
                                        height: 18,
                                      ),
                                    ),

                                    Text.rich(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
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
                                          TextSpan(text: ' ${allVideosDetails.response?.details?.posted ?? ''}'),
                                        ],
                                      ),
                                    ),

                                    UserThoughtWidget(
                                      url: allVideosDetails.response?.details?.mainVideo?? '',
                                      videoId: allVideosDetails.response?.details?.id.toString()?? '',
                                      likes: allVideosDetails.response?.details?.likes.toString()?? '',
                                      views: allVideosDetails.response?.details?.views.toString()?? '',
                                      title: allVideosDetails.response?.details?.title?? '',
                                      totalComments: allVideosDetails.response?.details?.totalComments.toString()?? '',),

                                    InkWell(
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 8, top: 3),
                                        child: TxtTxtRow(text1: 'You may also like',
                                          text2: 'View all',
                                          text2Size: 14,
                                          text1Size: 14,
                                          text1Color: Colors.black,
                                          text2Color: AppColor.primaryColor,
                                          isTxt1Bold: false,
                                          isTxt2Bold: false,
                                        ),
                                      ),
                                      onTap: () {
                                        openScreen(context,  const VideoGallery(title: '',));
                                      },
                                    ),

                                    Container(
                                      //padding: const EdgeInsets.only(left: 6),
                                      //margin: const EdgeInsets.only(bottom: 0, top: 3),
                                      height: 190,
                                      alignment: Alignment.topCenter,
                                      child: AlsoMayLikeNewsVideosWidget(
                                        alsoLike: allVideosDetails.response?.otherVideo ?? [],
                                      ),
                                    ),
                                    CommentsStepOneWidget(
                                      comment: allVideosDetails.response!.details!.comments,
                                      header: allVideosDetails.response!.details!.comments != null?  "Comments (${allVideosDetails.response!.details!.comments!.length})" : "Comments",
                                      onTapOnReply: (i) {
                                        showCommentBottomSheetDetails(
                                            context, allVideosDetails.response!.details!.comments?[i].children);
                                      }, parentId: '', videoId: '',),
                                  ],
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else {
              return NoDataFound(
                txt: TranslationConstants.noDataTryAgain.t(context),
                onRefresh: () {
                  if (kDebugMode) {
                    print("here-2");
                  }
                  setState(() {
                    if (kDebugMode) {
                      print('here-3');
                    }isApiDataAvailable = false;
                  });
                },
              );
            }
          } else {
            if (kDebugMode) {
              print("here 5");
            }
            return Scaffold(body: showSimpleLoaderOverlay());
          }
        }
    );//MaterialApp
  }

  void initListener(){
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(allVideosDetails.response?.details?.mainVideo ?? '') ??'',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,

      ),
    );
  }
}
