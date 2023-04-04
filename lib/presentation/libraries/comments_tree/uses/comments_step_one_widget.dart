import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/data/models/MediaVideo/VideoDetailsApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';
import 'package:flutter_spoogle_app/presentation/libraries/comments_tree/comment_tree.dart';

import '../../../../data/core/api_constants.dart';
import '../../../../data/data_sources/api_functions.dart';
import '../../../../data/data_sources/data_source_shared_preferences.dart';
import '../../../../data/models/MediaVideo/VideoCommentApiResModel.dart';
import '../../../themes/app_color.dart';
import 'ChatInputField.dart';

class CommentsStepOneWidget extends StatelessWidget {
  final List<Comments>? comment;
  final String header;
  final String parentId;
  final String videoId;
  final Function(int index) onTapOnReply;

  const CommentsStepOneWidget({Key? key,

    required this.header,
    required this.onTapOnReply,
    this.comment, required this.parentId, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(" ---------:   ${comment![0].id}");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          header,
          style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          itemCount: comment!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              isThreeLine: false,
              contentPadding: const EdgeInsets.only(left: 12, top: 0),
              leading: cachedNetImgWithRadius(comment![index].image?? "", 35, 35, 25, BoxFit.cover),
              title: Text(
                comment![index].name?? "",
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.black),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment![index].comment?? "",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.black60),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 13,
                          color: Colors.black54,
                        ),
                        Text(' Posted ${comment![index].posttime?? ""}  ', style: const TextStyle(fontSize: 11),),
                        const Icon(
                          Icons.insert_comment_outlined,
                          size: 13,
                          color: Colors.black54,
                        ),
                        Text('  ${comment![index].children?.length.toString() ?? ""}', style: const TextStyle(fontSize: 11),),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.reply,),
              onTap: (){
                onTapOnReply(index);
              },
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 65, bottom: 3, right: 40),
          child: Divider(
            color: Colors.black26,
          ),
        ),
        ChatInputField(
          onSend: (val1, val2) {
            sendCommentOnVideo(val1, parentId);
          },
        ),
      ],
    );
  }

  void sendCommentOnVideo(String comment, String parentId) async {
    try {
      VideoCommentApiResModel status = VideoCommentApiResModel();
      Map<String, dynamic> body = {};
      body['video_id'] = videoId;
      body['parent_id'] = parentId;
      body['user_id'] = await AppSharedPreferences().getUserId() ?? '0';
      body['comment'] = comment;
      await ApiFun.apiPostWithBody(ApiConstants.mediaVideoComments, body).then((jsonData) {
        status = VideoCommentApiResModel.fromJson(jsonData);
      });

      if (status.status == 1) {
        //onTapOnReply(in);
        debugPrint('---- Message: ${status.message}');
      }
    } catch (e) {
      debugPrint('---- Stories comment api error: $e');
    }
  }
}
