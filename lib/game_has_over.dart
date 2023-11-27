import 'package:flutter/material.dart';
class GameHasOver extends StatelessWidget {

  bool gameHasOver;

  GameHasOver({required this.gameHasOver});

  @override
  Widget build(BuildContext context) {
    return gameHasOver
        ? Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.7),
          child: Text(
            'HAS PERDIDO',
            style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 65,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.7
                  ..color = Colors.red
            ),
          ),
        ),
        Container(
          alignment: const Alignment(0, -0.1),
          child: Text(
            'Vuelve a dar clic para volver a jugar',
            style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 45,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.7
                  ..color = Colors.red
            ),
          ),
        )
      ],
    )
        : Container();
  }
}
