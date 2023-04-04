import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class PoolsLatestBtnWidget extends StatelessWidget {
  final String text;
  const PoolsLatestBtnWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            color: AppColor.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Text(text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
