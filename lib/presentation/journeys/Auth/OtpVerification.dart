import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/presentation/libraries/OtpField/otp_text_field.dart';
import 'package:flutter_spoogle_app/presentation/libraries/OtpField/style.dart';

import '../../../common/extensions/CommonFun.dart';
import '../../libraries/AppContents/edge_alerts/edge_alerts.dart';
import '../../themes/app_color.dart';
import '../../widgets/button.dart';
import '../../widgets/txt.dart';
import '../../widgets/txt_if_ic_round.dart';

class OtpVerification extends StatefulWidget {
  final Function isProcessCompleted;

  const OtpVerification({Key? key, required this.isProcessCompleted}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  bool isOtpEnable = false;
  String btnTxt = 'sendOtp';
  late TextEditingController? _mobController;
  late TextEditingController? _otpController;


  @override
  void initState() {
    super.initState();
    _mobController = TextEditingController();
    _otpController = TextEditingController();

  }

  @override
  void dispose() {
    _mobController?.clear();
    _otpController?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Txt(txt: "Hello Akash!!", txtColor: Colors.black, txtSize: 26,
                fontWeight: FontWeight.bold, padding: 0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Txt(txt: "Please verify your mobile number", txtColor: Colors.black, txtSize: 14,
                fontWeight: FontWeight.normal, padding: 0,
              ),
            ),


            const Padding(
              padding: EdgeInsets.fromLTRB(32, 35, 35, 16),
              child: Text(
                "Thank you for registering. Please type the OTP as shared on your mobile number XXXXXXXX07",
                style: TextStyle(fontWeight: FontWeight.normal,),
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),


            SizedBox(
              width: 400,
              height: 100,
              child: OTPTextField(
                length: 4,
                fieldWidth: 40,
                spaceBetween: 24,
                outlineBorderRadius: 4,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textFieldAlignment: MainAxisAlignment.center,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  //print("Completed: " + pin);
                },
              ),
            ),

            InkWell(
                child: RichText(
                  softWrap: false,
                  textScaleFactor: 0.5,
                  textAlign: TextAlign.end,
                  //strutStyle: StrutStyle(),
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "OTP not received?  ", style: TextStyle(color: Colors.black54, fontSize: 28)),
                      TextSpan(text: "Resend", style: TextStyle(color: AppColor.border, fontWeight: FontWeight.bold, fontSize: 28)),
                    ],
                  ),
                ),
                onTap: () {
                  //openScreen(context, const SignUp());
                }
            ),

            Padding(
              padding: const EdgeInsets.only(left: 34, right: 34, top: 25, bottom: 35),
              child: Button(text: "VERIFY",
                onPressed: () {
                  if(_mobController!.text.isEmpty){
                    edgeAlert(context, title: 'Warning', description: 'Please enter mobile no.', gravity: Gravity.top);
                  } else if(_otpController!.text.isEmpty){
                    edgeAlert(context, title: 'Warning', description: 'Please enter OTP', gravity: Gravity.top);
                  } else {

                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
