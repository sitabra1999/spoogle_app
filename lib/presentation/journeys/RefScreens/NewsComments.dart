import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/data/core/api_constants.dart';
import 'package:flutter_spoogle_app/data/data_sources/api_functions.dart';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/data/models/StatusMessageApiResModel.dart';
import 'package:flutter_spoogle_app/data/models/Stories/StoriesDetailsApiResModel.dart';
import 'package:flutter_spoogle_app/presentation/libraries/comments_tree/uses/ChatInputField.dart';

import '../../libraries/comments_tree/comment_tree.dart';
import '../../themes/app_color.dart';

class NewsComments extends StatefulWidget {
  final List<Comments>? comment;
  final String? factsId;
  final Function() reloadData;
  final String? profilePicture;

  const NewsComments({Key? key, this.comment, this.factsId, required this.reloadData, this.profilePicture}) : super(key: key);

  @override
  State<NewsComments> createState() => _NewsCommentsState();
}

class _NewsCommentsState extends State<NewsComments> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemBuilder: (context, index) {
        return CommentTreeWidget<Comment, Comment>(
          Comment(
              avatar: widget.comment?[index].image,
              userName: widget.comment?[index].name ?? '',
              content: widget.comment?[index].comment ?? '',
              // for api parent id the comment id
              parentId: widget.comment?[index].id.toString() ?? '',
              postTime: widget.comment?[index].posttime ?? ''),
          (widget.comment?[index].children ?? [])
              .map((e) => Comment(
                  avatar: e.image,
                  userName: e.name,
                  content: e.comment,
                  parentId: e.parentId.toString() ?? '',
                  postTime: widget.comment?[index].posttime ?? ''))
              .toList(),
          treeThemeData: const TreeThemeData(lineColor: Colors.grey, lineWidth: 1),
          avatarRoot: (context, data) => PreferredSize(
            preferredSize: const Size.fromRadius(18),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                data.avatar ?? '',
              ),
            ),
          ),
          avatarChild: (context, data) => PreferredSize(
            preferredSize: const Size.fromRadius(12),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(data.avatar ?? ''),
            ),
          ),
          contentChild: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(AppColor.appCornerRadius4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.userName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.postTime}',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontWeight: FontWeight.w300, color: AppColor.grey, fontSize: 13),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                /* DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 8,
                        ),
                        Text('Like'),
                        SizedBox(
                          width: 24,
                        ),
                        Text('Reply'),
                      ],
                    ),
                  ),
                )*/
              ],
            );
          },
          contentRoot: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(AppColor.appCornerRadius4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.userName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.postTime}',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontWeight: FontWeight.w300, color: AppColor.grey, fontSize: 13),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                selectedIndex == index
                    ? ChatInputField(
                        profileImage: widget.profilePicture,
                        onSend: (val1, val2) {
                          sendComment(val1, data.parentId ?? '');
                          debugPrint('---- Val1: $val1');
                          debugPrint('---- parent id: ${data.parentId ?? ''}');
                        },
                      )
                    : Container(),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[700], fontWeight: FontWeight.bold),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 10),
                    child: InkWell(
                      child: const Text('Reply'),
                      onTap: () {
                        setState(() {
                          selectedIndex = selectedIndex == index ? -1 : index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: widget.comment?.length ?? 0,
    );
  }

  void sendComment(String comment, String parentId) async {
    try {
      StatusMessageApiResModel status = StatusMessageApiResModel();
      Map<String, dynamic> body = {};
      body['facts_id'] = widget.factsId;
      body['parent_id'] = parentId;
      body['user_id'] = await AppSharedPreferences().getUserId() ?? '0';
      body['comment'] = comment;
      await ApiFun.apiPostWithBody(ApiConstants.storiesComment, body).then((jsonData) {
        status = StatusMessageApiResModel.fromJson(jsonData);
      });

      if (status.status == 1) {
        widget.reloadData();
        debugPrint('---- Message: ${status.message}');
      }
    } catch (e) {
      debugPrint('---- Stories comment api error: $e');
    }
  }
}
