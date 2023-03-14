import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProgressiveRelaxPage extends StatefulWidget {
  const ProgressiveRelaxPage({super.key});

  @override
  State<ProgressiveRelaxPage> createState() => _ProgressiveRelaxPageState();
}

class _ProgressiveRelaxPageState extends State<ProgressiveRelaxPage> {
  final videoURL = "https://youtu.be/SNqYG95j_UQ";
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
                  'Relaxation',
                  style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  YoutubeForestPlayer(),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(20.0),
                    child: const Card(
                      color: Colors.black,
                      // reference: https://www.webmd.com/sleep-disorders/muscle-relaxation-for-stress-insomnia
                      child: Text(
                        "\t\t\t\tProgressive muscle relaxation (PMR) is a deep relaxation technique that has been effectively used to control stress and anxiety, relieve insomnia, and reduce symptoms of certain types of chronic pain.\n\n\t\t\t\tProgressive muscle relaxation is based on the simple practice of tensing, or tightening, one muscle group at a time followed by a relaxation phase with release of the tension.\n\n\t\t\t\tTo practice, please find a quiet place and follow the instruction above.\n\n\t\t\t\tThe video is about 9 minutes.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
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
