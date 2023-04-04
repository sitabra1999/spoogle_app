import 'package:flutter/material.dart';

class TxtTxtRow extends StatelessWidget {
  final String text1;
  final String text2;
  final double text1Size;
  final double text2Size;
  final Color text1Color;
  final bool isTxt1Bold;
  final Color text2Color;
  final bool isTxt2Bold;

  const TxtTxtRow({super.key, required this.text1, required this.text2, required this.text1Size, required this.text2Size,
    required this.text1Color, required this.isTxt1Bold, required this.text2Color, required this.isTxt2Bold});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,
          style: TextStyle(fontWeight: isTxt1Bold? FontWeight.bold : FontWeight.normal, fontSize: text1Size, color: text1Color),
        ),

        Text(text2,
          style: TextStyle( fontWeight: isTxt2Bold? FontWeight.bold : FontWeight.normal, fontSize: text2Size, color: text2Color),
        ),
      ],
    );
  }
}
