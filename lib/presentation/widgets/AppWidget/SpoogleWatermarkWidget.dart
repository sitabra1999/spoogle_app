import 'package:flutter/material.dart';

class SpoogleWatermarkWidget extends StatelessWidget {
  double? width = double.infinity;
  double? height = double.infinity;
  Color? color = Colors.white;
  Widget? child;
  SpoogleWatermarkWidget({Key? key, this.width, this.height, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(left: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          image: const DecorationImage(
            fit: BoxFit.scaleDown,
            opacity: 0.1,
            scale: 3.0,
            image: AssetImage('assets/images/app/app_logo.png',),
          ),

          //border: Border.all(color: Colors.orange),
          //borderRadius: const BorderRadius.all(Radius.circular(12)),
          /*boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12.0,
              offset: Offset(5.0, 5.0),
            ),
          ]*/
      ),
      child: child,
    );
  }
}
