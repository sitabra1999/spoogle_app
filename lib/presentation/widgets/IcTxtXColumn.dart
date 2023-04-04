import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';

import 'txt.dart';

class IcTxtXColumn extends StatelessWidget {
  final String txt;
  final IconData ic;
  final Color icColor;
  final Function() onTap;
  const IcTxtXColumn({
    Key? key,
    required this.txt,
    required this.ic,
    required this.icColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red.shade50,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //width: getScreenWidth(context),
            padding: const EdgeInsets.only(bottom: 3),
            child: Icon(ic, size: 22, color: icColor),
          ),

          Txt(txt: txt, txtColor: Colors.black38, txtSize: 12, fontWeight: FontWeight.normal, padding: 0),
        ],
      ),

      onTap: (){
        onTap();
      },
    );
  }
}
