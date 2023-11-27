import 'package:flutter/material.dart';
class Score extends StatelessWidget {

  final bestScore;
  final score;

  Score({this.score, this.bestScore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset('lib/photos/TrofeoNegro.png', width: 60,),
              Text(
                score.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset('lib/photos/Trofeo_Dorado.png', width: 60,),
              Text(
                bestScore.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          )
        ]
      ),
    );
  }
}

