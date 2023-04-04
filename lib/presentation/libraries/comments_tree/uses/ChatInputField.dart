
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

class ChatInputField extends StatelessWidget {
  final String? profileImage;
  final Function(String msg, String msgType, ) onSend;
  ChatInputField({Key? key, required this.onSend, this.profileImage}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16,),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12,),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 1,
            color: AppColor.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          cachedNetImgWithRadius(profileImage??Strings.imgUrlPersonSmileCall1, 38, 38, 25, BoxFit.cover),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20 * 0.75),
              decoration: BoxDecoration(
                color: Colors.blue.shade50.withOpacity(0.4),
                borderRadius: BorderRadius.circular(AppColor.appCornerRadius4),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade50.withOpacity(0.1),
                  hintText: "Write your comment here",
                  hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // const Icon(Icons.send, color: AppColor.primaryColor, size: 25,),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              //margin: const EdgeInsets.only(top: 16, left: 16),
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: const Icon(
                Icons.send,
                size: 20,
                color: Colors.blue,
              ),
            ),
            onTap: (){
              onSend(controller.text, "text");
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}