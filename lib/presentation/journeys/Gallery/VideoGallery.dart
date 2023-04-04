import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/constants/strings.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/models/MediaVideo/MediaVideoApiResModel.dart';
import '../../../data/models/MediaVideo/VideoLikeApiResModel.dart';
import '../../libraries/AppContents/NoDataWidget.dart';
import '../../libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import '../../libraries/AppContents/edge_alerts/edge_alerts.dart';
import '../../libraries/AppContents/liquid_pull_to_refresh_and_internet_checker/PullToRefreshAndInternetCheckerWidget.dart';
import '../../libraries/Languages/TranslationConstants.dart';
import '../../libraries/flutter_easy_search_bar/easy_search_bar.dart';
import '../../widgets/NewsCategoryWidget.dart';
import '../NewsDetails/VideoDetails.dart';

class VideoGallery extends StatefulWidget {
  final String title;
  const VideoGallery({Key? key, required this.title}) : super(key: key);

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  bool isApiDataAvailable = false;
  String mediaVideoId = '';
  MediaVideoApiResModel allVideos = MediaVideoApiResModel();
  bool isLastPageLoaded = false;
  int currentIndex = 0;
  final PagingController<int, GenericVideos> _pagingController = PagingController(firstPageKey: 1);
  final int pageSize = 10;
  int nextPage = 0;
  String keyWord = '';
  String pageNo = '';

  Future<MediaVideoApiResModel> getMediaVideoData(String pageKey) async {
    try {
      Map<String, String> jsonBody = {
        'keyword':  keyWord,
        'page_no':  pageNo,
      };
      await ApiFun.apiPostWithBody(ApiConstants.mediaVideo, jsonBody).then((jsonData) {
        allVideos = MediaVideoApiResModel.fromJson(jsonData);
      });
    } catch (e) {
      debugPrint('---- Fetch all media videos api error: $e');
    }

    if (allVideos.status == 1) {
      isApiDataAvailable = true;
    }
    return allVideos;
  }

  Future<void> _fetchVideoPage(String pageKey) async {
    if (!isLastPageLoaded) {
      final videos = await getMediaVideoData(pageKey);
      final isLastPage = (videos.response.genericVideos.length) < pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(videos.response.genericVideos);
      } else {
        int nextPageKey = int.parse(pageKey) + 1;
        _pagingController.appendPage(videos.response.genericVideos, nextPageKey);
      }
      debugPrint('---- Page listening');
    }
  }

  @override
  void initState() {
    super.initState();
    addPageListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
            elevation: 0,
            searchHintText: "Search here...",
            searchBackIconTheme: const IconThemeData(color: Colors.black),
            title: Text(widget.title),
            onSearch: (value) {
              keyWord = value;
              isLastPageLoaded = false;
              refreshPageController();
            },
            asyncSuggestions: null),
        body: PullToRefreshAndInternetCheckerWidget(
          onReload: () {
            setState(() {
              isApiDataAvailable = true;
            });
          },
          child: PagedListView(
            pagingController: _pagingController,
            physics: const BouncingScrollPhysics(),
            builderDelegate: PagedChildBuilderDelegate<GenericVideos>(
              itemBuilder: (context, item, index) {
                return videoTab(context, item);
              },
            ),
          ),
        ),
    );
  }

  String getYouTubeVideoId(String videoLink, int index) {
    return allVideos.response.genericVideos[index].video.split('youtu.be/')[1];
  }

  void addPageListener() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchVideoPage(pageKey.toString());
    });
  }

  Widget videoTab(BuildContext context, GenericVideos item, ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              debugPrint('---- Video details');
              openScreen(
                context,
                VideoDetails(
                    url: item.video,
                    videoId: item.videoid.toString(),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    cachedNetImgWithRadius(item.poster,
                        MediaQuery.of(context).size.width, 200, 0, BoxFit.cover),
                    const Positioned(
                        top: 65,
                        left: 135,
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColor.white,
                          size: 70,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    item.title,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 6),
                  child: NewsCategoryWidget(height: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16,top: 8),
            child: Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColor.textColor, fontSize: 11),
              TextSpan(
                children: [
                  WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          giveLikeOnVideos(item.videoid.toString());
                        },
                        child: const Icon(
                          Icons.thumb_up_outlined,
                          size: 18,
                          color: AppColor.textColor,
                        ),
                      )),
                  TextSpan(text: ' ${item.likes.toString()}'),
                  const TextSpan(text: '    '),
                  const WidgetSpan(
                      child: Icon(
                        Icons.visibility_outlined,
                        size: 19,
                        color: AppColor.textColor,
                      )),
                  TextSpan(text: ' ${item.views.toString()}'),
                  const TextSpan(text: '    '),
                  WidgetSpan(
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.textsms_outlined,
                          size: 18,
                          color: AppColor.textColor,
                        ),
                      )),
                  TextSpan(text: ' ${item.comments.toString()}'),
                  const TextSpan(text: '    '),
                  WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          shareVideo(item.title, item.title, item.slug);
                        },
                        child: const Icon(
                            Icons.share, size: 18, color: AppColor.textColor),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void shareVideo(String? title, String? text, String? link) async {
    String shareLink = '${Strings.websiteLink}${ApiConstants.mediaVideoDetails}/$link';
    await FlutterShare.share(title: title ?? 'Spoogle', text: text ?? 'Spoogle text', linkUrl: shareLink);
  }
  void refreshPageController() {
    _pagingController.removePageRequestListener((pageKey) {});
    _pagingController.refresh();
    setState(() {});
  }

  void giveLikeOnVideos(String id) async {
    try {
      Map<String, dynamic> body = {};
      body['video_id'] = id;
      VideoLikeApiResModel videoLikeApiResModel = VideoLikeApiResModel();
      await ApiFun.apiPostWithBody(ApiConstants.mediaVideoLike, body).then((jsonData) {
        videoLikeApiResModel = VideoLikeApiResModel.fromJson(jsonData);
      });
      if (mounted) {
        edgeAlert(context, title: videoLikeApiResModel.message.toString());
      }
    } catch (e) {
      debugPrint('---- Video Like api error: $e');
    }
  }
}
