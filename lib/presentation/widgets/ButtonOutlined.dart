import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

class ButtonOutlined extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color bgColor;
  final Color txtColor;
  final Function() onPressed;

  const ButtonOutlined({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.bgColor,
    required this.txtColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //margin: const EdgeInsets.only(top: 8),
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          //minimumSize: MaterialStateProperty.all(const Size(50, 30)),
          //padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
          backgroundColor: MaterialStateProperty.all(bgColor),
          elevation: MaterialStateProperty.all(1),
          //shadowColor: MaterialStateProperty.all(Colors.redAccent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),),
        ),
        child: Text(text,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: txtColor),),
      ),
    );
  }
}
