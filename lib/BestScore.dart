import 'package:flutter/material.dart';

import 'MainMenu2.dart';

class BestScore extends StatelessWidget{

  final myData;
  //final bool showScore;

  BestScore({required this.myData,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: Column(
                children: [
                  Container(
                  alignment: const Alignment(0, 1),
                    child:FilledButton(
                      onPressed: ()
                        {Navigator.push(
                          context,
                      MaterialPageRoute(builder: (context) => MainMenu2()),
                      );},
                      child: const Text('Main Menu'),
                    ),
                    ),
                  Expanded(child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: myData.length > 10 ? 10 : myData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          myData[index]['name'] + ' : ' + myData[index]['score'].toString(),
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize: 25,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 0.7
                                ..color = Colors.white
                          ),),
                        trailing: const SizedBox(
                          width: 1,
                          height: 1,
                        ),
                      );
                    },
                  ))
                ],
              ),
          )
        ),
            backgroundColor: Colors.amber,
        );
  }
}