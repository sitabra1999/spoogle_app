import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtPlayerWidget extends StatelessWidget {
  final String videoUrl;
  const YtPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: getYtVideoId(videoUrl),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      // videoProgressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
      ),
      onReady: () {
        // controller.addListener(listener);
      },
    );
  }

  String getYtVideoId(String url){
    return url.split('https://www.youtube.com/')[1];
  }
}
