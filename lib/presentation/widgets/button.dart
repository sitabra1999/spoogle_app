import 'package:flutter/material.dart';

import '../../common/constants/size_constants.dart';
import '../themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? btnColor;
  final Function() onPressed;
  final EdgeInsetsGeometry? buttonMargin;
  final double? height;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed, this.btnColor,  this.buttonMargin, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration:  BoxDecoration(
        color: btnColor??AppColor.primaryColor,
        borderRadius:const BorderRadius.all(Radius.circular(5),),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: buttonMargin?? const EdgeInsets.symmetric(horizontal: 26),
      width: double.infinity,
      height: height??45,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
