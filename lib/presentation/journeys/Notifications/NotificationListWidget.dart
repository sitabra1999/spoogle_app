import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';

import '../../themes/app_color.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: List.generate(22, (index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getIcons(),

                  const Text("    Order Received",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColor.black),
                  ),

                  SizedBox(
                    width: getScreenWidth(context) - 215,
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: (){},
                      icon: const Icon(Icons.delete_outline_rounded, size: 18,),
                    ),
                  )
                ],
              ),

              const Padding(
                padding: EdgeInsets.only( bottom: 6),
                child: Text("Your order #209994 received successfully. Please wait until we process your request",
                  style: TextStyle(color: Colors.black87, fontSize: 13),),
              ),

              const Align(
                alignment: Alignment.centerRight,
                child: Text("22-04-2022,   5:30 PM",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColor.black),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget getIcons() {
    String tabTitle = getRandomElementFromList();
    String icImg = "";
    switch(tabTitle){
      case "Order Confirmed":
        icImg = "assets/images/ic_png/order_pickedup.png";
        break;
      case "Order Pick Up":
        icImg = "assets/images/ic_png/orderPickedup.png";
        break;
      case "Order Rejected":
        icImg = "assets/images/ic_png/order_reject.png";
        break;
      case "Promotion":
        icImg = "assets/images/ic_png/offer2.png";
        break;
      default:
        icImg = "assets/images/ic_png/notification.png";
        break;
    }
    return Image.asset(icImg, width: 30, height: 30, fit: BoxFit.cover);
  }
}
