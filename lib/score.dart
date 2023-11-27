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
              Image.asset('lib/photos/nuticon.png', width: 60,),
              Text(
                score.toString(),
                style: const TextStyle(color: Colors.green, fontSize: 30),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset('lib/photos/nuticon.png', width: 45,),
              Text(
                bestScore.toString(),
                style: const TextStyle(color: Colors.green, fontSize: 30),
              )
            ],
          )
        ]
      ),
    );
  }
}

class BestScore extends StatelessWidget{

  final myData;
  final bool showScore;

  BestScore({this.myData, required this.showScore});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: showScore,
        child: Scaffold(
            body: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    myData[index]['name'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  subtitle: Text(
                    myData[index]['score'].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  trailing: const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                );
              },
            )
        )
    );
  }
}