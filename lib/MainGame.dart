import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainGame extends StatefulWidget{
  const MainGame({Key? key}): super(key:key);

  @override
  _MainGameState createState() => _MainGameState();

}

class _MainGameState extends State<MainGame>{
  //Variables Dino
  double dinoX = -0.5;
  double dinoY = 1;
  double dinoWidth = 0.2;
  double dinoHeight = 0.4;

  //Variables Obstáculos
  double barrierX = 1;
  double barrierY = 1;
  double barrierWidth = 0.1;
  double barrierHeight = 0.4;

  //Variables Salto
  double time = 0;
  double height = 0;
  double gravity = 10;
  double velocity = 5;

  //Variables Juego
  bool gameStarted = false;
  bool midJump = false;
  bool gameOver = false;
  int score = 0;
  int highScore = 0;
  bool dinoJumpedBarrier = false;

  void startGame(){
    setState(() {
      gameStarted = true;
    });

    Timer.periodic(const Duration(milliseconds: 10), (timer){
      if(detectCollision()){
        gameOver = true;
        timer.cancel();
        setState(() {
          if(score > highScore){
            highScore = score;
          }
        });
      }

      loopBarriers();

      updateScore();

      setState(() {
        barrierX -= 0.01;
      });
    });
  }

  void updateScore(){}

  void loopBarriers(){
    setState(() {
      if(barrierX<= -1.2){
        barrierX = 1.2;
        dinoJumpedBarrier = false;
      }
    });

  }

  bool detectCollision(){return false;}

  void jump(){
    midJump = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer){
      height = -gravity/2 * time * time + velocity * time;

      setState(() {
        if(1 - height > 1){
          resetJump();
          dinoY = 1;
          timer.cancel();
        } else{
          dinoY = 1 - height;
        }
      });

      if(gameOver){
        timer.cancel();
      }

      time += 0.01;
    });
  }

  void resetJump(){

  }

  void playAgain(){

  }



  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: gameOver
       ? (playAgain)
        : (gameStarted ? (midJump ? null : jump) : startGame),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Expanded(
              flex:2,
              child: Container(
                child:Center(
                  child: Stack(
                    children:[
                      TapToPlay(
                        gameHasStarted: gameStarted,
                      ),

                      GameOverScreen(
                        gameOver: gameOver,
                      ),

                      ScoreScreen(
                        score: score,
                        highScore: highScore,
                      ),

                      Dino(
                        dinoX: dinoX,
                        dinoY: dinoY - dinoHeight,
                        dinoWidth: dinoWidth,
                        dinoHeight: dinoHeight,
                      ),

                      Barrier(
                        barrierX: barrierX,
                        barrierY: barrierY - barrierHeight,
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight
                      ),
                    ]
                  )
                )
              )
            )
          ],
        )
      )
    );
  }
}