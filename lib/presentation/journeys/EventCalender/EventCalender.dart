import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/data/models/EventCalender/EventCalenderApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/journeys/EventCalender/EventFilter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/core/api_constants.dart';
import '../../libraries/flutter_easy_search_bar/easy_search_bar.dart';
import 'EventsListWidget.dart';

class EventCalender extends StatefulWidget {
  const EventCalender({Key? key}) : super(key: key);

  @override
  State<EventCalender> createState() => _EventCalenderState();
}

class _EventCalenderState extends State<EventCalender> {
  bool isCalenderEnabled = false;
  String keyword = '';
  String sports = '';
  String month = '';
  String season = '';
  String series = '';
  final CrCalendarController _controller = CrCalendarController();
  final PagingController<int, EventList> _pagingController = PagingController(firstPageKey: 1);
  final int pageSize = 10;
  int nextPage = 0;
  bool isApiDataAvailable = true;
  bool isFilterEnabled = false;
  EventCalenderApiResModel eventCalender = EventCalenderApiResModel();

  Future<EventCalenderApiResModel> getEventCalender(String pageNo) async {
    String url =
        '${ApiConstants.eventCalender}?keyword=$keyword&sport=$sports&month=$month&year=$season&page_no=$pageNo&page_limit=10&series=$series';
    await ApiFun.apiGet(url).then((jsonData) {
      eventCalender = EventCalenderApiResModel.fromJson(jsonData);
    });
    if (eventCalender.status == 1 && (eventCalender.response?.eventList ?? []).isNotEmpty) {
      isApiDataAvailable = true;
    }
    return eventCalender;
  }

  String searchValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey.toString());
    });
  }

  Future<void> _fetchPage(String pageKey) async {
    final events = await getEventCalender(pageKey);
    final isLastPage = (events.response?.eventList?.length ?? 0) < pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(events.response?.eventList ?? []);
    } else {
      final int nextPageKey = int.parse(pageKey) + 1;
      nextPage = nextPageKey;
      _pagingController.appendPage(events.response?.eventList ?? [], nextPageKey);
    }

    debugPrint('---- Page listening');
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
      backgroundColor: Colors.white,
      appBar: EasySearchBar(
          elevation: 0,
          searchHintText: "Search here...",
          searchBackIconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Event Calender'),
          onSearch: (value) {
            setState(() {
              keyword = value;
            });
            refreshPageController();
          },
          actions: [
            IconButton(
              //padding: const EdgeInsets.only(right: 0),
              icon: Icon(
                isCalenderEnabled ? Icons.grid_view_rounded : Icons.view_list_rounded,
                //color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  isCalenderEnabled ? isCalenderEnabled = false : isCalenderEnabled = true;
                });
              },
            ),
            IconButton(
              //padding: const EdgeInsets.only(right: 0),
              icon: Icon(
                !isFilterEnabled ? Icons.filter_list_rounded : Icons.filter_list_off_rounded,
                //color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  isFilterEnabled = !isFilterEnabled;
                  if(!isFilterEnabled){
                    sports = '';
                    month = '';
                    season = '';
                    series = '';
                    refreshPageController();
                  }
                });
              },
            ),
          ],
          asyncSuggestions: null),
      body: isCalenderEnabled
          ? CrCalendar(
              initialDate: DateTime.now(),
              controller: _controller,
            )
          : Column(
              children: [
                EventFilter(
                    enable: isFilterEnabled,
                    eventCalender: eventCalender,
                    onChangedValue: () {},
                    onSearch: (sp, mo, se, ser) {
                      setState(() {
                        sports = sp;
                        month = mo;
                        season = se;
                        series = ser;
                      });
                      refreshPageController();
                    }),
                /*
                        ),*/
                Expanded(
                  child: PagedListView(
                    pagingController: _pagingController,
                    physics: const BouncingScrollPhysics(),
                    builderDelegate: PagedChildBuilderDelegate<EventList>(
                      itemBuilder: (context, events, index) => EventsListWidget(
                        eventList: events,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void refreshPageController() {
    _pagingController.notifyPageRequestListeners(1);
    _pagingController.refresh();
  }
}
