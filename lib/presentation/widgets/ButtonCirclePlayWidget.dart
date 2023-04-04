import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/app_color.dart';

class ButtonCirclePlayWidget extends StatelessWidget {
  final double size;
  final Function() onTap;
  const ButtonCirclePlayWidget({Key? key, required this.size, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(size/8),
        //margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white30, width: 4),
        ),
        child: SvgPicture.asset(
          'assets/images/ic_svg/play_arrow.svg',
          height: 20,
          width: 20,
        ),
      ),

      onTap: (){
        onTap();
      },
    );
  }
}
