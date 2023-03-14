import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'game_page.dart';
import 'hrv_page.dart';
import 'meditation_page.dart';
import 'white_noise_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// reference: https://youtu.be/Pk56OnEMIqU
class _HomePageState extends State<HomePage> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  void setupPlaylist() async {
    await audioPlayer.open(Audio('assets/audio/light.mp3'), autoStart: false);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  Widget circularAudioPlayer(
      RealtimePlayingInfos realtimePlayingInfos, double screenWidth) {
    Color primaryColor = Colors.white;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 80),
        CircularPercentIndicator(
          radius: screenWidth / 4,
          arcType: ArcType.HALF,
          backgroundColor: primaryColor,
          progressColor: Colors.white,
          percent: realtimePlayingInfos.currentPosition.inSeconds /
              realtimePlayingInfos.duration.inSeconds,
          center: IconButton(
            iconSize: screenWidth / 8,
            color: primaryColor,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(realtimePlayingInfos.isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded),
            onPressed: () => audioPlayer.playOrPause(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/sea.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'iMood',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: audioPlayer.builderRealtimePlayingInfos(
            builder: ((context, realtimePlayingInfos) {
              if (realtimePlayingInfos != null) {
                return circularAudioPlayer(
                    realtimePlayingInfos, MediaQuery.of(context).size.width);
              } else {
                return Container();
              }
            }),
          ),
        ),
      ),
    ]);
  }
}
