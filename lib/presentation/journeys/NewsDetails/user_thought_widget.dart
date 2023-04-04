import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';

import '../../../data/core/api_constants.dart';
import '../../../data/data_sources/api_functions.dart';
import '../../../data/models/MediaVideo/VideoLikeApiResModel.dart';
import '../../libraries/AppContents/edge_alerts/edge_alerts.dart';
import '../../widgets/IcTxtXColumn.dart';

class UserThoughtWidget extends StatefulWidget {
  final String url;
  final String videoId;
  final String likes;
  final String views;
  final String totalComments;
  final String title;
  const UserThoughtWidget({Key? key,
    required this.url,
    required this.videoId,
    required this.likes,
    required this.views,
    required this.title,
    required this.totalComments}) : super(key: key);

  @override
  State<UserThoughtWidget> createState() => _UserThoughtWidgetState();
}

class _UserThoughtWidgetState extends State<UserThoughtWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(left: 24, right: 24),
      margin: const EdgeInsets.only(top: 24, bottom: 22),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.35),
        borderRadius: const BorderRadius.all(Radius.circular(AppColor.appCornerRadius4)),
        //border: Border.all(color: Colors.grey.shade300, width: 0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IcTxtXColumn(txt: widget.likes, ic: Icons.thumb_up, icColor: Colors.blue, onTap: () {
            giveLikeOnVideos(widget.videoId);
          }),
          IcTxtXColumn(txt: widget.views, ic: Icons.remove_red_eye, icColor: Colors.black54, onTap: () {}),
          IcTxtXColumn(
              txt: widget.totalComments,
              ic: Icons.rate_review_outlined,
              icColor: Colors.black54,
              onTap: () {
                // openScreen(context, const NewstotalComments());
              },
          ),
          IcTxtXColumn(txt: "Share", ic: Icons.share, icColor: Colors.black54, onTap: () {
            shareVideoNews(widget.title, widget.title, widget.url);
          }),
        ],
      ),
    );
  }

  void shareVideoNews(String? title, String? text, String? link) async {
    String shareLink = '$link';
    await FlutterShare.share(title: title ?? 'Spoogle', text: text ?? 'Spoogle text', linkUrl: shareLink);
  }

  void giveLikeOnVideos(String id) async {
    try {
      Map<String, dynamic> body = {};
      body['video_id'] = id;
      VideoLikeApiResModel videoLikeApiResModel = VideoLikeApiResModel();
      await ApiFun.apiPostWithBody(ApiConstants.mediaVideoLike, body).then((jsonData) {
        videoLikeApiResModel = VideoLikeApiResModel.fromJson(jsonData);
      });
      if (mounted) {
        edgeAlert(context, title: videoLikeApiResModel.message.toString());
      }
    } catch (e) {
      debugPrint('---- Video Like api error: $e');
    }
  }
}
