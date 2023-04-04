import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class ReferCodeInputWidget extends StatelessWidget {

  final String hint;
  final String applyBtnTxt;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function onTap;
  final TextEditingController controller;

  const ReferCodeInputWidget({
    Key? key,
    required this.hint,
    required this.applyBtnTxt,
    required this.textInputType,
    required this.onSaved,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColor.accentColor,
        border: Border.all(color: Colors.orange),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      margin: const EdgeInsets.fromLTRB(5.0, 8, 5.0, 12),
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              enabled: true,
              autocorrect: true,
              keyboardType: textInputType,
              controller: controller,
              onFieldSubmitted: (value){
                onSaved(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),


          InkWell(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              width: 65,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(applyBtnTxt,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            onTap: (){
              onTap();
            },
          ),

          Visibility(
            visible: applyBtnTxt == 'Applied',
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.check_circle_rounded,size: 26, color: Colors.orange,),
            ),
          ),
        ],
      ),
    );
  }
}
