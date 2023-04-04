import 'package:flutter/material.dart';

import 'IcTxtRow.dart';

class ReviewTxtIf extends StatelessWidget {
  final String txt;
  final String initialTxtValue;
  final String hint;
  final int maxLine;
  final IconData ic;
  final Function(String) onSaved;

  const ReviewTxtIf({
    Key? key,
    required this.txt,
    required this.initialTxtValue,
    required this.hint,
    required this.maxLine,
    required this.ic,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: IcTxtRow(txt: txt, txtColor: Colors.black54, txtSize: 14, fontWeight: FontWeight.normal,
              icon: ic, icSize: 18, icColor: Colors.black54, isCenter: false),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: TextFormField(
            initialValue: initialTxtValue,
            autocorrect: true,
            style: const TextStyle(color: Colors.black),
            maxLines: maxLine,
            onChanged: (value){
              onSaved(value);
            },
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.only(left: 6),
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              enabledBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //borderSide: BorderSide(color: Colors.amber, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
