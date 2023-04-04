
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/flutter_animator/flutter_animator.dart';
import '../../themes/app_color.dart';
import '../../widgets/PoolsLatestBtnWidget.dart';

class PoolLatestWidget extends StatelessWidget {
  final int index;
  const PoolLatestWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Container(
        height: 230,
        margin: const EdgeInsets.only(top: 22, left: 16, right: 16,),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.black.withOpacity(0.05),
          borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
          //border: Border.all(color: Colors.orange),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Who will win the final clash in the Word Cup 2022 ?",
              style: TextStyle(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: 14),
            ),

            Container(
              width: 80,
              height:  20,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 6, right: 6),
              margin: const EdgeInsets.only(top: 8, right: 5, bottom: 8),
              decoration: BoxDecoration(
                color: index == 0 ? Colors.red : Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
                //border: Border.all(color: Colors.grey.shade300, width: 0.9),
              ),

              child: const Text(
                "CRICKET",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.white),
              ),
            ),

            const PoolsLatestBtnWidget(text: "India (100%)"),

            const PoolsLatestBtnWidget(text: "England (0%)"),
          ],
        ),
      ),
    );
  }
}
