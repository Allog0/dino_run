import 'package:flutter/material.dart';
class Score extends StatelessWidget {

  final bestScore;
  final score;

  Score({this.score, this.bestScore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset('lib/photos/nuticon.png', width: 60,),
              Text(
                score.toString(),
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset('lib/photos/nuticon.png', width: 45,),
              Text(
                bestScore.toString(),
                style: TextStyle(color: Colors.green, fontSize: 30),
              )
            ],
          )
        ]
      ),
    );
  }
}
