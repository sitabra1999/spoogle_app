
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/data/models/StatusMessageApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:flutter_spoogle_app/presentation/widgets/button.dart';
import 'package:flutter_spoogle_app/presentation/widgets/txt_input_field_icon.dart';

import '../../../common/extensions/validation.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: appBarIcBack(context, 'Forgot Password', Colors.transparent, false),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 24),
                child: Text(
                  "Enter your registered email address\nto get a new password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12,right: 12,left: 12),
                child: TxtIfIcon(
                  txt: "",
                  controller: _controller,
                  hint: _controller.text.isEmpty ? "Enter email here" : _controller.text,
                  isCallForwarded: false,
                  validationFunc: (text){
                    return validateEmail(_controller.text);
                  },
                  maxLine: 1,
                  isReadOnly: false,
                  textInputType: TextInputType.emailAddress,
                  leftPadding: 0,
                  rightPadding: 0,
                  isIconVisible: false,
                  contentPadding: const EdgeInsets.only(left: 10),
                  prefixIc: Icons.phone_android_sharp,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 36, right: 36, top: 75),
                child: Button(
                  text: "Send",
                  //bgColor: [const Color(0xFFEFE07D), const Color(0xFFB49839)],
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      edgeAlert(context, title: 'Warning', description: 'Please enter valid email number', gravity: Gravity.top);
                    } else {
                      doSubmit();
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void doSubmit() async {
    try{
      //showLottieLoadingDialog(context, 'Loading...', 'assets/animations/');

      Map<String, dynamic> body = {};
      body['email'] = _controller.text;

      await ApiFun.apiPostWithBody(ApiConstants.forgotPassword, body).then((jsonDecodeData) {
        StatusMessageApiResModel statusMessageApiResModel = StatusMessageApiResModel.fromJson(jsonDecodeData);
        edgeAlert(context, title: 'Message', description: statusMessageApiResModel.message!);
      });

    } catch(error){
      if (kDebugMode) {
        print("Error: $error");
      }
    }
  }
}
