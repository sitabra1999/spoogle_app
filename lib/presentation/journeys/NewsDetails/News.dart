import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/data/models/HomePage/AllSportsApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/NewsDetails/NewsDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/drop_shadow.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/data_sources/data_source_shared_preferences.dart';
import '../../../data/models/LikeApiResModel.dart';
import '../../../data/models/News/NewsApiResModel.dart';
import '../../libraries/AppContents/edge_alerts/edge_alerts.dart';
import '../../libraries/flutter_easy_search_bar/easy_search_bar.dart';
import '../../widgets/NewsCategoryWidget.dart';
import '../HomeScreen/NewsImageWidget.dart';
import '../HomeScreen/SubCategoryListWidget.dart';

class AllNewsList extends StatefulWidget {
  final String title;

  const AllNewsList({super.key, required this.title});

  @override
  State<AllNewsList> createState() => _AllNewsListState();
}

class _AllNewsListState extends State<AllNewsList> {
  bool isApiDataAvailable = false;
  String keyWord = '';
  var staticImgList = [
    Strings.imgUrlTopNews1,
    Strings.imgUrlTopNews2,
    Strings.imgUrlTopNews3,
    Strings.imgUrlTopNews4,
    Strings.imgUrlTopNews5,
    Strings.imgUrlTopNews6
  ];
  bool isLastPageLoaded = false;
  int currentIndex = 0;
  final PagingController<int, AllNews> _pagingController = PagingController(firstPageKey: 1);
  final int pageSize = 10;
  int nextPage = 0;
  String sportsId = '';
  String tournamentName = '';
  NewsApiResModel allNews = NewsApiResModel();
  AllSportsApiResModel allSports = AllSportsApiResModel();

  Future<NewsApiResModel> getNewsData(String pageNo) async {
    try {
      String url = '${ApiConstants.news}?sport_id=$sportsId&tournament=$tournamentName&page_no=$pageNo&page_limit=$pageSize&keyword=$keyWord';
      await ApiFun.apiGet(url).then((jsonData) {
        allNews = NewsApiResModel.fromJson(jsonData);
      });
    } catch (e) {
      debugPrint('---- News api res error: $e');
    }
    return allNews;
  }

  List<String> list = [];

