import 'package:flutter/material.dart';


class IcWithRoundBgWidget extends StatelessWidget {
  final String text;
  final String img;
  final Color bgColor;
  final Function() onPressed;

  const IcWithRoundBgWidget({
    Key? key,
    required this.text,
    required this.img,
    required this.bgColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(8),),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 120,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(img, width: 50, fit: BoxFit.contain,),
          ),

          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      )
    );
  }
}
