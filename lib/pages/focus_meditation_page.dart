import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FocusMeditationPage extends StatefulWidget {
  const FocusMeditationPage({super.key});

  @override
  State<FocusMeditationPage> createState() => _FocusMeditationPageState();
}

class _FocusMeditationPageState extends State<FocusMeditationPage> {
  final videoURL = "https://youtu.be/o_SHRA0oxRQ";
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
                  'Focus Meditation',
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
                      // reference: https://www.masterclass.com/articles/focus-meditation
                      child: Text(
                        "\t\t\t\tFocus meditation, also known as focused attention meditation (FAM), is a type of mindfulness meditation that can help increase your awareness of the present moment. \n\n\t\t\t\tRather than attempt to empty the mind, this meditation style involves focusing your attention on an object or physical sensation, such as your breathing.\n\n\t\t\t\tTo increase the awareness, please find a quiet surrounding place and follow the instruction video above.\n\n\t\t\t\tThe video is around 10 minutes.",
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
