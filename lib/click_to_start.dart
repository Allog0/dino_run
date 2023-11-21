import 'package:flutter/material.dart';
class ClickToStart extends StatelessWidget {

  final bool gameHasStarted;

  ClickToStart({required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return gameHasStarted
      ? Container()
        : Stack(
      children: [
        Container(
          alignment: Alignment(0, 0),
          child: Image.asset('lib/photos/Miniatura.png'),
        ),
        Container(
          alignment: Alignment(0, -0.7),
          child: Text('Dino Game',
          style: TextStyle(
            color: Colors.green,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ],
    );
  }
}
