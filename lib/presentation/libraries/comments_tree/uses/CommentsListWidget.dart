import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/presentation/libraries/CachedNetworkImage/cached_net_img.dart';


import '../../../../data/models/MediaVideo/VideoDetailsApiResModel.dart';
import '../../../themes/app_color.dart';

class CommentsListWidget extends StatelessWidget {
  final Function onTap;
  final List<Children>? comment;

  const CommentsListWidget({Key? key, required this.onTap, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: comment?.length,
        //physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                isThreeLine: false,
                contentPadding: const EdgeInsets.only(left: 12, top: 6),
                leading: cachedNetImgWithRadius(comment?[index].image ?? "", 35, 35, 25, BoxFit.cover),
                title: Text(
                  comment?[index].name ?? "",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.black),
                ),
                subtitle: Text(
                  comment?[index].comment ?? "",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.black60),
                ),
                onTap: () {},
              ),

              Text.rich(
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black54, fontSize: 11),
                TextSpan(
                  children: [
                    const WidgetSpan(
                      child: SizedBox(
                        width: 67,
                      ),
                    ),
                    const WidgetSpan(
                      child: Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(text: ' Posted ${comment?[index].posttime ?? ""}'),
                    const WidgetSpan(
                      child: SizedBox(
                        width: 24,
                      ),
                    ),
                    // const WidgetSpan(
                    //   child: Icon(
                    //     Icons.insert_comment_outlined,
                    //     size: 14,
                    //     color: Colors.black54,
                    //   ),
                    // ),
                    // const TextSpan(text: ""),
                    // const WidgetSpan(
                    //   child: SizedBox(
                    //     width: 24,
                    //   ),
                    // ),
                    // WidgetSpan(
                    //   child: InkWell(child:  const Text("  REPLY",
                    //     style: TextStyle(color: Colors.blue, fontSize: 11, fontWeight: FontWeight.bold),),
                    //     onTap:(){},
                    //   ),
                    // ),

                  ],
                ),
              ),
            ],
          );
        });
        }
}

