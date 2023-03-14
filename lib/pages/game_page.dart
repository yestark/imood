import 'package:flutter/material.dart';
import 'white_noise_page.dart';
import 'hrv_page.dart';
import 'meditation_page.dart';
import 'home_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
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
        body: const Center(
          child: Text('This is Game.'),
        ));
  }
}
