import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// https://youtu.be/YMx8Bbev6T4
// full screen reference: https://stackoverflow.com/questions/62670138/flutter-youtube-player-flutter-7-0-06-full-screen
class ForestVideoPage extends StatefulWidget {
  const ForestVideoPage({super.key});

  @override
  State<ForestVideoPage> createState() => _ForestVideoPageState();
}

class _ForestVideoPageState extends State<ForestVideoPage> {
  final videoURL = "https://youtu.be/xNN7iTA57jM";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          if (orientation != Orientation.landscape) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: const Text(
                  'Forest',
                  style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Center(child: YoutubeForestPlayer()),
            );
          } else {
            return Scaffold(
              body: YoutubeForestPlayer(),
            );
          }
        }),
      ),
    );
  }

  Widget YoutubeForestPlayer() {
    return Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => debugPrint('ready'),
        bottomActions: [
          CurrentPosition(),
          FullScreenButton(),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: Colors.green,
              handleColor: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
