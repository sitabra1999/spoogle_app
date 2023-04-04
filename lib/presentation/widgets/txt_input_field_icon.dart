import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/validation.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

class TxtIfIcon extends StatelessWidget {
  final String txt;
  final String hint;
  final TextEditingController controller;
  final int maxLine;
  final bool isReadOnly;
  final bool? isCallForwarded;
  final TextInputType textInputType;
  final double leftPadding;
  final double rightPadding;
  final IconData prefixIc;
  final bool? isIconVisible;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? validationFunc;

  const TxtIfIcon({
    Key? key,
    required this.txt,
    required this.hint,
    required this.controller,
    required this.maxLine,
    required this.isReadOnly,
    this.isCallForwarded,
    required this.textInputType,
    required this.leftPadding,
    required this.rightPadding,
    required this.prefixIc,
    this.isIconVisible,
    this.contentPadding,
    this.validationFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 0, rightPadding, 0),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          //style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
          validator: (text) {
            return ((validationFunc ??
                (text) {
                  validateName(text);
                })(text ?? ''));
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: AppColor.greyColor7)),
            fillColor: AppColor.greyColor6,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: AppColor.grey30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: AppColor.grey30)),
            labelText: txt,
            //'Label text',
            hintText: hint,
            //"hint Text",
            contentPadding: contentPadding ?? EdgeInsets.zero,
            prefixIcon: !isIconVisible!
                ? null
                : Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Icon(
                      prefixIc,
                      size: 20,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
