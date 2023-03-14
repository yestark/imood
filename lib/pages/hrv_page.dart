import 'package:flutter/material.dart';
import 'white_noise_page.dart';
import 'game_page.dart';
import 'meditation_page.dart';
import 'home_page.dart';
import '../widgets/line_chart_widget.dart';

class HRVPage extends StatefulWidget {
  const HRVPage({super.key});

  @override
  State<HRVPage> createState() => _HRVPageState();
}

class _HRVPageState extends State<HRVPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Status',
          style: TextStyle(
            fontFamily: 'CrimsonText',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          child: Center(
            child: ListView(
              children: [
                Explaination(),
                TodayScore(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class Explaination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.topCenter,
      child: Center(
        child: SizedBox(
          width: 380,
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.blueGrey, width: 3),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: const Center(
                    child: Text(
                      'Score: 16 \nStatus: Overloaded',
                      style: TextStyle(
                        fontFamily: 'PTSans',
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.asset(
                    'assets/images/Bar.png',
                    height: 80.0,
                    width: 400.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodayScore extends StatefulWidget {
  const TodayScore({super.key});

  @override
  State<TodayScore> createState() => _TodayScore();
}

class _TodayScore extends State<TodayScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.blueGrey, width: 3),
        ),
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Today's Body Feedback",
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              // reference: https://youtu.be/LB7B3zudivI
              LineChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
