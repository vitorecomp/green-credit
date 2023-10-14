import 'package:flutter/material.dart';
import 'package:creditoverde/ui/widgets/basic_overlay_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    required key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
     controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidget(key: const Key("overlay"), controller: controller)),
        ],
      );

  Widget buildVideoPlayer() => VideoPlayer(controller);
}
