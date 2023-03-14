import 'package:flutter/material.dart';
import 'pages/white_noise_page.dart';
import 'pages/game_page.dart';
import 'pages/hrv_page.dart';
import 'pages/meditation_page.dart';
import 'pages/home_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'iMood';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MoodNevigationBar(),
    );
  }
}

// reference: https://www.youtube.com/watch?v=18PVdmBOEQM&t=124s
class MoodNevigationBar extends StatefulWidget {
  const MoodNevigationBar({super.key});
  @override
  State<MoodNevigationBar> createState() => _MoodNevigationBarState();
}

class _MoodNevigationBarState extends State<MoodNevigationBar> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    const GamePage(),
    const WhiteNoisePage(),
    const HomePage(),
    const MeditationPage(),
    const HRVPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: Color(0x00ffffff),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Game',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back),
            label: 'Video',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_rounded),
            label: 'White Noise',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Meditation',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Status',
            backgroundColor: Colors.transparent,
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
