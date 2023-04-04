import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../libraries/AppContents/flutter_animator/flutter_animator.dart';

class SearchBar extends StatelessWidget{
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      child: Container(
        height: 55,
        margin: const EdgeInsets.fromLTRB(16, 22, 16, 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 22,
              color: AppColor.black.withOpacity(0.2),
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.search, color: Colors.red),
          title: TextField(
            //controller: controller,
            decoration: InputDecoration(
              hintText: 'Search anything...',
              hintStyle: TextStyle(color: Colors.red.shade300, fontSize: 14),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none
            ),
            //onChanged: onSearchTextChanged,
          ),
          trailing: Visibility(
            //visible: controller.text.isNotEmpty,
            child: IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.red,),
              onPressed: () {
                //controller.clear();
                //onSearchTextChanged('');
              },
            ),
          ),
        ),
      ),
    );
  }
}