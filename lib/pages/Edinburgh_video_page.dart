import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EdinburghVideoPage extends StatefulWidget {
  const EdinburghVideoPage({super.key});

  @override
  State<EdinburghVideoPage> createState() => _EdinburghVideoPageState();
}

class _EdinburghVideoPageState extends State<EdinburghVideoPage> {
  final videoURL = "https://youtu.be/MXwBUPf0YyM";
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
                  'Edinburgh',
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
              playedColor: Colors.white,
              handleColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
