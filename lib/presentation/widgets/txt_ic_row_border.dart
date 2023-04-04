import 'package:flutter_spoogle_app/presentation/libraries/AvatarGlow.dart';
import 'package:flutter/material.dart';

class TxtIcRowBorder extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final double txtSize;
  final FontWeight fontWeight;
  final IconData icon;
  final Color icColor;
  final double icSize;
  final bool isCenter;
  final double height;
  final Function onTap;

  const TxtIcRowBorder({
    Key? key,
    required this.txt,
    required this.txtColor,
    required this.txtSize,
    required this.fontWeight,
    required this.icon,
    required this.icColor,
    required this.icSize,
    required this.isCenter,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                txt,
                style: TextStyle(fontWeight: fontWeight, fontSize: txtSize, color: txtColor),
              ),
            ),

            Icon(
              icon,
              size: icSize,
              color: icColor,
            ),
          ],
        ),

        onTap: (){
          onTap();
        },
      ),
    );
  }
}
