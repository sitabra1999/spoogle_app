import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/size_constants.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterSizer/flutter_sizer.dart';
import 'package:flutter_spoogle_app/presentation/widgets/ButtonCirclePlayWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../common/extensions/CommonFun.dart';
import '../AppContents/ProgressLibs/LoaderOverlay.dart';
import 'VideoPreview.dart';

class VideoThumbnailWidget extends StatefulWidget {
  //"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  final String videoUrl;
  final double size;

  const VideoThumbnailWidget({Key? key, required this.videoUrl,  required this.size}) : super(key: key);

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl,
      //videoPlayerOptions: VideoPlayerOptions(),
    )..initialize().then((_) {
        setState(() {}); //when your thumbnail will show.
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          width: getScreenWidth(context),
          height: Sizes.dimen_210.h,
          child: _controller.value.isInitialized ? VideoPlayer(_controller) : showSimpleLoaderOverlay(),
        ),
        ButtonCirclePlayWidget(
          size: widget.size,
          onTap: () {
            openScreen(context, VideoPreview(videoUrl: widget.videoUrl, file: XFile(""), peerUserId: ''));
          },
        ),
      ],
    );
  }
}
