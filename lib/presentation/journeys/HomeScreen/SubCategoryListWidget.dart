import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/models/HomePage/AllSportsApiResModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/data_sources/data_source_shared_preferences.dart';
import '../../themes/app_color.dart';

class SubCategoryListWidget extends StatefulWidget {
  final Function(String,String) onTap;
  final String? sportsId;
  final Function()? reIndexing;
  int? selectedIndex;

  SubCategoryListWidget({
    Key? key,
    required this.onTap,
    this.sportsId,
    this.reIndexing,
    this.selectedIndex,
  }) : super(key: key);

  @override
  State<SubCategoryListWidget> createState() => _SubCategoryListWidgetState();
}

class _SubCategoryListWidgetState extends State<SubCategoryListWidget> {
  AllSportsApiResModel allSports = AllSportsApiResModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllSportsModel();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 12, top: 2),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: (allSports.response?.length ?? 0),
        itemBuilder: (BuildContext context, int index) {
          return subCategoryList(context, index);
        });
  }

  Widget subCategoryList(BuildContext context, int index) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: widget.selectedIndex == index ? AppColor.primaryColor : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: widget.selectedIndex == index ? Colors.red : Colors.grey,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (index != 0)
              SvgPicture.network(
                allSports.response?[index].mainImage ?? '',
                color: widget.selectedIndex == index ? Colors.white : AppColor.black,
                height: 20.0,
                width: 20.0,
              ),
            Padding(
              padding:index==0? EdgeInsets.zero:const EdgeInsets.only(left: 8),
              child: Text(
                allSports.response?[index].sportName ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: widget.selectedIndex == index ? Colors.white : AppColor.black,
                ),
              ),
            ),
          ],
        ),

        /*child: ImgTxtRow(txt: eventList[index].title, txtColor: Colors.black, txtSize: 12, fontWeight: FontWeight.bold,
                icon: eventList[index].img, icSize: 20,
              ),*/
      ),
      onTap: () {
        setState(() {
          widget.selectedIndex = index;
        });
        if (index == 0) {
          widget.onTap('','All');
        } else {
          widget.onTap(allSports.response?[index].sportId.toString() ?? '',allSports.response?[index].sportName.toString() ?? '');
        }
      },
    );
  }

  void getAllSportsModel() async {
    allSports = await AppSharedPreferences().getSportsModel();
    setState(() {});
  }
}
