import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/Glass/GlassEffectWidget.dart';

import '../RefScreens/TableViewDemo2.dart';


class SpoogleWidgets extends StatelessWidget {
  const SpoogleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.white60,
              //border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12),),
            ),
            child: TableViewDemo2(),
          );
        },
      ).asGlass(
        tintColor: Colors.black54,
        blurX: 5,
        blurY: 5,
        clipBorderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
