import 'package:flutter/material.dart';


class IcTxtUnderline extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final IconData ic;
  final Color icColor;
  final Function () onTap;

  const IcTxtUnderline({
    Key? key,
    required this.txt,
    required this.txtColor,
    required this.ic,
    required this.icColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.white),),
        //color: Color(0xC9212121),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            ic,
            color: icColor,
            size: 20,
          ),

          Expanded(
              child: GestureDetector(
                onTap: () {
                  onTap();
                },
                child: Text('    $txt',
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 12),),
              )
          ),
        ],
      ),
    );
  }
}
