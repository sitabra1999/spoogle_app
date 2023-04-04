import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';

import '../themes/app_color.dart';

class IcCircleBorder extends StatelessWidget {
  final IconData ic;
  final Color icColor;
  final Color bgColor;
  final Function onTap;
  final double? borderRadius;
  final Color? borderColor;
  final String? text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const IcCircleBorder(
      {super.key,
      required this.ic,
      required this.onTap,
      required this.bgColor,
      required this.icColor,
      this.borderRadius,
      this.borderColor,
      this.text,  this.width, this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          //margin: const EdgeInsets.all(20),
        width: width??getScreenWidth(context),
          height: height??40,
          padding:padding??const EdgeInsets.all(12.5),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor??Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? AppColor.appCornerRadius4),
            color: bgColor,
          ),
          child: (text ?? '').isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      ic,
                      size: 18,
                      color: icColor,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      text ?? '',
                      style: TextStyle(color: AppColor.white,fontSize: 12),
                    ),

                  ],
                )
              : Icon(
                  ic,
                  size: 18,
                  color: icColor,
                )),
      onTap: () {
        onTap();
      },
    );
  }
}
