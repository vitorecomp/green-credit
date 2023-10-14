import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:creditoverde/ui/widgets/video_player_widget.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  _VideoScreenState createState() => _VideoScreenState();  
}

class _VideoScreenState extends State<VideoScreen> {

  final asset = 'assets/videos/main1.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
     VideoPlayerWidget(key: const Key("My Key"), controller: controller),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            const Spacer(),
            rightBarWidget(),
            bottomBarWidget(),
          ],
        ),
      )
    ]);
  }

  Widget rightBarWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      const Spacer(),
      Column(
        children: <Widget>[
          Image.asset(
            "assets/main/icons/icone_avatar.png",
            width: 70,
            height: 70,
          ),
          Image.asset(
            "assets/main/icons/icone_coracao.png",
            width: 70,
            height: 70,
          ),
          Image.asset(
            "assets/main/icons/icone_share.png",
            width: 70,
            height: 70,
          ),
          const Divider(
            height: 170,
          ),
        ],
      )
    ]);
  }

  Widget bottomBarWidget() {
    return Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/main/icons/icone_home.png",
                width: 70,
                height: 70,
              ),
            ),
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_friend.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_add.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_chat.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
            Image.asset(
              "assets/main/icons/icone_favorito.png",
              width: 70,
              height: 70,
            ),
            const Spacer(),
          ],
        ));
  }
}
