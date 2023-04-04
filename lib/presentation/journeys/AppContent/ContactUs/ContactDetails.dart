import 'package:flutter/material.dart';

import '../../../libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import '../../../themes/app_color.dart';
import '../../../widgets/ButtonOutlined.dart';
import '../../../widgets/IfUnderline.dart';
import '../../../widgets/review_txt.dart';
import '../../../widgets/txt_input_field_icon.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController msgController = TextEditingController();


  @override
  void dispose() {
    //LoaderOverlay.hide();
    super.dispose();
    phoneController.dispose();
    msgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Image.asset("assets/images/app/app_logo.png", width: 80, height: 80, fit: BoxFit.contain),
            ),

            const Text(
              "Write us your queries",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black70),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 3, bottom: 20),
              child: Text(
                "Will get back to you soon",
                style: TextStyle(fontSize: 10, color: AppColor.black60),
              ),
            ),

            ReviewTxtIf(
              txt: "Phone number", initialTxtValue: "", hint: "+91 965XXXXX65", maxLine: 1, onSaved: (txt){}, ic: Icons.call,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 40),
              child: ReviewTxtIf(
                txt: "Your message", initialTxtValue: "", hint: "Enter your message here", maxLine: 1, onSaved: (txt){}, ic: Icons.mail,
              ),
            ),

            ButtonOutlined(text: 'Submit', height: 35, width: 150, onPressed: () {
            }, bgColor: Colors.white, txtColor: AppColor.black,),

          ],
        ),
      ),
    );
  }
}
