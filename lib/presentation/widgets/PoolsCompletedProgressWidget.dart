import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/libraries/liquid_linear_progress_bar/liquid_linear_progress_indicator.dart';

import '../themes/app_color.dart';

class PoolsCompletedProgressWidget extends StatelessWidget {
  final String text;
  final double value;
  final Color progressColor;
  const PoolsCompletedProgressWidget({Key? key, required this.text, required this.value, required this.progressColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 20,
        margin: const EdgeInsets.only(bottom: 16, top: 4),
        child: LiquidLinearProgressIndicator(
          value: value,
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation(progressColor),
          borderColor: Colors.transparent,
          borderWidth: 0,
          borderRadius: 16,
          //change text color by value > 0.7 ? Colors.white: Colors.black
          center: Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: value > 0.6 ? Colors.white: Colors.black),
          ),
        ),
      );
  }
}
