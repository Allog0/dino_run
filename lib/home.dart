import 'package:flutter/material.dart';

import 'click_to_start.dart';
import 'dino.dart';
import 'score.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int score = 0;
  int bestScore = 0;
  bool gameHasStarted = false;

  double dinoX = -0.5;
  double dinoY = 1;
  double dinoWidth = 0.2;
  double dinoHeight = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Stack(
                  children: [

                    ClickToStart(
                      gameHasStarted: gameHasStarted,
                    ),

                    Score(
                      score: score,
                      bestScore: bestScore,
                    ),

                    Dino(
                      dinoX: dinoX,
                      dinoY: dinoY - dinoHeight,
                      dinoWidth: dinoWidth,
                      dinoHeight: dinoHeight,
                    ),

                  ],
                ),
              ),
          ),
          Expanded(
              child: Container(
                color: Colors.grey[600],
                child: Center(
                  child: Text(
                    'CODIGO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