  Future<void> _fetchPage(String pageKey) async {
    if (!isLastPageLoaded) {
      final news = await getNewsData(pageKey);
      final isLastPage = (news.response?.allNews?.length ?? 0) < pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(news.response?.allNews ?? []);
      } else {
        int nextPageKey = int.parse(pageKey) + 1;
        _pagingController.appendPage(news.response?.allNews ?? [], nextPageKey);
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBarIcBack(context: context, text: widget.title, bgColor: Colors.white, isCenterTitle: false),
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

      body: Column(
        children: [
          SizedBox(
            height: 42,
            child: SubCategoryListWidget(
              sportsId: sportsId,
              selectedIndex: currentIndex,
              onTap: (value, name) async {
                sportsId = value;
                isLastPageLoaded = false;
                tournamentName = '';
                currentIndex = await getSelectedSportIndex(value);
                refreshPageController();
              },
            ),
          ),
          /*   if ((allNews.response?.allPinnedNews ?? []).isNotEmpty)
            for (int i = 0; i < (allNews.response?.allPinnedNews?.length ?? 0); i++)
              newsTab(context, allNews.response?.allPinnedNews?[i]),*/
          Expanded(
            child: PagedListView<int, AllNews>(
              pagingController: _pagingController,
              physics: const BouncingScrollPhysics(),
              builderDelegate: PagedChildBuilderDelegate<AllNews>(
                itemBuilder: (context, item, index) {
                  return newsTab(context, item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget newsTab(BuildContext context, AllNews item) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropShadow(
            blurRadius: 6,
            offset: const Offset(0.0, 5),
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: Colors.transparent,
                // border: Border.all(color: index == 3 ?  AppColor.primaryColor : AppColor.white),
                borderRadius: BorderRadius.circular(16),
              ),
              child: NewsImageWidget(
                imgUrl: item.image ?? '',
                onTap: (isIncremented) {},
                icSize: 22,
                txtSize: 12,
                isUpDownBtnShowing: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16,right: 16),
            child: Text(
              item.title ?? '',
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          if ((item.tournament ?? []).isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8, left: 16),
              //category and tournament
              child: NewsCategoryWidget(
                height: 20,
                sportId: sportsId.isNotEmpty ? 'blank' : sportsId,
                list: listOfTournament(item),
                onTap: (value) {
                  debugPrint('---- News category value: $value');
                  onTapOnNewsCategory(value, item);
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16),
            child: Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColor.textColor, fontSize: 11),
              TextSpan(
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        giveLikeOnNews(item.newsid.toString());
                      },
                      child: const Icon(
                        Icons.thumb_up_outlined,
                        size: 18,
                        color: AppColor.textColor,
                      ),
                    ),
                  ),
                  TextSpan(text: ' ${item.likes.toString() ?? ''}'),
                  const TextSpan(text: '    '),
                  const WidgetSpan(
                    child: Icon(
                      Icons.visibility_outlined,
                      size: 18,
                      color: AppColor.textColor,
                    ),
                  ),
                  TextSpan(text: ' ${item.views.toString() ?? ''}'),
                  const TextSpan(text: '    '),
                  WidgetSpan(
                      child: InkWell(
                          onTap: () {
                            shareNews(item.title, item.title, item.newsSlug);
                          },
                          child: const Icon(Icons.share, size: 15, color: AppColor.textColor))),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        openScreen(
            context,
            NewsDetails(
              listOfTournament: listOfTournament(item),
              newsId: item.newsid.toString() ?? '',
            ));
      },
    );
  }

  void addPageListener() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey.toString());
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
      if (mounted) {
        edgeAlert(context, title: likeApiResModel.message.toString());
      }
    } catch (e) {
      debugPrint('---- News Like api error: $e');
    }
  }

  void refreshPageController() {
    _pagingController.removePageRequestListener((pageKey) {});
    _pagingController.refresh();
    setState(() {});
  }

  void shareNews(String? title, String? text, String? link) async {
    String shareLink = '${Strings.websiteLink}${ApiConstants.newsDetails}/$link';
    await FlutterShare.share(title: title ?? 'Spoogle', text: text ?? 'Spoogle text', linkUrl: shareLink);
  }

  Future<int> getSelectedSportIndex(String id) async {
    allSports = await AppSharedPreferences().getSportsModel();
    for (int i = 0; i < (allSports.response?.length ?? 0); i++) {
      if (allSports.response?[i].sportId.toString() == id) {
        return i;
      }
    }
    return 0;
  }

  void saveTournamentName(AllNews item, String value) {
    item.tournament?.forEach((element) {
      if (element.name == value) {
        sportsId = item.sportId.toString();
        tournamentName = element.slug ?? '';
        debugPrint('---- Found');
      }
    });
  }

  Future<String> saveSportsId(String value) async {
    await AppSharedPreferences().getSportsModel().then((res) {
      res.response?.forEach((element) {
        debugPrint('---- :$value');
        if (element.sportName == value) {
          sportsId = element.sportId.toString();
        }
      });
    });
    return sportsId;
  }

  void onTapOnNewsCategory(String value, AllNews item) async {
    saveTournamentName(item, value);
    currentIndex = await getSelectedSportIndex(await saveSportsId(value));
    debugPrint('---- current index: $currentIndex');
    debugPrint('---- sports id: $sportsId');
    debugPrint('---- Tournament slug: $tournamentName');
    refreshPageController();
  }

  List<String> listOfTournament(AllNews item) {
    list = [];
    list.add(item.sportsName ?? '');
    item.tournament?.forEach((element) {
      list.add(element.name ?? '');
    });
    return list;
  }
}
