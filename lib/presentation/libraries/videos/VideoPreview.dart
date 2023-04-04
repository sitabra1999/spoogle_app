
import 'dart:io';

import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';


class VideoPreview extends StatefulWidget {
  final XFile file;
  final String peerUserId;
  final String videoUrl;

  const VideoPreview({Key? key, required this.file, required this.peerUserId, required this.videoUrl}) : super(key: key);



  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isVideoPlaying = false;
  double btnSize = 50;
  double iconSize = 20;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.

    if (Platform.isAndroid){
      _controller = VideoPlayerController.contentUri(Uri.parse(widget.file.path));
    } else if (Platform.isIOS){
      _controller = VideoPlayerController.file(convertToFile(widget.file));
    }

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);

    //_controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Preview"),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //debugPrint('---- Rec video path: ${widget.file.path}');
              if (widget.videoUrl.isNotEmpty) {
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              //aspectRatio: _controller.value.aspectRatio,
              aspectRatio: getScreenWidth(context) / getScreenHeight(context),
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return showSimpleLoaderOverlay();
          }
        },
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.black26,
          //mini: true,
          child: Icon(
            isVideoPlaying ? Icons.pause : Icons.play_arrow,
            size: 35,
          ),
          onPressed: () async {
          if (isVideoPlaying) {
            isVideoPlaying = false;
            await _controller.pause();
          } else {
            isVideoPlaying = true;
            await _controller.play();
          }
          setState(() {});
        },),
      ),
    );
  }
}
