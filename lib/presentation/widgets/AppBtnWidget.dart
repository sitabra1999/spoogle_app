import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

class AppButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final Color btnColor;
  final Color txtColor;
  final IconData ic;
  final Color icColor;
  final Function() onPressed;

  const AppButtonWidget({
    Key? key,
    required this.text,
    required this.width,
    required this.btnColor,
    required this.txtColor,
    required this.ic,
    required this.icColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ElevatedButton.icon(
        icon: Icon(
          ic,
          color: icColor,
          size: 15,
        ),
        onPressed: () async {
          onPressed();
        },
        label: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: txtColor, fontSize: 13),
        ),
        style: ButtonStyle(
          //padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0),),
          backgroundColor: MaterialStateProperty.all<Color>(AppColor.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: btnColor),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(Size(width, 25)),
          elevation: MaterialStateProperty.all<double>(0),
        ),
      ),
    );
  }
}
