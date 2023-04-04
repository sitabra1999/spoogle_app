import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';

import '../../../themes/app_color.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
            Image.asset("assets/images/app/app_logo.png", width: 80, height: 80, fit: BoxFit.contain),

            const Text(
              "Who are we!",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black70),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 3, bottom: 24),
              child: Text(
                "The best flutter_spoogle_app solution company",
                style: TextStyle(fontSize: 10, color: AppColor.black60),
              ),
            ),

            SizedBox(
              height: 500,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 22.0),
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      SizedBox(
                        width: getScreenWidth(context) - 100,
                        child: const Text(
                          "Our vision",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black70),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(top: 3, bottom: 8),
                        child: Text(
                          Strings.txtLoremIpsumBig,
                          style: TextStyle(fontSize: 12, color: AppColor.black60),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
