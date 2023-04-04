import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/txt.dart';
import 'package:flutter/material.dart';

import 'AppBtnWidget.dart';

class ReferBoxWidget extends StatelessWidget {
  final String txt1;
  final String txt2;
  final String btnTxt;
  final IconData btnIc;
  final Function() onTap;

  const ReferBoxWidget({super.key, required this.txt1, required this.txt2, required this.btnTxt,
    required this.btnIc, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8,),
              child: Txt(txt: txt1, txtColor: Colors.black, txtSize: 16, fontWeight: FontWeight.normal, padding: 0),
            ),

            Padding(
              padding: const EdgeInsets.only( bottom: 8, ),
              child: Txt(txt: txt2, txtColor: Colors.black54, txtSize: 11, fontWeight: FontWeight.normal, padding: 0),
            ),
          ],
        ),

        AppButtonWidget(text: btnTxt, width: 110, btnColor: AppColor.primaryColor, txtColor: AppColor.primaryColor,
          ic: btnIc, icColor: AppColor.primaryColor,
          onPressed: () {
            onTap();
          },),
      ],
    );
  }
}
