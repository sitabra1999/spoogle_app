import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/validation.dart';

import '../themes/app_color.dart';

class IfPasswordShowHide extends StatelessWidget {
  final String txt;
  final String hint;
  final TextEditingController controller;
  final bool isPasswordVisible;
  final bool isCallForwarded;
  final TextInputType textInputType;
  final double leftPadding;
  final double rightPadding;
  final Function (bool isPasswordVisible) onTapOnView;
  final bool? isIconVisible;
  final double? topPadding;
  final EdgeInsetsGeometry? contentPadding;

  const IfPasswordShowHide({
    Key? key,
    required this.txt,
    required this.hint,
    required this.controller,
    required this.isPasswordVisible,
    required this.isCallForwarded,
    required this.textInputType,
    required this.leftPadding,
    required this.rightPadding,
    required this.onTapOnView, this.isIconVisible, this.topPadding, this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding,topPadding?? 24, rightPadding, 8),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          enabled: true,
          autocorrect: true,
          obscureText: isPasswordVisible? false : true,
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          validator: (text){
            return validatePass(text!);
          },
          decoration: InputDecoration(
            labelText: txt,
            hintText: hint,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: AppColor.greyColor7)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),borderSide: const BorderSide(color: AppColor.grey30)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4),borderSide: const BorderSide(color: AppColor.grey30)),
            fillColor: AppColor.greyColor6,
            contentPadding: contentPadding?? EdgeInsets.zero,
            prefixIcon: !isIconVisible!?null: const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Icon(Icons.lock_rounded, size: 20,),
            ),
            suffixIcon: InkWell(
              child: Icon( isPasswordVisible? Icons.visibility_outlined : Icons.visibility_off_outlined,color: AppColor.greyColor9,),
              onTap: (){
                onTapOnView(isPasswordVisible);
              },
            ),
          ),
        ),
      ),
    );
  }
}
