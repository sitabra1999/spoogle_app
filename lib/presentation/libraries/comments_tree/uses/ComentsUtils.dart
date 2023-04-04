import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';

import '../../../../data/models/MediaVideo/VideoDetailsApiResModel.dart';
import 'ReplyOnComment.dart';
import 'comments_step_one_widget.dart';

void showCommentBottomSheetDetails(BuildContext context, List<Children>? comment){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (builder){
        return
          Container(
            height: getScreenHeight(context) - 100,
            padding: const EdgeInsets.fromLTRB(12, 16, 24, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: ReplyOnComment(
              comment: comment,
              onTapOnReply: () {  },)
        );
      }
  );
}