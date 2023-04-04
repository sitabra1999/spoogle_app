import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/data/models/HomePage/AllSportsApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/Stories/AllStoriesApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/Stories/StoriesDetails.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/drop_shadow.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/data_sources/data_source_shared_preferences.dart';
import '../../../data/models/LikeApiResModel.dart';
import '../../libraries/flutter_easy_search_bar/easy_search_bar.dart';
import '../../widgets/NewsCategoryWidget.dart';
import '../HomeScreen/NewsImageWidget.dart';
import '../HomeScreen/SubCategoryListWidget.dart';

class AllStoriesList extends StatefulWidget {
  final String title;

  const AllStoriesList({super.key, required this.title});

  @override
  State<AllStoriesList> createState() => _AllStoriesListState();
}

class _AllStoriesListState extends State<AllStoriesList> {
  int currentPageKey = 0;
  var staticImgList = [
    Strings.imgUrlTopNews1,
    Strings.imgUrlTopNews2,
    Strings.imgUrlTopNews3,
    Strings.imgUrlTopNews4,
    Strings.imgUrlTopNews5,
    Strings.imgUrlTopNews6
  ];
  List<String> list = [];
  bool isLastPageLoaded = false;
  int currentIndex = 0;
  String tournamentName = '';
  AllSportsApiResModel allSports = AllSportsApiResModel();
  AllStoriesApiResModel allStories = AllStoriesApiResModel();
  final PagingController<int, AllFacts> _pagingController = PagingController(firstPageKey: 1);
  final int pageSize = 10;
  String sportsId = '';
  String keyWord = '';

  Future<AllStoriesApiResModel> getStoriesData(String pageNo) async {
    String url =
        '${ApiConstants.stories}?sport_id=$sportsId&tournament=$tournamentName&page_no=$pageNo&page_limit=$pageSize&keyword=$keyWord';
    await ApiFun.apiGet(url).then((jsonData) {
      allStories = AllStoriesApiResModel.fromJson(jsonData);
    });
    if (allStories.status.toString() == '1') {
      //when data is loaded from api then pageController will load data in page
      debugPrint('---- API hit');
      return allStories;
    }
    return allStories;
  }

  Future<void> _fetchPage(String pageKey) async {
    if (!isLastPageLoaded) {
      final stories = await getStoriesData(pageKey);
      final isLastPage = (stories.response?.allFacts?.length ?? 0) < pageSize;
      if (isLastPage) {
        isLastPageLoaded = true;
        _pagingController.appendLastPage(stories.response?.allFacts ?? []);
      } else {
        final int nextPageKey = int.parse(pageKey) + 1;
        _pagingController.appendPage(stories.response?.allFacts ?? [], nextPageKey);
      }
      debugPrint('---- Page listening');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagingController.dispose();
  }

  @override
  void initState() {
    addPageListener();
    super.initState();
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
      // appBar: appBarIcBack(context: context, text: widget.title, bgColor: Colors.white, isCenterTitle: false),
      body: Column(
        children: [
          SizedBox(
            height: 42,
            child: SubCategoryListWidget(
              selectedIndex: currentIndex,
              onTap: (value, name) async {
                currentIndex = await getSelectedSportIndex(value);
                tournamentName = '';
                sportsId = value;
                isLastPageLoaded = false;
                refreshPageController();
              },
            ),
          ),
          Expanded(
            child: PagedListView(
              pagingController: _pagingController,
              physics: const BouncingScrollPhysics(),
              builderDelegate: PagedChildBuilderDelegate<AllFacts>(
                itemBuilder: (context, item, index) => InkWell(
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
                            upVote: item.upvotes.toString(),
                            downVote: item.downvotes.toString(),
                            imgUrl: item.image ?? '',
                            onTap: (value) {
                              debugPrint('---- $value');
                              giveVote(item.factsId.toString(), value);
                            },
                            icSize: 22,
                            txtSize: 12,
                            isUpDownBtnShowing: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, left: 16),
                        child: Text(
                          item.title ?? '',
                          style: const TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      if ((item.tournament ?? []).isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 10, left: 16),
                          child: NewsCategoryWidget(
                            height: 16,
                            list: listOfTournament(item),
                            sportId: sportsId.isNotEmpty ? 'blank' : sportsId,
                            onTap: (value) async {
                              onTapOnSportsCategory(value, item);
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24, left: 16),
                        child: Text.rich(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: AppColor.textColor, fontSize: 11),
                          TextSpan(
                            children: [
                              WidgetSpan(
                                  child: InkWell(
                                child: const Icon(
                                  Icons.thumb_up_outlined,
                                  size: 18,
                                  color: AppColor.textColor,
                                ),
                                onTap: () {
                                  giveLikeOnStory(item.factsId.toString());
                                },
                              )),
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
                              const WidgetSpan(
                                child: Icon(
                                  Icons.textsms_outlined,
                                  size: 16,
                                  color: AppColor.textColor,
                                ),
                              ),
                              /*
                                      TextSpan(text: ' 10'),
                                      TextSpan(text: '    '),*/
                              const WidgetSpan(child: Icon(Icons.share, size: 15, color: AppColor.textColor)),
                              //TextSpan(text: ' share  '),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    openScreen(
                      context,
                      StoriesDetails(
                        factsId: item.factsId.toString(),
                        sportsId: '',
                        listOfTournament: listOfTournament(item),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addPageListener() {
    _pagingController.addPageRequestListener((pageKey) {
      currentPageKey = pageKey;
      _fetchPage(pageKey.toString());
    });
  }

  void giveVote(String factId, String voteStatus) async {
    Map<String, dynamic> body = {};
    body['facts_id'] = factId;
    await ApiFun.apiPostWithBody(voteStatus == 'up' ? ApiConstants.storiesUpVote : ApiConstants.storiesDownVote, body).then(
      (value) {
        if (value['status'].toString() == '1') {
          edgeAlert(context, title: value['message'].toString());
          _pagingController.refresh();
        } else {
          edgeAlert(context, title: value['message'].toString());
        }
      },
    );
  }

  void giveLikeOnStory(String id) async {
    try {
      Map<String, dynamic> body = {};
      body['facts_id'] = id;
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

  Future<int> getSelectedSportIndex(String id) async {
    allSports = await AppSharedPreferences().getSportsModel();
    for (int i = 0; i < (allSports.response?.length ?? 0); i++) {
      if (allSports.response?[i].sportId.toString() == id) {
        return i;
      }
    }
    return 0;
  }

  void saveTournamentName(AllFacts item, String value) {
    item.tournament?.forEach((element) {
      if (element.name == value) {
        sportsId = item.sportsId.toString() ?? '';
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

  void onTapOnSportsCategory(String value, AllFacts item) async {
    saveTournamentName(item, value);
    currentIndex = await getSelectedSportIndex(await saveSportsId(value));
    debugPrint('---- current index: $currentIndex');
    debugPrint('---- sports idddd: $sportsId');
    refreshPageController();
  }

  List<String> listOfTournament(AllFacts item) {
    list = [];
    list.add(item.sportsName ?? '');
    item.tournament?.forEach((element) {
      list.add(element.name ?? '');
    });
    return list;
  }

  void refreshPageController() {
    _pagingController.removePageRequestListener((pageKey) {});
    _pagingController.refresh();
    setState(() {});
  }
}
