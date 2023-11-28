import 'package:dino_run/MainMenu2.dart';
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
                fontSize: 50,
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
                fontSize: 25,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 0.7
                  ..color = Colors.red
            ),
          ),
        ),
        Container(
          alignment: const Alignment(0, 0.5),
          child:FilledButton(
            onPressed: ()
            {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainMenu2()),
            );},
            child: const Text('Main Menu'),
          ),
        ),
      ],
    )
        : Container();
  }
}
