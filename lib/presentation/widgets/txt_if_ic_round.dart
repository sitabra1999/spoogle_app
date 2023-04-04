import 'package:flutter/material.dart';

class IfIconRound extends StatelessWidget {
  final String hint;
  final double? height;
  final double? width;
  final IconData icon;

  final TextEditingController? controller;
  final TextInputType textInputType;

  const IfIconRound({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.textInputType, this.height, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??20,
      width: width??20,
      child: TextFormField(
        enabled: true,
        autocorrect: true,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Container(
            margin: const EdgeInsets.only(right: 12, left: 1),
            height:  20,
            width:  20,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Icon(icon, color: Colors.grey.shade500,),
          ),
          labelStyle: const TextStyle(color: Colors.black),
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.black54, width: 1),
          ),
        ),
      ),
    );
  }
}
