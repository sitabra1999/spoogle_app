import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/models/EventCalender/EventCalenderApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import '../../libraries/AppContents/FirebaseNotification/AwesomeNotification/common_functions.dart';
import '../../widgets/NewsCategoryWidget.dart';

class EventsListWidget extends StatelessWidget {
  final EventList eventList;

  const EventsListWidget({Key? key, required this.eventList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        padding: const EdgeInsets.fromLTRB(6, 14, 12, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: index == 3 ?  AppColor.primaryColor : AppColor.white),
          borderRadius: BorderRadius.circular(AppColor.appCornerRadius),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 22,
              color: AppColor.black.withOpacity(0.15),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(left: 8, right: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: getRandomColor().withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
                //border: Border.all(color: index == 1 || index == 3 ?  AppColor.primaryColor : AppColor.transparent),
              ),
              child: RichText(
                softWrap: false,
                textScaleFactor: 0.5,
                textAlign: TextAlign.center,
                //strutStyle: StrutStyle(),
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "${eventList.month ?? 'Spoogle'}\n\n",
                        style: const TextStyle(color: Colors.black, fontSize: 28)),
                    TextSpan(
                      text: eventList.eventDate?.substring(0,1) ?? '2023-01-01',
                      style: const TextStyle(color: AppColor.border, fontWeight: FontWeight.bold, fontSize: 65),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventList.eventDate?? '',
                    style: const TextStyle(fontSize: 12, color: AppColor.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 3),
                    child: Text(
                      eventList.event ?? 'Spoogle',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColor.textColor),
                      maxLines: 3,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    eventList.venue ?? '',
                    style: const TextStyle(fontSize: 12, color: AppColor.black),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: NewsCategoryWidget(height: 18, list: [eventList.sport.toString(),eventList.eventStatus.toString(),eventList.series.toString()],),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
