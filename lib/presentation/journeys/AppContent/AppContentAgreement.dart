import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/strings.dart';

class AppContentAgreement extends StatefulWidget {
  const AppContentAgreement({Key? key}) : super(key: key);

  @override
  State<AppContentAgreement> createState() => _AppContentAgreementState();
}

class _AppContentAgreementState extends State<AppContentAgreement> {
  Color titleColor = Colors.grey.shade700;
  Color subtitleColor = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(34, 55, 34, 0,),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.only(right: 16, left: 12),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    child: const Icon(
                      Icons.featured_play_list_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERMS OF SERVICE',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor),
                      ),

                      Text(
                        'Last updated on April 2022',
                        style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.normal, color: subtitleColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding:EdgeInsets.only(left: 12),
              child: Divider(color: Colors.grey,),
            ),

            Flexible(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  padding: const EdgeInsets.only(top: 24),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        '${index + 1}.  Term',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: titleColor),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 14.0, bottom: 24),
                        child: Text(
                          Strings.txtLoremIpsumBig + Strings.txtLoremIpsumBig + "\n\n  " +Strings.txtLoremIpsumBig + "\n\n   " + Strings.txtLoremIpsumBig,
                          style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.normal, color: subtitleColor),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getScreenWidth(context)/3,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5),),
                  border: Border.all(color:AppColor.primaryColor, width: 2.0,),
                ),
                child: TextButton(
                  child: const Text(
                    "Decline",
                    style: TextStyle(color: AppColor.primaryColor, fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  onPressed: (){
                    edgeAlert(context, title: AppMessages.message.toLowerCase(), description:  AppMessages.agreementDecline,
                    icon: Icons.featured_play_list_outlined,);
                  },
                ),
              ),

              Container(
                width: getScreenWidth(context)/3,
                height: 45,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5),),
                ),
                child: TextButton(
                  child: const Text("Accept",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  onPressed: (){

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
