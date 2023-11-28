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
          alignment: const Alignment(0, 0),
          child: Text(
            'Haz clic para empezar a jugar',
              style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.7
                    ..color = Colors.white
              ),
          ),
        ),
        Container(
          alignment: const Alignment(0, -0.7),
          child: Text('Dino Game',
            style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 55,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.7
                  ..color = Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
