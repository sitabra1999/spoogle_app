import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class LayerHalfShadow extends StatelessWidget {
  final Widget child;
  const LayerHalfShadow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: 110,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 54, 12, 0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppColor.appCornerRadius,),
                    bottomRight: Radius.circular(AppColor.appCornerRadius,),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
