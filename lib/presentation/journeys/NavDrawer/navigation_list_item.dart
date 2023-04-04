import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';


class NavigationListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String ic;
  final Function() onPressed;

  const NavigationListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.ic,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: ListTile(
          leading:  Image.asset(ic, width: 30, height: 30,),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.black),
          ),

          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: Colors.grey),
          ),

          trailing: InkWell(
            child: const Icon(Icons.arrow_forward,
            size: 25,
            color: Colors.black,
            ),
            onTap: (){},
          ),
        ),
      ),
    );
  }
}
