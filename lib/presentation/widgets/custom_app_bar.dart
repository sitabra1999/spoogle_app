
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../libraries/Badges/badges.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final bool showBackButton;
  final bool showActions;

  const CustomAppBar({Key? key,
    required this.context,
    required this.title,
    this.showBackButton = true,
    this.showActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold),),
        leading: showBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget,
                    ),
                  );*/
                },
        )
            : null,
        actions: !showActions
            ? null
            : <Widget>[
          IconButton(
            icon: const Icon(Icons.search,
              color: Colors.black,),
            onPressed: () {

            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_rounded, color: Colors.black,),
            onPressed: () {
              //Navigator.pushNamed(context, RouteList.my_requisition);
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}