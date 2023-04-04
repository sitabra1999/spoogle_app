import 'package:flutter_spoogle_app/presentation/libraries/AvatarGlow.dart';
import 'package:flutter/material.dart';

class TxtIcRow extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;
  final IconData icon;
  final Color icColor;
  final double icSize;
  final bool isCenter;

  const TxtIcRow({
    Key? key,
    required this.txt,
    required this.txtColor,
    required this.txtSize,
    required this.fontWeight,
    required this.icon,
    required this.icColor,
    required this.icSize,
    required this.isCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCenter? MainAxisAlignment.center: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: Text(
            txt,
            style: TextStyle(fontWeight: fontWeight, fontSize: txtSize, color: txtColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
          ),
        ),

        Icon(
          icon,
          size: icSize,
          color: icColor,
        ),
      ],
    );
  }
}
