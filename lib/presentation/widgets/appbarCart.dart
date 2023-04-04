import 'package:flutter_spoogle_app/common/constants/route_constants.dart';
import 'package:flutter_spoogle_app/presentation/libraries/PopupButton.dart';
import 'package:flutter/material.dart';

import '../themes/app_color.dart';

PreferredSizeWidget appBarCart(BuildContext context, String text, Function() onTap) {
  return AppBar(
    toolbarHeight: 65,
    centerTitle: false,
    elevation: 0,
    title: Text(
      text, style: const TextStyle(color: AppColor.black, fontSize: 18, fontWeight: FontWeight.normal),
    ),
    backgroundColor: AppColor.white,
    automaticallyImplyLeading: false,
    leading: Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
          size: 18,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    ),

    actions: [
      IconButton(
        padding: const EdgeInsets.only(right: 16),
        icon: const Icon(
          Icons.edit_note,
          size: 28,
          color: Colors.black87,
        ),
        onPressed: () {
          onTap();
        },
      ),
    ],
  );
}
