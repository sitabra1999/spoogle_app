import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CountryCallCodePicker/fl_country_code_picker.dart';

import '../../common/extensions/validation.dart';
import '../themes/app_color.dart';

class IfMobCountry extends StatelessWidget {
  final Widget flagWidget;
  final String countryCode;
  final String txt;
  final String hint;
  final TextEditingController controller;
  final bool isReadOnly;
  final bool isCallForwarded;
  final TextInputType textInputType;
  final double leftPadding;
  final double rightPadding;
  final IconData prefixIc;
  final Color borderColor;
  final Function(CountryCode code) onCountryPicked;

  const IfMobCountry({
    Key? key,
    required this.flagWidget,
    required this.countryCode,
    required this.txt,
    required this.hint,
    required this.controller,
    required this.isReadOnly,
    required this.isCallForwarded,
    required this.textInputType,
    required this.leftPadding,
    required this.rightPadding,
    required this.prefixIc,
    required this.borderColor,
    required this.onCountryPicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 18, 0, 2),
      child: Row(
        children: [
          SizedBox(
            height: 47,
            width: 105,
            //padding: EdgeInsets.only(left: leftPadding),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              onPressed: () async {
                final code = await const FlCountryCodePicker().showPicker(context: context);
                if (code != null) {
                  onCountryPicked(code);
                }
              },
              label: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 3.0),
                    width: 20,
                    height: 20,
                    child: flagWidget,
                  ),
                  Text(countryCode, style: const TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
              style: ButtonStyle(
                //padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 25),),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: borderColor, width: 0.7))),
                //fixedSize: MaterialStateProperty.all<Size>(const Size(100, 80)),
                elevation: MaterialStateProperty.all<double>(0),
              ),
            ),
          ),
          SizedBox(
            width: getScreenWidth(context) - 156,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 5, rightPadding, 5),
              child: TextFormField(
                readOnly: isReadOnly,
                controller: controller,
                keyboardType: textInputType,
                validator: (text){ return validateMobileNumWithRgx(text!);},
                decoration: InputDecoration(
                  labelText: txt,
                  hintText: hint,
                  contentPadding: const EdgeInsets.only(left: 16),
                  suffixIcon: Icon(
                    prefixIc,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
