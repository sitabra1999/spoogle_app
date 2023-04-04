import 'package:flutter_spoogle_app/presentation/widgets/txt.dart';
import 'package:flutter/material.dart';


class PermissionContentWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData ic;
  final bool isPermissionAllowed;
  final Function() onTap;

  const PermissionContentWidget({Key? key, required this.title, required this.subtitle, required this.ic, required this.isPermissionAllowed, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 34, right: 34, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 22.0, top: 6),
              child: Icon(ic, size:  30, color: isPermissionAllowed ? Colors.green : Colors.orange,),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(txt: title, txtColor: Colors.black, txtSize: 16, fontWeight: FontWeight.normal, padding: 3),

                  Txt(txt: subtitle, txtColor: Colors.black54, txtSize: 12, fontWeight: FontWeight.normal, padding: 3),
                ],
              ),
            )
          ],
        ),
      ),

      onTap: (){
        onTap();
      },
    );
  }
}
