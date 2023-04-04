import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class IcTxtIcRow extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;
  final IconData icon;
  final double icSize;
  final Color icColor;
  final IconData icon2;
  final double ic2Size;
  final Color ic2Color;

  const IcTxtIcRow({
    Key? key,
    required this.txt,
    required this.txtColor,
    required this.txtSize,
    required this.fontWeight,
    required this.icon,
    required this.icSize,
    required this.icColor,
    required this.icon2,
    required this.ic2Size,
    required this.ic2Color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  const BorderRadius.all(Radius.circular(AppColor.appCornerRadius)),
          border: Border.all(color: Colors.black38, width: 1),
          /*boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              color: Colors.grey.withOpacity(.3),
              offset: const Offset(1, 1),
              blurRadius: 1,
            )
          ]*/
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: icSize,
            color: icColor,
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                txt,
                style: TextStyle(fontWeight: fontWeight, fontSize: txtSize, color: txtColor),
                maxLines: 4,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          Icon(
            icon2,
            size: ic2Size,
            color: ic2Color,
          ),
        ],
      ),
    );
  }
}
