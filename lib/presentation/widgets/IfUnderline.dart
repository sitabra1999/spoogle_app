import 'package:flutter/material.dart';

class IfUnderline extends StatelessWidget {
  final String initialTxtValue;
  final TextEditingController controller;
  final String hint;
  final bool isReadOnly;
  final bool isBgWhite;
  final TextInputType textInputType;
  final IconData ic;
  final int maxLine;
  final Function(String) onSaved;
  final Function() onTap;
  const IfUnderline({
    Key? key,
    required this.initialTxtValue,
    required this.controller,
    required this.hint,
    required this.ic,
    required this.isReadOnly,
    required this.isBgWhite,
    required this.textInputType,
    required this.maxLine,
    required this.onSaved,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialTxtValue,
      autocorrect: true,
      keyboardType: textInputType,
      readOnly: isReadOnly,
      maxLines: maxLine,
      style: TextStyle(color: isBgWhite ? Colors.black : Colors.white ,fontSize: 12),
      onChanged: (value){onSaved(value);},
      onTap: (){onTap();},
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(0),
        hintStyle: TextStyle(color: isBgWhite ? Colors.black54 : Colors.white.withOpacity(0.8), fontSize: 12),
        icon: Icon(ic, size: 18, color: Colors.grey.shade700,),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isBgWhite ? Colors.grey : Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isBgWhite ? Colors.grey : Colors.white),
        ),
      ),
    );
  }
}
