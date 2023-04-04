import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';

import '../../../../data/models/MediaVideo/VideoDetailsApiResModel.dart';
import '../../../journeys/RefScreens/NewsComments.dart';
import '../../../themes/app_color.dart';
import 'ChatInputField.dart';
import 'CommentsListWidget.dart';

class ReplyOnComment extends StatelessWidget {
  final List<Children>? comment;
  final Function() onTapOnReply;
  const ReplyOnComment({Key? key, required this.onTapOnReply, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(comment.toString());
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBarIcBack(context: context, text: "Replies", bgColor: Colors.white, isCenterTitle: false),
        const SizedBox(
          height: 16,
        ),
        ListTile(
          isThreeLine: false,
          contentPadding: const EdgeInsets.only(left: 12, top: 0),
          leading: cachedNetImgWithRadius(Strings.imgUrlPersonSmileCall2, 35, 35, 25, BoxFit.cover),
          title: const Text(
            "Elina Yusuf",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.black),
          ),
          subtitle: const Text(
            "You always give good advice. What would you say to someone?",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.black60),
          ),
          trailing: const Icon(Icons.reply,),
          onTap: (){
            onTapOnReply();
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 65, bottom: 3, right: 40),
          child: Divider(
            color: Colors.black26,
          ),
        ),
        const Text.rich(
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black54, fontSize: 11),
          TextSpan(
            children: [
              WidgetSpan(
                  child: SizedBox(
                    width: 65,
                  )),
              WidgetSpan(
                child: Icon(
                  Icons.access_time,
                  size: 14,
                  color: Colors.black54,
                ),
              ),
              TextSpan(text: "  Posted 5 hr ago"),
              WidgetSpan(
                  child: SizedBox(
                    width: 24,
                  )),
              WidgetSpan(
                child: Icon(
                  Icons.insert_comment_outlined,
                  size: 14,
                  color: Colors.black54,
                ),
              ),
              TextSpan(text: "  20 comments"),
            ],
          ),
        ),
        ChatInputField(
          onSend: (String msg, String msgType) {},
        ),

        SizedBox(
          height: 400,
          child: CommentsListWidget(
            comment: comment,
            onTap: (){},),
        ),

        /*SizedBox(
          height: 800,
          child: NewsComments(),
        ),*/
      ],
    );
  }
}
