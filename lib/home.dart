import 'dart:async';

import 'package:dino_run/MainMenu2.dart';
import 'package:flutter/material.dart';

import 'Dificultad.dart';
import 'barricade.dart';
import 'click_to_start.dart';
import 'dino.dart';
import 'game_has_over.dart';
import 'score.dart';
class Home extends StatefulWidget {

  double dificultad;

  Home({
    required this.dificultad,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //int dificultad = 0;
  int score = 0;
  int bestScore = 0;
  bool gameHasStarted = false;
  bool gameHasOver = false;
  bool centralJump = false;
  bool dinoHasPassedBarricade = false;

  double gravity = 10;
  double height = 0;
  double time = 0;
  double velocity = 5;

  double dinoX = -0.5;
  double dinoY = 1;
  double dinoWidth = 0.2;
  double dinoHeight = 0.4;

  double barricadeX = 1;
  double barricadeY = 1;
  double barricadeWidth = 0.2;
  double barricadeHeight = 0.4;

  void startGame(){
    setState(() {
      gameHasStarted = true;
    });

    Timer.periodic(const Duration(milliseconds: 10), (timer)
    {
      double dificultad = widget.dificultad;
      if(detectForCollision())
      {
        gameHasOver = true;
        timer.cancel();
        setState(() {
          if(score > bestScore)
          {
            bestScore = score;
          }
        });
      }

      loopForBarricade();
      updateForScore();

      setState(() {
        barricadeX -= 0.015 + dificultad;
      });
    });
  }

  void updateForScore(){
    if(barricadeX < dinoX && dinoHasPassedBarricade == false)
    {
      setState(() {
        dinoHasPassedBarricade = true;
        score++;
      });
    }
  }

  void loopForBarricade(){
    setState(() {
      if(barricadeX <= -1.2)
      {
        barricadeX = 1.2;
        dinoHasPassedBarricade = false;
      }
    });
  }

  bool detectForCollision(){
    if(barricadeX <= dinoX + dinoWidth &&
    barricadeX + barricadeWidth >= dinoX &&
    dinoY >= barricadeY - barricadeHeight)
    {
      return true;
    }
    return false;
  }

  void jumpDino(){
    centralJump = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer){
      height = -gravity / 2 * time * time + velocity * time;

      setState(() {
        if(1 - height > 1)
        {
          resetJumpDino();
          dinoY = 1;
          timer.cancel();
        }
        else
        {
          dinoY = 1 - height;
        }
      });

      if(gameHasOver)
      {
        timer.cancel();
      }
      time += 0.01;
    });
  }

  void resetJumpDino(){
    centralJump = false;
    time = 0;
  }

  void playGameAgain(){
    setState(() {
      gameHasOver = false;
      gameHasStarted = false;
      barricadeX = 1.2;
      score = 0;
      dinoY = 1;
      centralJump = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasOver
          ? (playGameAgain)
          : (gameHasStarted ? (centralJump ? null : jumpDino) : startGame),
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
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

                      Barricade(
                        barricadeX: barricadeX,
                        barricadeY: barricadeY - barricadeHeight,
                        barricadeWidth: barricadeWidth,
                        barricadeHeight: barricadeHeight,
                      ),

                      GameHasOver(
                        gameHasOver: gameHasOver,
                      ),

                    ],
                  ),
                ),
            ),
            Expanded(
                child: Container(
                  color: Colors.grey[600],
                  child: const Center(
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
      ),
    );
  }
}
