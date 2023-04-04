import 'package:flutter/material.dart';

class BtnSqWhite extends StatelessWidget {
  final String txt;
  final String hint;
  final bool isPassInvisible;
  final IconData icon;
  final TextInputType textInputType;
  final Function(String) onSaved;


  const BtnSqWhite({
    Key? key,
    required this.txt,
    required this.hint,
    required this.isPassInvisible,
    required this.icon,
    required this.textInputType,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5.0,
          ),
        ]),
        margin: const EdgeInsets.fromLTRB(24.0, 5, 24.0, 8),
        child: TextFormField(
          initialValue: txt,
          enabled: true,
          autocorrect: true,
          obscureText: isPassInvisible,
          keyboardType: textInputType,
          maxLines: 4,
          //validator: validator,
          //onSaved: onSaved,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),
            ),
          ),
        ),
    );
  }
}
