import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/liquid_linear_progress_bar/liquid_linear_progress_indicator.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../libraries/AppContents/flutter_animator/flutter_animator.dart';
import '../../themes/app_color.dart';
import '../../widgets/PoolsCompletedProgressWidget.dart';

class PoolCompletedWidget extends StatelessWidget {
  final int index;
  const PoolCompletedWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      child: Container(
        height: 225,
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
              "Who will win the final clash ?",
              style: TextStyle(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: 14),
            ),

            Container(
              width: 80,
              height:  20,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 6, right: 6),
              margin: const EdgeInsets.only(top: 8, right: 5, bottom: 24),
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

            const Text("INDIA", style: TextStyle(fontSize: 12, color: Colors.black),),

            const PoolsCompletedProgressWidget(text: '80%', value: 0.8, progressColor: AppColor.green80),

            const Text("ENGLAND", style: TextStyle(fontSize: 12, color: Colors.black),),

            const PoolsCompletedProgressWidget(text: '30%', value: 0.3, progressColor: AppColor.cyan80),
          ],
        ),
      ),
    );
  }
}
