import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/models/EventCalender/EventCalenderApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Languages/StringExtensions.dart';

import '../../libraries/SearchChoicesDropDown/src/search_choices.dart';
import '../../themes/app_color.dart';
import '../../widgets/IcCircleBorder.dart';
import '../../widgets/SearchEasyChildWidget.dart';

class EventFilter extends StatefulWidget {
  final bool enable;
  final Function() onChangedValue;
  final Function(String, String, String, String) onSearch;
  final EventCalenderApiResModel eventCalender;

  const EventFilter(
      {Key? key, required this.eventCalender, required this.onChangedValue, required this.onSearch, required this.enable})
      : super(key: key);

  @override
  State<EventFilter> createState() => _EventFilterState();
}

class _EventFilterState extends State<EventFilter> {
  List<DropdownMenuItem> sports = [];
  List<DropdownMenuItem> months = [];
  List<DropdownMenuItem> year = [];
  List<DropdownMenuItem> series = [];
  String sportsValue = '', monthValue = '', seasonValue = '', seriesValue = '';
  bool isFilterEnabled = false;

  void storeDataForSearch() {
    sports.clear();
    months.clear();
    year.clear();
    series.clear();
    widget.eventCalender.response?.eventSports?.forEach((element) {
      sports.add(
        DropdownMenuItem(
          value: element.sport ?? '',
          child: Text(element.sport ?? ''),
        ),
      );
    });
    widget.eventCalender.response?.eventMonths?.forEach((element) {
      months.add(
        DropdownMenuItem(
          value: element.split(',').join(''),
          child: Text(element.split(',').join('').capitalize()),
        ),
      );
    });
    widget.eventCalender.response?.eventSeasons?.forEach((element) {
      year.add(
        DropdownMenuItem(
          value: element.year ?? '',
          child: Text(element.year ?? ''),
        ),
      );
    });
    widget.eventCalender.response?.seriesData?.forEach((element) {
      series.add(
        DropdownMenuItem(
          value: element.series ?? '',
          child: Text(element.series ?? ''),
        ),
      );
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeDataForSearch();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enable) {
      storeDataForSearch();
    }
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      height: widget.enable ? 200 : 0,
      color: Colors.blue.shade100,
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                  ),
                  child: SearchChoices.single(
                    items: sports,
                    value: sportsValue,
                    hint: "Sports",
                    searchHint: "Sports",
                    padding: const EdgeInsets.only(left: 12, right: 6),
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        sportsValue = value;
                      });
                      debugPrint("----$sportsValue");
                    },
                    doneButton: "Done",
                    clearIcon: Icon(
                      Icons.clear,
                      size: sportsValue == "Select sports" ? 25 : 0,
                      color: sportsValue == "Select sports" ? Colors.grey : Colors.transparent,
                    ),
                    displayItem: (item, selected) {
                      return SearchEasyChildWidget(item: item, isSelected: selected);
                    },
                    isExpanded: true,
                    underline: const SizedBox(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //width: getScreenWidth(context)/1.5,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                  ),
                  child: SearchChoices.single(
                    items: months,
                    value: monthValue,
                    hint: "Month",
                    searchHint: "Month",
                    padding: const EdgeInsets.only(left: 12, right: 6),
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        monthValue = value;
                      });
                      debugPrint("----$monthValue");
                    },
                    doneButton: "Done",
                    clearIcon: Icon(
                      Icons.clear,
                      size: monthValue == "Select month" ? 25 : 0,
                      color: monthValue == "Select month" ? Colors.grey : Colors.transparent,
                    ),
                    displayItem: (item, selected) {
                      return SearchEasyChildWidget(item: item, isSelected: selected);
                    },
                    isExpanded: true,
                    underline: const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  //width: getScreenWidth(context)/1.5,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                  ),
                  child: SearchChoices.single(
                    items: year,
                    value: seasonValue,
                    hint: "Year",
                    searchHint: "Year",
                    padding: const EdgeInsets.only(left: 12, right: 6),
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        seasonValue = value;
                      });
                      debugPrint("----$seasonValue");
                    },
                    doneButton: "Done",
                    clearIcon: Icon(
                      Icons.clear,
                      size: seasonValue == "Select year" ? 25 : 0,
                      color: seasonValue == "Select year" ? Colors.grey : Colors.transparent,
                    ),
                    displayItem: (item, selected) {
                      return SearchEasyChildWidget(item: item, isSelected: selected);
                    },
                    isExpanded: true,
                    underline: const SizedBox(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //width: getScreenWidth(context)/1.5,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                  ),
                  child: SearchChoices.single(
                    items: series,
                    value: seriesValue,
                    hint: "Series",
                    searchHint: "Series",
                    padding: const EdgeInsets.only(left: 12, right: 6),
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        seriesValue = value;
                      });
                      debugPrint("----$seriesValue");
                    },
                    doneButton: "Done",
                    clearIcon: Icon(
                      Icons.clear,
                      size: seriesValue == "Select series" ? 25 : 0,
                      color: seriesValue == "Select series" ? Colors.grey : Colors.transparent,
                    ),
                    displayItem: (item, selected) {
                      return SearchEasyChildWidget(item: item, isSelected: selected);
                    },
                    isExpanded: true,
                    underline: const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          IcCircleBorder(
            ic: Icons.arrow_forward,
            icColor: Colors.white,
            bgColor: Colors.blue.shade300,
            onTap: () {
              widget.onSearch(sportsValue, monthValue, seasonValue, seriesValue);
            },
          ),
        ],
      ),
    );
  }
}
