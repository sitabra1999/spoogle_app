import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../themes/app_color.dart';
import '../../widgets/ButtonOutlined.dart';

class NoDataFound extends StatelessWidget{
  final String txt;
  final Function onRefresh;
  const NoDataFound({Key? key,required this.txt, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 80,),
            child: Lottie.asset('assets/animations/empty_search_data.json', fit: BoxFit.cover, width: 220, height: 220),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'OPPS!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.primaryColor),
              maxLines: 4,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black54),
              maxLines: 4,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: OutlinedButton(
              style: ButtonStyle(
                //minimumSize: MaterialStateProperty.all(const Size(50, 30)),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 55)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(Colors.orange.shade50),
                elevation: MaterialStateProperty.all(12),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                ),
              ),
              child: Text(
                'Retry',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey.shade600),
              ),
              onPressed: () {
                onRefresh();
              },
            ),
          ),
        ],
      ),
    );
  }

}