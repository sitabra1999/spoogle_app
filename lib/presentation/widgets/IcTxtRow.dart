import 'package:flutter/material.dart';

class IcTxtRow extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;
  final IconData icon;
  final double icSize;
  final Color icColor;
  final bool isCenter;

  const IcTxtRow({
    Key? key,
    required this.txt,
    required this.txtColor,
    required this.txtSize,
    required this.fontWeight,
    required this.icon,
    required this.icSize,
    required this.icColor,
    required this.isCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
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
      ],
    );
  }
}
