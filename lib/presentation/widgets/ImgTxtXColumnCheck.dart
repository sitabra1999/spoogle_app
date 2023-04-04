import 'package:flutter/material.dart';

import 'txt.dart';

class ImgTxtXColumnCheck extends StatelessWidget {
  final String txt;
  final String icImg;
  final IconData icCheck;
  final bool isChecked;
  final Function() onTap;
  const ImgTxtXColumnCheck({
    Key? key,
    required this.txt,
    required this.icImg,
    required this.icCheck,
    required this.isChecked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            //color: isChecked ? Colors.grey.shade100 : Colors.green.shade50,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color:isChecked ? Colors.green : Colors.grey, width: 0.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Icon(icCheck, size: 20, color: isChecked ? Colors.green: Colors.grey,),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
              child: Image.asset(icImg, width: 30, height: 30,),
            ),

            Txt(txt: txt, txtColor: Colors.black54, txtSize: 11, fontWeight: FontWeight.normal, padding: 0),
          ],
        ),
      ),

      onTap: (){
        onTap();
      },
    );
  }
}
