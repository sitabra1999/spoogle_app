import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/journeys/LeagueTable/LeagueTableWidget.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:flutter_spoogle_app/presentation/widgets/IcCircleBorder.dart';
import 'package:flutter_spoogle_app/presentation/widgets/SearchEasyChildWidget.dart';
import '../../libraries/SearchChoicesDropDown/search_choices.dart';
import '../../themes/app_color.dart';

class LeagueTableDetails extends StatefulWidget {
  const LeagueTableDetails({Key? key}) : super(key: key);

  @override
  State<LeagueTableDetails> createState() => _LeagueTableDetailsState();
}

class _LeagueTableDetailsState extends State<LeagueTableDetails> {
  bool isCompareViewVisible = false;
  List<DropdownMenuItem> items = [];
  String team1 = '', team2 = '', tournament = '', season = '';
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    super.initState();

    String wordPair = "";
    loremIpsum.toLowerCase().replaceAll(",", "").replaceAll(".", "").split(" ").forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = "$word ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            value: wordPair,
            child: Text(wordPair),
          ));
        }
        wordPair = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: 'League Table', bgColor: Colors.white, isCenterTitle: false),
      body: Column(
        children: [
          Container(
            color: Colors.blue.shade100,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                    ),
                    child: SearchChoices.single(
                      items: items,
                      value: tournament,
                      hint: "Tournament",
                      searchHint: "Tournament",
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      style: const TextStyle(color: Colors.black54, fontSize: 14),
                      onChanged: (value) {
                        setState(() {
                          tournament = value;
                        });
                        debugPrint("----$tournament");
                      },
                      doneButton: "Done",
                      clearIcon: Icon(
                        Icons.clear,
                        size: tournament == "Tournament" ? 25 : 0,
                        color: tournament == "Tournament" ? Colors.grey : Colors.transparent,
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
                  flex: 3,
                  child: Container(
                    //width: getScreenWidth(context)/1.5,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                    ),
                    child: SearchChoices.single(
                      items: items,
                      value: season,
                      hint: "Season",
                      searchHint: "Season",
                      padding: const EdgeInsets.only(left: 12, right: 6),
                      style: const TextStyle(color: Colors.black54, fontSize: 14),
                      onChanged: (value) {
                        setState(() {
                          season = value;
                        });
                        debugPrint("----$season");
                      },
                      doneButton: "Done",
                      clearIcon: Icon(
                        Icons.clear,
                        size: season == "Select Season" ? 25 : 0,
                        color: season == "Select Season" ? Colors.grey : Colors.transparent,
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
                  flex: 1,
                  child: IcCircleBorder(
                    ic: Icons.arrow_forward,
                    icColor: Colors.white,
                    bgColor: Colors.blue.shade300,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),

          const Expanded(
            flex: 10,
            child: LeagueTableWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade100,
        elevation: 6,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
          //padding: const EdgeInsets.only(left: 45),
          alignment: !isCompareViewVisible ? Alignment.centerLeft : Alignment.center,
          height: isCompareViewVisible ? 270 : 60,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: !isCompareViewVisible ? 32 : 0, right: 45),
                  child: const Text(
                    "Compare Teams",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColor.black70, fontSize: 16),
                  ),
                ),
                Visibility(
                  visible: isCompareViewVisible,
                  child: Container(
                    width: getScreenWidth(context) / 1.5,
                    margin: const EdgeInsets.only(right: 45, top: 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                      //border: Border.all( color: selectedIndex == index ? Colors.red : Colors.grey, width: 0.5),
                    ),
                    child: SearchChoices.single(
                      items: items,
                      value: team1,
                      hint: "Select Team 1",
                      searchHint: "Select Team 1",
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      style: const TextStyle(color: Colors.black54, fontSize: 14),
                      onChanged: (value) {
                        setState(() {
                          team1 = value;
                        });
                        debugPrint("----$team1");
                      },
                      doneButton: "Done",
                      clearIcon: Icon(
                        Icons.clear,
                        size: team1 == "Select Team 1" ? 25 : 0,
                        color: team1 == "Select Team 1" ? Colors.grey : Colors.transparent,
                      ),
                      displayItem: (item, selected) {
                        return SearchEasyChildWidget(item: item, isSelected: selected);
                      },
                      isExpanded: true,
                      underline: const SizedBox(),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCompareViewVisible,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 45, 12),
                    child: Text(
                      "VS",
                      style: TextStyle(color: AppColor.black70, fontSize: 14),
                    ),
                  ),
                ),
                Visibility(
                  visible: isCompareViewVisible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getScreenWidth(context) / 1.48,
                        margin: const EdgeInsets.only(left: 23),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                          //border: Border.all( color: selectedIndex == index ? Colors.red : Colors.grey, width: 0.5),
                        ),
                        child: SearchChoices.single(
                          items: items,
                          value: team2,
                          hint: "Select Team 2",
                          searchHint: "Select Team 2",
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          style: const TextStyle(color: Colors.black54, fontSize: 14),
                          onChanged: (value) {
                            setState(() {
                              team2 = value;
                            });
                            debugPrint("----$team2");
                          },
                          doneButton: "Done",
                          clearIcon: Icon(
                            Icons.clear,
                            size: team2 == "Select Team 1" ? 25 : 0,
                            color: team2 == "Select Team 1" ? Colors.grey : Colors.transparent,
                          ),
                          displayItem: (item, selected) {
                            return SearchEasyChildWidget(item: item, isSelected: selected);
                          },
                          isExpanded: true,
                          underline: const SizedBox(),
                        ),
                      ),
                      SizedBox(width: 15,),
                      SizedBox(
                        width: 50,
                        child: IcCircleBorder(
                          ic: Icons.compare_arrows,
                          icColor: Colors.black54,
                          bgColor: team1.isNotEmpty && team2.isNotEmpty ? Colors.white : Colors.white70,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        child: Icon(
          isCompareViewVisible ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          setState(() {
            isCompareViewVisible = isCompareViewVisible ? false : true;
          });
        },
      ),
    );
  }
}
