import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VipassanaPage extends StatefulWidget {
  const VipassanaPage({super.key});

  @override
  State<VipassanaPage> createState() => _VipassanaPageState();
}

class _VipassanaPageState extends State<VipassanaPage> {
  final videoURL = "https://youtu.be/PvAEG5muUnU";
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
                  'Vipassana',
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
                        // reference： https://www.dhamma.org/en/about/vipassana
                        "\t\t\t\tVipassana, which means to see things as they really are, is one of India's most ancient techniques of meditation.\n\n\t\t\t\tVipassana is a way of self-transformation through self-observation. It focuses on the deep interconnection between mind and body, which can be experienced directly by disciplined attention to the physical sensations that form the life of the body, and that continuously interconnect and condition the life of the mind.\n\n\t\t\t\tTo practice, please find a quiet place and follow the instruction above. The video is about 15 minutes.",
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
